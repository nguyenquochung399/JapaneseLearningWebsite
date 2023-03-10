<%-- 
    Document   : account_profile
    Created on : 24-Nov-2022, 21:22:31
    Author     : A Hi
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

        <script src="user/js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
    <style type="text/css">
        #myTab a.nav-link{
            color: black;
        }
        #myTab a.nav-link:hover{
            color: white;
            background-color: #f5b8c5;
        }
        .dropdown-menu li:hover>a{
            background-color: #f5b8c5;
        }
        .toggle-form {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 5%;
            bottom: 15%;
        }
    </style>

    <body>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".toggle-password").click(function () {
                    $(this).toggleClass("fa-eye fa-eye-slash");
                    var input = $($(this).attr("toggle"));
                    if (input.attr("type") === "password") {
                        input.attr("type", "text");
                    } else {
                        input.attr("type", "password");
                    }
                });
            });

            function Validate() {
                var password = document.getElementById("txtPassword").value;
                var confirmPassword = document.getElementById("txtConfirmPassword").value;
                if (password !== confirmPassword) {
                    alert("M???t kh???u kh??ng tr??ng kh???p!");
                    return false;
                }
                return true;
            }
        </script>

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
                        <li class="dropdown"><a class="nav-link scrollto"><span>Ki???m Tra</span> <i class="bi bi-chevron-down"></i></a>
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
                            <li><a class="dropdown-item" href="viewHistoryTest">L???ch S??? Ki???m Tra</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">????ng Xu???t</a></li>                            
                        </ul>
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
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>T??i Kho???n</h2>
                        <ol>
                            <li><a href="HomeControl">Trang Ch???</a></li>
                            <li>T??i Kho???n</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- ======= Portfolio Section ======= -->
            <section id="portfolio" class="portfolio">
                <div class="container mt-3">

                    <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">Th??ng Tin T??i Kho???n</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="false">C???p Nh???t Th??ng Tin</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="avatar-tab" data-bs-toggle="tab" data-bs-target="#avatar" type="button" role="tab" aria-controls="avatar" aria-selected="false">C???p Nh???t ???nh ?????i Di???n</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="pw-tab" data-bs-toggle="tab" data-bs-target="#pw" type="button" role="tab" aria-controls="pw" aria-selected="false">C???p Nh???t M???t Kh???u</a>
                        </li>

                    </ul>                   
                    <div class="tab-content" id="myTabContent">

                        <div class="tab-pane fade show active" style="margin-top: 50px; margin-left: 300px;" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="card mb-3" style="max-width: 770px;">
                                <div class="row g-0 img-fluid d-flex justify-content-center" >
                                    <div class="d-flex justify-content-center" style="margin-top: 20px">
                                        <img src="${sessionScope.acc.avatar}" alt="avatar" width="20%">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h4 class="card-title d-flex justify-content-center">T??i Kho???n C???a B???n</h4>
                                            <div style="margin-left: 100px;">
                                                <h6 class="card-text"><strong>T??n Ng?????i D??ng: </strong>${sessionScope.acc.username}</h6>                         
                                                <h6><strong>Email: </strong>${sessionScope.acc.email}</h6>
                                                <h6><strong>S??? ??i???n Tho???i: </strong>${sessionScope.acc.phone}</h6>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" style="margin-top: 50px; margin-left: 500px;" id="info" role="tabpanel" aria-labelledby="info-tab">    
                            <div class="col-md-4">        
                                <form action="UpdateInfoControl" method="post">
                                    <div class="mb-3 mt-3">
                                        <label for="email" class="form-label">T??n Ng?????i D??ng:</label>
                                        <input type="text" class="form-control" value="${sessionScope.acc.username}"
                                               pattern="[a-zA-Z??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\s\W|_].{1,14}$" 
                                               title="T??n ng?????i d??ng ??t h??n 15 k?? t???! (bao g???m kho???ng tr???ng)"
                                               name="username" >
                                    </div>

                                    <div class="mb-3">
                                        <label for="pwd" class="form-label">S??? ??i???n Tho???i:</label>
                                        <input type="tel" class="form-control" id="phone" value="${sessionScope.acc.phone}" 
                                               name="phone" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" title="S??? ??i???n tho???i kh??ng h???p l???!">
                                    </div>
                                    <button type="submit" class="btn " style="background-color: #f5b8c5; margin:auto; display:block; color: white">C???p Nh???t</button>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade" style="margin-top: 50px; margin-left: 500px;" id="avatar" role="tabpanel" aria-labelledby="avatar-tab">
                            <div class="col-md-4">  
                                <!--
                                <form action="UpdateAvatarControl" method="post" enctype="multipart/form-data">
                                    <div class="mb-3 mt-3">
                                        <div class="d-flex align-items-start">
                                            <img src="" class="img" alt="avatar" width="70%">
                                            <div class="pl-sm-4 pl-2" id="img-section">
                                                <p>Ch???p nh???n file .png. ??t h??n 1MB</p>
                                                <input type="file" name="file">                     
                                            </div>
                                        </div>
                                    </div>                  
                                    <button type="submit" class="btn " style="background-color: #f5b8c5; margin:auto; display:block;">C???p Nh???t</button>
                                </form> -->

                                <img src="${sessionScope.acc.avatar}" class="img" alt="avatar" width="70%">
                                <form method="post" action="UpdateAvatarControl" enctype="multipart/form-data">
                                    Ch???n file t???i l??n: <input type="file" name="file" size="60" accept=".jpg, .jpeg, .png"/><br /><br />
                                    <button type="submit" class="btn " style="background-color: #f5b8c5; margin:auto; display:block; color: white">T???i l??n</button>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade" style="margin-top: 50px; margin-left: 500px;" id="pw" role="tabpanel" aria-labelledby="pw-tab">
                            <div class="col-md-4">        
                                <form action="UpdatePasswordControl" method="post">
                                    <div class="mb-3 mt-3 form-group toggle-form">
                                        <label for="email" class="form-label">M???t Kh???u M???i:</label>
                                        <input type="password" class="form-control" placeholder="" id="txtPassword" name="newPassword" value="${newpass}" pattern="[A-Za-z0-9]{6,12}" oninvalid="this.setCustomValidity('????? d??i m???t kh???u t??? 6 ?????n 12 k?? t???!')" title="Nh???p M???t Kh???u M???i">

                                    </div>
                                    <div class="mb-3 form-group toggle-form">
                                        <label for="pwd" class="form-label">Nh???p L???i M???t Kh???u M???i:</label>
                                        <input type="password" class="form-control" placeholder="" id="txtConfirmPassword" name="reNewPassword" value="${renewpass}" pattern="[A-Za-z0-9]{6,12}" oninvalid="this.setCustomValidity('????? d??i m???t kh???u t??? 6 ?????n 12 k?? t???!')" title="Nh???p L???i M???t Kh???u M???i">

                                    </div>
                                    <button type="submit" class="btn" onclick="return Validate()" style="background-color: #f5b8c5; margin:auto; display:block; color: white">C???p Nh???t</button>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>
                </div>
                </div>
                </div>
            </section><!-- End Portfolio Section -->

        </main><!-- End #main -->

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