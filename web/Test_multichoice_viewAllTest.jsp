<%-- 
    Document   : viewAllTest
    Created on : Nov 18, 2022, 11:55:25 AM
    Author     : Saing
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Kiểm Tra</title>
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="${pageContext.request.contextPath}/user/css/home.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- =======================================================
        * Template Name: Gp - v4.9.1
        * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <style>
        .dropdown-menu li:hover>a{
            background-color: #f5b8c5;
        }
    </style>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top" style="background-color: rgba(0,0,0,0.8);">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="HomeControl">JPD<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="user/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="HomeControl">Trang Chủ</a></li>
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
                                            <li><a href="KanjiControl?level=${w.level}">${w.level}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Ngữ Pháp</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="GrammarControl?level=${e.level}">${e.level}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="nav-link scrollto active"><span>Kiểm Tra</span> <i class="bi bi-chevron-down"></i></a>
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
                        <li><a class="nav-link scrollto" href="u-practice.html">Luyện Tập</a></li>
                        <li><a class="nav-link scrollto" href="u-forum.html">Cộng Đồng</a></li>
                        <li><a class="nav-link scrollto" href="u-forum.html">Liên Hệ</a></li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <ul>                   
                    <c:if test="${sessionScope.acc.role == 'Người dùng'}">
                        <!-- đã đăng nhập -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" style="color: white; padding-right:5px;" fill="currentColor" class="bi bi-envelope-exclamation" viewBox="0 0 17 17">
                        <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1.5a.5.5 0 0 1-1 0V11a.5.5 0 0 1 1 0Zm0 3a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Z"/>
                        </svg>
                        <a href="HomeControl" class="logo me-auto me-lg-0" ><img src="${sessionScope.acc.avatar}" alt="" class="rounded-circle"></a>
                        <a class="scrollto" href="account_profile.jsp" style="color: white">${sessionScope.acc.username}</a>
                    </c:if>

                    <c:if test="${sessionScope.acc.role != 'Người dùng'}">                  
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


        <main id="main">
            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>${type}</h2>
                        <ol>
                            <li><a href="HomeControl">Trang Chủ</a></li>
                            <li>Tất cả bài kiểm tra</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- ======= Services Section ======= -->
            <section id="services" class="services" style="background: #fff">
                <form action="${pageContext.request.contextPath}/showAllTestControl" method="post">
                    <div class="main">
                        <h1 class="text-center">Free Kanji Test Online - JPD</h1>
                        <h2 class="text-center des-title-content">N5 Kanji Test, N4 Kanji Test, N3 Kanji Test, N2 Kanji Test with answers</h2>

                        <div class="option-level row start-en">
                            <div class="col-sm-6 col-xs-12">
                                <h3 id="kanj_n5">
                                    N5 Kanji Test
                                    <span class="float-end"><i class="fas fa-circle"></i>15 minutes</span>
                                </h3>
                                <c:forEach items="${listTestN5}" var="o">
                                    <p>
                                        <a>N5 Kanji Test - ${o.name}</a>
                                        <a href="takeTestControl?testID=${o.testID}" class="btn">Start</a>
                                    </p>
                                </c:forEach>
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <h3 id="kanj_n5">
                                    N4 Kanji Test
                                    <span class="float-end"><i class="fas fa-circle"></i>15 minutes</span>
                                </h3>
                                <c:forEach items="${listTestN4}" var="i">
                                    <p>
                                        <a>N4 Kanji Test - ${i.name}</a>
                                        <a href="takeTestControl?testID=${i.testID}" class="btn">Start</a>
                                    </p>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="option-level row pt-4">
                            <div class="col-sm-6 col-xs-12">
                                <h3 id="kanj_n5">
                                    N3 Kanji Test
                                    <span class="float-end"><i class="fas fa-circle"></i>15 minutes</span>
                                </h3>
                                <c:forEach items="${listTestN3}" var="z">
                                    <p>
                                        <a>N3 Kanji Test - ${z.name}</a>
                                        <a href="takeTestControl?testID=${z.testID}" class="btn">Start</a>
                                    </p>
                                </c:forEach>
                            </div>
                            <div class="col-sm-6 col-xs-12">
                                <h3 id="kanj_n5">
                                    N2 Kanji Test
                                    <span class="float-end"><i class="fas fa-circle"></i>15 minutes</span>
                                </h3>
                                <c:forEach items="${listTestN2}" var="x">
                                    <p>
                                        <a>N2 Kanji Test - ${x.name}</a>
                                        <a href="takeTestControl?testID=${x.testID}" class="btn">Start</a>
                                    </p>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </form>
            </section><!-- End Services Section -->



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

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
