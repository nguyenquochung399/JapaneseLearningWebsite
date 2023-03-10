<%-- 
    Document   : Test_HistroyTest
    Created on : Dec 1, 2022, 12:32:45 AM
    Author     : Saing
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Alphabet</title>
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

                <h1 class="logo me-auto me-lg-0"><a href="HomeControl">JPD<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="user/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="HomeControl">Trang Ch???</a></li>
                        <li class="dropdown"><a href=""><span>T??i Li???u</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a><span>B???ng Ch??? C??i</span> <i class="bi bi-chevron-right"></i></a>
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
                                <li class="dropdown"><a><span>Ng??? Ph??p</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="GrammarControl?levelID=${e.levelID}">${e.levelName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="nav-link scrollto active"><span>Ki???m Tra</span> <i class="bi bi-chevron-down"></i></a>
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
                        <li><a class="nav-link scrollto " href="<%= request.getContextPath()%>/Practice">Luy???n T???p</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Forum">C???ng ?????ng</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Chat">H??? Tr???</a></li>
                            <c:if test="${sessionScope.acc.role == 'Qu???n tr??? vi??n' || sessionScope.acc.role == 'Qu???n l?? n???i dung'}">
                            <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/dashboard.jsp">Qu???n L??</a></li>
                            </c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <ul>
                    <c:if test="${sessionScope.acc.role == 'Ng?????i d??ng' || sessionScope.acc.role == 'Qu???n tr??? vi??n' || sessionScope.acc.role == 'Qu???n l?? n???i dung'}">
                        <!-- ???? ????ng nh???p -->

                        <a href="ProfileUserControl" class="logo me-auto me-lg-0" ><img src="${sessionScope.acc.avatar}" alt="" class="rounded-circle" width="40" height="40"></a>                        
                        <a class="username dropdown-toggle" data-bs-toggle="dropdown" style="color: white">${sessionScope.acc.username}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ProfileUserControl">T??i Kho???n</a></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/viewHistoryTest">L???ch S??? Ki???m Tra</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">????ng Xu???t</a></li>                            
                        </ul>
                    </c:if>

                    <c:if test="${sessionScope.acc.role != 'Ng?????i d??ng' && sessionScope.acc.role != 'Qu???n tr??? vi??n' && sessionScope.acc.role != 'Qu???n l?? n???i dung'}">               
                        <a href="account_signup.jsp" class="get-started-btn scrollto">????ng K??</a>
                        <a href="account_login.jsp" class="get-started-btn scrollto">????ng Nh???p</a>
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
                        <h5 class="modal-title" id="exampleModalLabel">Th??ng B??o</h5>
                        <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">??</span>
                        </button>
                    </div>
                    <div class="modal-body">B???n mu???n ????ng xu???t ?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">H???y</button>
                        <a class="btn" style="background-color: #f5b8c5; color: white" href="LogoutControl">????ng Xu???t</a>
                    </div>
                </div>
            </div>
        </div>


        <main id="main">
            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs bg-light">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 style="display: inline-block;">L???ch S??? Ki???m Tra</h2>                            
                        </div>

                        <ol>                                                       
                            <li><a href="<%= request.getContextPath()%>/HomeControl">Trang Ch???</a></li>
                            <li>L???ch S??? Ki???m Tra</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- ======= Services Section ======= -->\
            <div class="container">
                <section id="services" class="services" style="background: #fff">
                    <h4 style="text-align: center">L???ch S??? L??m B??i Ki???m Tra</h4><br>
                    <form action="${pageContext.request.contextPath}/resultDetail" method="POST">
                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Test</th>
                                    <th>Th???i Gian B???t ?????u</th>
                                    <th>Th???i Gian K???t Th??c</th>
                                    <th>T???ng ??i???m</th>
                                    <th>T???ng ????p ??n ????ng</th>
                                    <th>Xem Chi Ti???t</th>
                                </tr>
                            </thead>
                            <tbody>
                            <div class="resultform">
                                <c:forEach items="${listResult}" var="o" varStatus="i">
                                    <tr>
                                        <td>${i.index+1}</td>
                                        <td>${o.test}</td>
                                        <td>${o.timeBigin}</td>
                                        <td>${o.timeExpire}</td>
                                        <td>${o.score}</td>
                                        <td>${o.trueQuestion}</td>
                                        <td>
                                            <a href="viewResultDetail?resultID=${o.resultID}"><button type="button" class="btn btn-outline-dark">????p ??n</button></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </div>
                            </tbody>
                        </table>
                    </form>
                </section><!-- End Services Section -->
            </div>
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
