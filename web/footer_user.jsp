<%-- 
    Document   : footer_user
    Created on : 24-Nov-2022, 22:49:04
    Author     : A Hi
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row d-flex justify-content-center">

                        <div class="col-lg-3 col-md-6">
                            <div class="footer-info">
                                <h3>JPD<span>.</span></h3>
                                <p>
                                    600 Nguyễn Văn Cừ <br>
                                    An Bình, Cần Thơ<br><br>
                                    <strong>Số Điện Thoại:</strong> 0349554811<br>
                                    <strong>Email:</strong> noreply.jpd@gmail.com<br>
                                </p>
                                <div class="social-links mt-3">
                                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                    <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Dành Cho Bạn</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/HomeControl">Trang Chủ</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/AlphabetControl?type=Hiragana">Tài Liệu</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/choiceTestControl?levelID=1&&tagID=1">Kiểm Tra</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/Practice">Luyện Tập</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/Forum">Cộng Đồng</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Dịch Vụ Của Chúng Tôi</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/Footer_Community">Nguyên Tắc Cộng Đồng</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/Footer_PrivacySecurity">Quyền Riêng Tư Và Bảo Mật</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer><!-- End Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short" style="color: black"></i></a>

    </body>
</html>