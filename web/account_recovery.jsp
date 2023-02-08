<%-- 
    Document   : account_recovery
    Created on : Dec 3, 2022, 10:47:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Khôi Phục Tài Khoản</title>

        <!-- Favicons -->
        <link href="user/img/logo.jpg" rel="icon">
        <link href="user/img/logo.jpg" rel="apple-touch-icon">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="user/css/login.css">
        <script src="user/js/jquery.min.js"></script>
    </head>
    <body class="img js-fullheight" style="background-image: url(user/img/13.jpg);">
        <style>
            .warning {
                color: #D0342C;
            }
            .success {
                color: #00ff7f;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('#recover-email').click(function () {
                    $('#no-email-msg').css("display", "none");
                });

                $('.signin-form').on("submit", function (e) {
                    var dataString = $(".signin-form").serialize();
                    var map = deparam(dataString);
                    var recoverEmail = map.recoverEmail;

                    if (recoverEmail !== "") {
                        // disable all inputs and button
                        $('#recover-email').css("pointer-events", "none");
                        $('.submit').css("pointer-events", "none");

                        $('#status-msg').css("color", "#e3f2e1");
                        $('#status-msg').text("Đang xử lý, vui lòng đợi...");
                        $.ajax({
                            type: "POST",
                            url: "PasswordRecovery?" + dataString,
                            success: function (data) {
                                if ($('<div />').html(data).find("#no-email-msg").length > 0) {
                                    // display no such email message
                                    $('#status-msg').css("color", "#d0342c");
                                    $('#status-msg').text("Email chưa đăng nhập, vui lòng thử lại!");
                                    // enable all inputs and button
                                    $('#recover-email').css("pointer-events", "auto");
                                    $('.submit').css("pointer-events", "auto");
                                } else {
                                    // display success message
                                    $('#status-msg').css("color", "#00ff7f");
                                    $('#status-msg').text("Đang chuyển hướng, vui lòng đợi...");
                                    window.setTimeout(function () {
                                        window.location = "${pageContext.request.contextPath}/account_recovery_validate.jsp";
                                    }, 1000);
                                }
                            }
                        });
                    } else {
                        $('#status-msg').css("color", "#D0342C");
                        $('#status-msg').text("Email không được để trống!");
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
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Khôi Phục Tài Khoản</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="<%=request.getContextPath()%>/PasswordRecovery" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" name="recoverEmail" class="form-control" id="recover-email" pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$" oninvalid="this.setCustomValidity('Địa chỉ Email không hợp lệ!')" title="Nhập Email" placeholder="Nhập Email" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn" style="background: #f5b8c5; color: white;">XÁC NHẬN</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-100 text-md-center">
                                        <a href="<%=request.getContextPath()%>/account_login.jsp" style="color: #fff">Quay lại đăng nhập</a>
                                    </div>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class='w-100 text-md-center' id='status-msg'></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="user/js/bootstrap.min.js"></script>
        <script src="user/js/login.js"></script>

    </body>
</html>
