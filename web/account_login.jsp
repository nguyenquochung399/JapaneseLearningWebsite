<%-- 
    Document   : account_login
    Created on : 24-Nov-2022, 21:17:00
    Author     : A Hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="user/css/login.css">

        <script src="user/js/jquery.min.js"></script>
    </head>

    <body class="img js-fullheight" style="background-image: url(user/img/13.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">ĐĂNG NHẬP</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="LoginControl" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input id="email" type="text" name="email" class="form-control" title="Nhập Email" placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" name="password" type="password" class="form-control" title="Nhập Mật khẩu" placeholder="Mật khẩu" required>
                                    
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn submit px-3" style="background: #f5b8c5; color: white;">ĐĂNG NHẬP</button>                                                                     
                                </div>
                                <%
                                    try {
                                        String invalidMailOrPassword = session.getAttribute("invalidMailOrPassword").toString();
                                        if (invalidMailOrPassword != null) {
                                %>
                                <div class="form-group d-md-flex">
                                    <div class='w-100 text-md-center' id='status-msg' style='color: #D0342C;'><%=invalidMailOrPassword%></div>
                                </div>
                                <%
                                        }
                                        session.removeAttribute("invalidMailOrPassword");
                                    } catch (NullPointerException ex) {

                                    }
                                %>
                                <div class="form-group d-md-flex">

                                    <div class="w-100 text-md-right">
                                        <a href="<%=request.getContextPath()%>/account_recovery.jsp" style="color: #fff">Quên mật khẩu?</a>
                                    </div>
                                </div>
                            </form>
                            
                            <p class="w-100 text-center">&mdash; hoặc đăng nhập với &mdash;</p>
                            <div class="social text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/Capstone_Final/LoginWithGoogleControl&response_type=code
                                   &client_id=385719648415-f3cmsdtcnus0srmpkn5897b5brdes37s.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Google</a> 
                                <style>
                                    .login-wrap .social a:hover {
                                        background: #f5b8c5;
                                        color: white;
                                        border-color: #f5b8c5; }
                                    </style>
                                </div>
                                <a href="account_signup.jsp" class="w-100 text-center" style="color: #fff; display: flex;
                                justify-content: center; text-decoration: underline;">Bạn chưa có tài khoản?</a>
                        </div>
                    </div>
                </div>
            </div>

        </section>


        <script src="user/js/bootstrap.min.js"></script>
        <script src="user/js/login.js"></script>

        <script>
            $(document).ready(function () {
                $('input').click(function () {
                    $('#status-msg').css("display", "none");
                });
            });
        </script>

    </body>
</html>


