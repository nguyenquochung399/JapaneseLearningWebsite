<%-- 
    Document   : notification_details
    Created on : Nov 28, 2022, 4:23:04 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.Notification"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Bảng Tin</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

        <link href="${pageContext.request.contextPath}/notification/css/notification_details.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/notification/js/notification_details.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top" style="background-color: rgba(0,0,0,0.8);">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="<%= request.getContextPath()%>/HomeControl">JPD<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="user/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/HomeControl">Trang Chủ</a></li>
                        <li class="dropdown"><a href=""><span>Tài Liệu</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a><span>Bảng Chữ Cái</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listT}" var="q">
                                            <li><a href="AlphabetControl?type=${q.type}">${q.type}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Kanji</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="w">
                                            <li><a href="KanjiControl?levelID=${w.levelID}">${w.levelName}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Ngữ Pháp</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="GrammarControl?levelID=${e.levelID}">${e.levelName}</a></li>
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
                                                <li><a href="choiceTestControl?levelID=${x.levelID}&&tagID=${i.tagID}">${x.levelName}</a></li>
                                                </c:forEach> 
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Practice">Luyện Tập</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Forum">Cộng Đồng</a></li>
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

                        <a href="ProfileUserControl" class="logo me-auto me-lg-0" ><img src="${pageContext.request.contextPath}/${sessionScope.acc.avatar}" alt="" class="rounded-circle" width="40" height="40"></a>                        
                        <a class="username dropdown-toggle" data-bs-toggle="dropdown" style="color: white">${sessionScope.acc.username}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ProfileUserControl">Tài Khoản</a></li>
                            <li><a class="dropdown-item" href="viewHistoryTest">Lịch Sử Kiểm Tra</a></li>
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

        <main id="main" class="">
            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs bg-light">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 style="display: inline-block;">Thông Báo</h2>                            
                        </div>

                        <ol>                                                       
                            <li><a href="<%= request.getContextPath()%>/HomeControl">Trang Chủ</a></li>
                            <li>Thông Báo</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->


            <%
                Notification cNotification = (Notification) session.getAttribute("cNotification");
                User nPoster = (User) session.getAttribute("nPoster");

                String cTitle = null;
                String cDetails = null;
                String cTime = null;
                String cPoster = null;
                if (cNotification != null) {
                    cTitle = cNotification.getTitle();
                    cDetails = cNotification.getDetails().replace("\r\n", "<br>");
                    cTime = cNotification.getTime();
                    cPoster = nPoster.getUsername();
                }

            %>

            <div class="row">            
                <div class="main">
                    <div class="main-section">
                        <span id="title" style="font-weight: bold; font-size: 32px; word-break: break-word;"><%=cTitle%></span><br>
                        <span id="time" style="font-style: italic; font-size: 16px; word-break: break-word;">Đăng bởi <%=cPoster%> vào <%=cTime%></span><br><br><br>
                        <span id="details" style="font-size: 18px; word-break: break-word;"><%=cDetails%></span><br><br>
                        <br><span><a href="<%= request.getContextPath()%>/HomeControl" id="back-home-btn">Quay lại Trang chủ</a>
                    </div>
                </div>
                <div class="side">
                    <div class="side-section" id="notif-container">
                        <h2>Bảng Tin</h2>
                        <%                        // Get All Notification
                            int loadLimit = 5;
                            int pageLimit = 3;
                            int notifCount = 0;
                            int totalNotifCount;
                            ArrayList<Notification> nList = (ArrayList<Notification>) session.getAttribute("allNotification");
                            for (Notification n : nList) {
                                int id = n.getNotificationID();
                                String title = n.getTitle();
                                String time = n.getTime();
                                int status = n.getStatus();
                                if (status == 0) {
                                    notifCount = notifCount + 1;
                                    if (notifCount <= loadLimit) {
                        %>
                        <div class="notif-title-container" id="notif-title-container-id-<%=notifCount%>"><a href="<%=request.getContextPath()%>/Notification/<%=id%>" class="notif-title" id="notif-title-id-<%=notifCount%>"><span><%=time%></span><span> - </span><span class="notif-title-span"><%=title%></span></a><br></div>
                                    <%
                                    } else {
                                    %>
                        <div class="notif-title-container" id="notif-title-container-id-<%=notifCount%>"  style="display: none;"><a href="<%=request.getContextPath()%>/Notification/<%=id%>" class="notif-title" id="notif-title-id-<%=notifCount%>"><span><%=time%></span><span> - </span><span class="notif-title-span"><%=title%></span></a><br></div>
                                    <%
                                                }
                                            }
                                        }
                                        totalNotifCount = notifCount;
                                    %>
                        <br><br><div class="pagination">
                            <a href="javascript:void(0);" onclick="prevPage()" class="prevNext" id="prevPage">Trước</a>
                            <a href="javascript:void(0);" onclick="loadPage(1)" id="page-num-1" class="page-num active">1</a>
                            <%
                                int pageCount;

                                if (totalNotifCount % loadLimit == 0) {
                                    pageCount = totalNotifCount / loadLimit;
                                } else {
                                    pageCount = (totalNotifCount / loadLimit) + 1;
                                }

                                for (int i = 2; i <= pageCount; i++) {
                                    if (i <= pageLimit) {
                            %>
                            <a href="javascript:void(0);" onclick="loadPage(<%=i%>)" id="page-num-<%=i%>" class="page-num"><%=i%></a>
                            <%
                            } else {
                            %>
                            <a href="javascript:void(0);" onclick="loadPage(<%=i%>)" id="page-num-<%=i%>" class="page-num"><%=i%></a>
                            <%
                                    }
                                }
                            %>
                            <a href="javascript:void(0);" onclick="nextPage()" class="prevNext" id="nextPage">Sau</a>
                        </div>
                        <div id="load-limit" hidden><%=loadLimit%></div>
                        <div id="page-limit" hidden><%=pageLimit%></div>
                        <div id="page-count" hidden><%=pageCount%></div>
                    </div>
                </div>
            </div>

        </main>

        <!-- ======= Footer ======= -->
        <jsp:include page="footer_user.jsp" />
        <!-- End Footer -->

        

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
