<%-- 
    Document   : home
    Created on : 24-Nov-2022, 21:07:17
    Author     : A Hi
--%>

<%@page import="Models.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOs.Notification.NotificationDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Trang Chủ</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="user/img/logo.jpg" rel="icon">
        <link href="user/img/logo.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="user/vendor/aos/aos.css" rel="stylesheet">
        <link href="user/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="user/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="user/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="user/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="user/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="user/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="user/css/style.css" rel="stylesheet">

        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- CSS and JS for Notification -->
        <link href="notification/css/home_notification.css" rel="stylesheet" type="text/css"/>
        <script src="notification/js/home_notification.js" type="text/javascript"></script>

        <!-- =======================================================
        * Template Name: Gp - v4.9.1
        * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="HomeControl">JPD<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="user/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="HomeControl">Trang Chủ</a></li>
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
                        <li><a class="nav-link scrollto " href="<%= request.getContextPath()%>/Practice">Luyện Tập</a></li>
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
                        <a href="account_signup.jsp" class="get-started-btn scrollto">Đăng Ký</a>
                        <a href="account_login.jsp" class="get-started-btn scrollto">Đăng Nhập</a>
                    </c:if>
                </ul>

            </div>

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
                        <a class="btn" style="background-color: #f5b8c5; color: white" href="LogoutControl">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center justify-content-center">
            <div class="container" data-aos="fade-up">

                <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                    <div class="col-xl-6 col-lg-8">
                        <h1>JPD<span>.</span></h1>
                        <h2>Học tiếng Nhật miễn phí và hiệu quả</h2>
                    </div>
                </div>

                <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
                    <div class="col-xl-2 col-md-4">
                        <div class="icon-box">
                            <i class="bi bi-house"></i>
                            <h3><a href="HomeControl">Trang Chủ</a></h3>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-4">
                        <div class="icon-box">
                            <i class="bi bi-file-earmark-text"></i>
                            <h3><a href="AlphabetControl?type=Hiragana">Tài Liệu</a></h3>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-4">
                        <div class="icon-box">
                            <i class="bi bi-card-checklist"></i>
                            <h3><a href="choiceTestControl?levelID=1&&tagID=1">Kiểm Tra</a></h3>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-4">
                        <div class="icon-box">
                            <i class="bi bi-journal-arrow-up"></i>
                            <h3><a href="<%= request.getContextPath()%>/Practice">Luyện Tập</a></h3>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-4">
                        <div class="icon-box">
                            <i class="bi bi-chat-left-quote"></i>
                            <h3><a href="<%= request.getContextPath()%>/Forum">Cộng Đồng</a></h3>
                        </div>
                    </div>
                </div>

            </div>
        </section><!-- End Hero -->

        <main id="main">

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                            <img src="user/img/about.jpg" class="img-fluid" alt="" width="90%">
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100" style="margin-top: 100px">
                            <div class="row">            
                                <div class="main">
                                    <div class="main-section" id="notif-container">
                                        <h3>Bảng Tin</h3><br>
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
                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->

            <!-- ======= Features Section ======= -->
            <section id="features" class="features">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="image col-lg-6" style='background-image: url("user/img/3.jpg");' data-aos="fade-right"></div>
                        <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
                            <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
                                <i class="bi bi-file-earmark-text"></i>
                                <h4>Tài Liệu</h4>
                                <p>Tra cứu bảng chữ cái, kanji theo cấp độ và ngữ pháp theo cấp độ</p>
                            </div>
                            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                <i class="bi bi-card-checklist"></i>
                                <h4>Kiểm Tra</h4>
                                <p>Thử sức với những bài thi JLPT ở mọi cấp độ</p>
                            </div>
                            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                <i class="bi bi-journal-arrow-up"></i>
                                <h4>Luyện Tập</h4>
                                <p>Trau dồi kiến thức tiếng Nhật mọi kỹ năng</p>
                            </div>
                            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
                                <i class="bi bi-chat-left-quote"></i>
                                <h4>Cộng Đồng</h4>
                                <p>Tham gia cộng đồng để trao đổi, giải đáp thắc mắc về tiếng Nhật</p>
                            </div>
                        </div>
                    </div>

                </div>
            </section><!-- End Features Section -->

            <!-- ======= Testimonials Section ======= -->
            <section id="testimonials" class="testimonials">
                <div class="container" data-aos="zoom-in">

                    <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="user/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                    <h3>Saul Goodman</h3>
                                    <h4>Ceo &amp; Founder</h4>
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        自分の生きる人生を愛せ。自分の愛する人生を生きろ。
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="user/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                    <h3>Sara Wilsson</h3>
                                    <h4>Designer</h4>
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        自分の行為に責任を持つべきだ。
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="user/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                    <h3>Jena Karlis</h3>
                                    <h4>Store Owner</h4>
                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        すべては練習のなかにある。
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </section><!-- End Testimonials Section -->

            <!-- ======= Team Section ======= -->
            <section id="team" class="team">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Nhóm phát triển JPD</h2>
                    </div>

                    <div class="row">

                        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                            <div class="member" data-aos="fade-up" data-aos-delay="100">
                                <div class="member-img">
                                    <img src="images/hung.jpg" class="img-fluid" alt="" width="300px">
                                    <div class="social">                                       
                                        <a href="https://www.facebook.com/hung.nguyenquoc.5686"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>                                       
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Nguyễn Quốc Hưng</h4>
                                    <span>Trưởng nhóm</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                            <div class="member" data-aos="fade-up" data-aos-delay="200">
                                <div class="member-img">
                                    <img src="images/tam.jpg" class="img-fluid" alt="" width="400px">
                                    <div class="social">                                       
                                        <a href="https://www.facebook.com/ahi812/"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>                                       
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Nguyễn Thanh Tâm</h4>
                                    <span>Thành viên</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                            <div class="member" data-aos="fade-up" data-aos-delay="300">
                                <div class="member-img">
                                    <img src="images/tan.jpg" class="img-fluid" alt="" width="400px">
                                    <div class="social">                                        
                                        <a href="https://www.facebook.com/nomoto.atarashii"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>                                       
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Nguyễn Mạnh Tân</h4>
                                    <span>Thành viên</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                            <div class="member" data-aos="fade-up" data-aos-delay="400">
                                <div class="member-img">
                                    <img src="images/sang.jpg" class="img-fluid" alt="" width="300px">
                                    <div class="social">                                       
                                        <a href="https://www.facebook.com/sang.nguyenlam.58"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>                                       
                                    </div>
                                </div>
                                <div class="member-info">
                                    <h4>Nguyễn Lâm Sang</h4>
                                    <span>Thành viên</span>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Team Section -->

        </main><!-- End #main -->

        <jsp:include page="footer_user.jsp" />



        <!-- Vendor JS Files -->
        <script src="user/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="user/vendor/aos/aos.js"></script>
        <script src="user/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="user/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="user/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="user/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="user/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="user/js/main.js"></script>

    </body>

</html>
