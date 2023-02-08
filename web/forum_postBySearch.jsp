<%-- 
    Document   : forum_postBySearch
    Created on : Nov 26, 2022, 12:54:45 PM
    Author     : ACER
--%>

<%@page import="Models.ForumAllPostWithComment"%>
<%@page import="Models.ForumReportNotification"%>
<%@page import="Models.ForumTopic"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.Forum.ReportNotificationDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Tìm Kiếm</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/user/img/logo.jpg" rel="icon">
        <link href="${pageContext.request.contextPath}/user/img/logo.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/user/vendor/aos/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Gp - v4.9.1
        * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top" style="background-color: rgba(0,0,0,0.8);">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="<%= request.getContextPath()%>/HomeControl">JPD<span>.</span></a></h1>
                
                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/HomeControl">Trang Chủ</a></li>
                        <li class="dropdown"><a href=""><span>Tài Liệu</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a><span>Bảng Chữ Cái</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listT}" var="q">
                                            <li><a href="<%= request.getContextPath()%>/AlphabetControl?type=${q.type}">${q.type}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Kanji</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="w">
                                            <li><a href="<%= request.getContextPath()%>/KanjiControl?levelID=${w.levelID}">${w.levelName}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Ngữ Pháp</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="<%= request.getContextPath()%>/GrammarControl?levelID=${e.levelID}">${e.levelName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="nav-link scrollto"><span>Kiểm Tra</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:forEach items="${listtag}" var="i">
                                    <li class="dropdown"><a><span>${i.desc}</span> <i class="bi bi-chevron-right"></i></a>
                                        <ul>
                                            <c:forEach items="${listlevel}" var="x">
                                                <li><a href="<%= request.getContextPath()%>/choiceTestControl?levelID=${x.levelID}&&tagID=${i.tagID}">${x.levelName}</a></li>
                                                </c:forEach> 
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Practice">Luyện Tập</a></li>
                        <li><a class="nav-link scrollto active" href="<%= request.getContextPath()%>/Forum">Cộng Đồng</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Chat">Hỗ Trợ</a></li>
                            <c:if test="${sessionScope.acc.role == 'Quản trị viên' || sessionScope.acc.role == 'Quản lí nội dung'}">
                            <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/dashboard.jsp">Quản Lý</a></li>
                            </c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <ul>
                    <c:if test="${sessionScope.acc.role == 'Người dùng' || sessionScope.acc.role == 'Quản trị viên' || sessionScope.acc.role == 'Quản lí nội dung'}">
                        <!-- đã đăng nhập -->

                        <a href="<%= request.getContextPath()%>/ProfileUserControl" class="logo me-auto me-lg-0" ><img src="<%= request.getContextPath()%>/${sessionScope.acc.avatar}" alt="" class="rounded-circle" width="40" height="40"></a>                        
                        <a class="username dropdown-toggle" data-bs-toggle="dropdown" style="color: white">${sessionScope.acc.username}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/ProfileUserControl">Tài Khoản</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/viewHistoryTest">Lịch Sử Kiểm Tra</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">Đăng Xuất</a></li>                            
                        </ul>
                    </c:if>

                    <c:if test="${sessionScope.acc.role != 'Người dùng' && sessionScope.acc.role != 'Quản trị viên' && sessionScope.acc.role != 'Quản lí nội dung'}">               
                        <a href="<%= request.getContextPath()%>/account_signup.jsp" class="get-started-btn scrollto">Đăng Ký</a>
                        <a href="<%= request.getContextPath()%>/account_login.jsp" class="get-started-btn scrollto">Đăng Nhập</a>
                    </c:if>
                </ul>
            </div>

            <style>
                .dropdown-menu li:hover>a{
                    background-color: #f5b8c5;
                }
            </style>
        </header><!-- End Header -->

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                        <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Bạn muốn đăng xuất ?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Hủy</button>
                        <a class="btn" style="background-color: #f5b8c5; color: white" href="<%= request.getContextPath()%>/LogoutControl">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>

        <main id="main" class="bg-light">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs bg-light">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 style="display: inline-block;">Cộng Đồng</h2>                            
                        </div>

                        <ol>                                                       
                            <li><a href="<%= request.getContextPath()%>/HomeControl">Trang Chủ</a></li>
                            <li>Cộng Đồng</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- Điền nội dung -->
            <div class="container">
                <div class="card box-shadow">
                    <div class="d-flex justify-content-center">
                        <div>
                            <p style="padding-left: 5px; padding-right: 5px; color: black; font-weight: bold; font-size: 1.2rem; display: inline-block">Chủ Đề: </p>
                            <a style="padding-left: 5px; padding-right: 5px; font-size: 1.2rem; display: inline-block" href="<%= request.getContextPath()%>/Forum">Tất Cả</a>
                            <%
                                //ResultSet allTopic = (ResultSet) session.getAttribute("allTopic");
                                //while (allTopic.next()) {
                                List<ForumTopic> t = (List<ForumTopic>) session.getAttribute("allTopic");
                                for (int i = 0; i < t.size(); i++) {
                                
                            %>
                            <a style="padding-left: 5px; padding-right: 5px; font-size: 1.2rem; display: inline-block" href="<%= request.getContextPath()%>/OneTopic/<%= t.get(i).getTopic_id() %>">|<%= t.get(i).getTopic_name() %>|</a>
                            <%
                                //}
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <br>

            <div class="container">
                <div class="card box-shadow">
                    <div class="d-flex justify-content-between align-items-center">
                        <%
                            User u = (User) session.getAttribute("acc");
                            if (u != null) {
                        %>
                        <div>
                            <a href="<%= request.getContextPath()%>/NewPost" class="btn" style="background-color: #f5b8c5; color: white" role="button">Tạo Bài Đăng Mới</a>
                            <%
                                //int userID = u.getUserID();
                                //ResultSet notReadNotification = ReportNotificationDAO.getAllReportNotificationByUserIDNotRead(userID);
                                //request.setAttribute("notReadNotification", notReadNotification);
                                //ResultSet notReadNotification = (ResultSet) session.getAttribute("notReadNotification");
                                //if (notReadNotification.next() == false) {
                                List<ForumReportNotification> notReadNotification = (List<ForumReportNotification>) session.getAttribute("notReadNotification");
                                if(notReadNotification.isEmpty()){
                            %>
                            <a href="<%= request.getContextPath()%>/ForumNotification/<%= u.getUserID()%>" style="color: black; padding-left: 10px; padding-right: 10px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                                </svg>                              
                            </a>
                            <%
                            } else {
                            %>
                            <a href="<%= request.getContextPath()%>/ForumNotification/<%= u.getUserID()%>" style="color: red; padding-left: 10px; padding-right: 10px;">
                               <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                                </svg>
                            </a>
                            <%
                                }
                            %>
                        </div>
                        <%
                        } else {
                        %>
                        <div></div>
                        <%
                            }
                        %>
                        <form class="d-flex" role="search" onsubmit="window.location = '<%= request.getContextPath()%>/SearchPost/' + search.value; return false;">
                            <input required="required" maxlength="100" class="form-control me-2" type="search" placeholder="Tìm Kiếm" name="search" aria-label="Search">
                            
                        </form>
                    </div>
                </div>
                <br>

                <%
                    //ResultSet rs = (ResultSet) session.getAttribute("allSearchPost");
                    //while (rs.next()) {
                    List<ForumAllPostWithComment> f = (List<ForumAllPostWithComment>) session.getAttribute("allSearchPost");
                    for (int i = 0; i < f.size(); i++) {
                        

                %>
                <div onclick="location.href = '<%= request.getContextPath()%>/Post/<%= f.get(i).getTopic_id()%>';" style="cursor: pointer;">
                        <div class="card mb-4 box-shadow">
                            <div class="card-body">
                                <div class="d-flex">
                                    <img src="<%= request.getContextPath()%>/<%= f.get(i).getAvatar()%>" class="rounded-circle" alt="" width="40" height="40">
                                    <p class="text-muted p-2"><%= f.get(i).getUsername()%></p>
                                    <p class="text-muted ms-auto p-2"><%= f.get(i).getPost_date().substring(0, Math.min(f.get(i).getPost_date().length(), 19))%></p>
                                </div>                            
                            </div>
                            <div class="card-body" >
                                <h3 style="display: inline-block" class="card-text"><%= f.get(i).getPost_title()%></h3>
                                <a style="color: blue" class="card-text" href="<%= request.getContextPath()%>/OneTopic/<%= f.get(i).getTopic_id()%>">#<%= f.get(i).getTopic_name()%></a>
                                <p class="card-text"><%= f.get(i).getPost_content()%></p>
                                <p class="card-text">Số Bình Luận: <%= f.get(i).getComment_count()%></p>
                            </div>

                        </div>
                    </div>
                <%
                    }
                %>
            </div>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <jsp:include page="footer_user.jsp" />

        <!-- Vendor JS Files -->
        <script src="${pageContext.request.contextPath}/user/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/aos/aos.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/user/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="${pageContext.request.contextPath}/user/js/main.js"></script>

    </body>

</html>