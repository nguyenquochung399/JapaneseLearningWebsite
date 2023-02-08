<%-- 
    Document   : account_recovery_password
    Created on : Dec 3, 2022, 2:20:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đổi Mật Khẩu</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Favicons -->
        <link href="user/img/logo.jpg" rel="icon">
        <link href="user/img/logo.jpg" rel="apple-touch-icon">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="user/css/login.css">

        <script src="user/js/jquery.min.js"></script>
    </head>
    <body class="img js-fullheight" style="background-image: url(user/img/13.jpg);">
        <script>
            $(document).ready(function () {
                $('#change-psw-form').on("submit", function (e) {
                    var dataString = $("#change-psw-form").serialize();
                    var map = deparam(dataString);
                    var newPassword = map.password;
                    var newRepassword = map.repassword;
                    var repswCheck = $('#repassword-check-msg');

                    if (newPassword !== "" && newRepassword !== "") {
                        if (newRepassword !== newPassword) {
                            repswCheck.css("display", "block");
                            repswCheck.css("color", "#D0342C");
                            repswCheck.text("Mật khẩu không trùng khớp, vui lòng thử lại!");
                        } else {
                            $.ajax({
                                type: "GET",
                                url: "PasswordRecoveryUpdate?" + dataString,
                                success: function () {
                                    // hide repassword check message
                                    repswCheck.css("display", "none");

                                    // disable all inputs and button after change password
                                    $('#password-field').css("pointer-events", "none");
                                    $('#repassword-field').css("pointer-events", "none");
                                    $('#update-password-btn').css("pointer-events", "none");

                                    // display success message
                                    $('#update-msg').css("display", "block");
                                    $('#update-msg').css("color", "#00ff7f");
                                    $('#update-msg').text("Đổi mật khẩu thành công! Chuyển hướng đến đăng nhập...");
                                    window.setTimeout(function () {
                                        window.location = "${pageContext.request.contextPath}/account_login.jsp";
                                    }, 3000);
                                }
                            });
                        }
                    }
                    e.preventDefault();
                });
            });

            function deparam(query) {
                var pairs, i, keyValuePair, key, value, map = {};
                // remove leading question mark if its there
                if (query.slice(0, 1) === '?') {
                    query = query.slice(1);
                }
                if (query !== '') {
                    pairs = query.split('&');
                    for (i = 0; i < pairs.length; i += 1) {
                        keyValuePair = pairs[i].split('=');
                        key = decodeURIComponent(keyValuePair[0]);
                        value = (keyValuePair.length > 1) ? decodeURIComponent(keyValuePair[1]) : undefined;
                        map[key] = value;
                    }
                }
                return map;
            }
        </script>
        <%
            String recoverEmail = "";
            try {
                String isAuthorized = session.getAttribute("isAuthorizedPassChange").toString();
                recoverEmail = session.getAttribute("recoverEmail").toString();
                session.removeAttribute("recoverEmail");;
            } catch (NullPointerException npe) {
                response.sendRedirect(request.getContextPath() + "/account_login.jsp");
            }
        %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Đổi Mật Khẩu</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="/" method="POST" class="signin-form" id="change-psw-form">
                                <div style="text-align: center;">Nhập mật khẩu mới cho tài khoản của bạn</div><br>
                                <div class="form-group">
                                    <input type="hidden" name="email" class="form-control" placeholder="Email" value="<%=recoverEmail%>">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" name="password" type="password" class="form-control" placeholder="Mật khẩu mới" pattern="[A-Za-z0-9]{6,12}" oninvalid="this.setCustomValidity('Độ dài mật khẩu từ 6 đến 12 kí tự!')" title="Nhập Mật Khẩu Mới" required>
                                    
                                </div>
                                <div class="form-group">
                                    <input id="repassword-field" name="repassword" type="password" class="form-control" placeholder="Xác nhận Mật khẩu mới" pattern="[A-Za-z0-9]{6,12}" oninvalid="this.setCustomValidity('Độ dài mật khẩu từ 6 đến 12 kí tự!')" title="Nhập Lại Mật Khẩu Mới" required>
                                    
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn" id="update-password-btn" style="background: #f5b8c5; color: white;">XÁC NHẬN</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-100 text-md-center" id="repassword-check-msg" style="display: none;"></div>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-100 text-md-center">
                                        <a href="<%=request.getContextPath()%>/account_login.jsp" style="color: #fff">Quay lại đăng nhập</a>
                                    </div>
                                </div>
                                <div class="form-group d-md-flex" id="update-msg-container">
                                    <div class='w-100 text-md-center' id='update-msg' style="display: none;"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="user/js/bootstrap.min.js"></script>
        <script src="user/js/forgetPassword.js"></script>

    </body>
</html>
