<%-- 
    Document   : account_signup
    Created on : 24-Nov-2022, 21:17:25
    Author     : A Hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Đăng Ký</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="user/css/login.css">

    </head>

    <body class="img js-fullheight" style="background-image: url(user/img/13.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">ĐĂNG KÍ</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="SignupControl" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="email" placeholder="Email" pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" title="Địa chỉ email không hợp lệ!" required/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="username" class="form-control"  pattern="[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_].{1,14}$" title="Tên người dùng ít hơn 15 kí tự! (bao gồm khoảng trống)" placeholder="Tên Người Dùng" required/>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" name="password" type="password" pattern="[A-Za-z0-9]{6,12}" title="Độ dài mật khẩu từ 6 đến 12 kí tự!" class="form-control" placeholder="Mật Khẩu" required/>                                    
                                </div>
                                <div class="form-group">
                                    <input type="text" name="phone" class="form-control" placeholder="Số Điện Thoại" pattern="(84|0[3|5|7|8|9])+([0-9]{8})\b" title="Số điện thoại không hợp lệ!" required/>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="submit" class="form-control btn submit px-3" style="background: #f5b8c5; color: white;">Đăng Kí</button>
                                    <%
                                        try {
                                            String existMail = session.getAttribute("existMail").toString();
                                            if (existMail != null) {
                                    %>
                                    <div class="form-group d-md-flex">
                                        <div class='w-100 text-md-center' id='status-msg' style='color: #D0342C;'><%=existMail%></div>
                                    </div>
                                    <%
                                            }
                                            session.removeAttribute("invalidMailOrPassword");
                                        } catch (NullPointerException ex) {

                                        }
                                    %>
                                </div>
                            </form>                            

                            <p class="w-100 text-center">&mdash; hoặc đăng ký với &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/Capstone_Final/SignupWithGoogleControl&response_type=code
                                   &client_id=385719648415-f3cmsdtcnus0srmpkn5897b5brdes37s.apps.googleusercontent.com&approval_prompt=force" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Google</a>
                                <style>
                                    .login-wrap .social a:hover {
                                        background: #f5b8c5;
                                        color: white;
                                        border-color: #f5b8c5; }
                                    </style>
                                </div>
                                <a href="account_login.jsp" class="w-100 text-center" style="color: #fff; display: flex; justify-content: center; text-decoration: underline;">Bạn đã có tài khoản?</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </body>
    <script src="user/js/jquery.min.js"></script>
    <script src="user/js/bootstrap.min.js"></script>
    <script src="user/js/login.js"></script>
    <script>
                                $(document).ready(function () {
                                    $('input').click(function () {
                                        $('#status-msg').css("display", "none");
                                    });
                                });
    </script>

</html>


