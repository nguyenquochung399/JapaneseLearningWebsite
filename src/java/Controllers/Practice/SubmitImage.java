/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Practice;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author ACER
 */
public class SubmitImage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubmitImage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitImage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String imageBase64 = request.getParameter("imageBase64");
        imageBase64 = imageBase64.split(",")[1];
        byte[] data = Base64.decodeBase64(imageBase64);
        String folder = "upload";
        String dirUrl = request.getServletContext()
                .getRealPath("") + "/" + folder;
        File dir = new File(dirUrl);
        if (!dir.exists()) {
            dir.mkdir();
        }
        String nameimg = "word.png";
        try (OutputStream stream = new FileOutputStream(dirUrl + "/" + nameimg)) {
            stream.write(data);
        }

        //Save file as jpg - Test
        String nameimg2 = "word.jpg";
        Path source = Paths.get(dirUrl + "/" + nameimg);
        Path target = Paths.get(dirUrl + "/" + nameimg2);

        BufferedImage originalImage = ImageIO.read(source.toFile());

        // jpg needs BufferedImage.TYPE_INT_RGB
        // png needs BufferedImage.TYPE_INT_ARGB
        // create a blank, RGB, same width and height
        BufferedImage newBufferedImage = new BufferedImage(
                originalImage.getWidth(),
                originalImage.getHeight(),
                BufferedImage.TYPE_INT_RGB);

        // draw a white background and puts the originalImage on it.
        newBufferedImage.createGraphics()
                .drawImage(originalImage,
                        0,
                        0,
                        Color.WHITE,
                        null);

        // save an image
        ImageIO.write(newBufferedImage, "jpg", target.toFile());

        Tesseract tesseract = new Tesseract();
        try {
            String filePath = getServletContext().getRealPath("") + "/tessdata";
            tesseract.setDatapath(filePath);
            tesseract.setLanguage("jpn");
            String text = tesseract.doOCR(new File(dirUrl + "/" + nameimg));
            //char firstChar = text.charAt(0);
            //System.out.print(text);
            if (text.equals("")) {
                text = "";
            } else {
                text = text.substring(0, 1);
            }
            HttpSession session = request.getSession();
            session.setAttribute("recognizeWord", text);
            session.setAttribute("imageBase64", request.getParameter("imageBase64"));
            request.getRequestDispatcher("practice.jsp").forward(request, response);
        } catch (TesseractException e) {
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
