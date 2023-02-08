<%-- 
    Document   : account_recovery_validate
    Created on : Dec 3, 2022, 10:56:29 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xác Thực Email</title>

        <!-- Favicons -->
        <link href="user/img/logo.jpg" rel="icon">
        <link href="user/img/logo.jpg" rel="apple-touch-icon">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

        <link rel="stylesheet" href="user/css/login.css">

        <!-- jQuery AJAX -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    </head>
    <body class="img js-fullheight" style="background-image: url(user/img/13.jpg);">
        <style>
            #recover-code {
                width: 75%;
                display: inline-block;
            }

            #resend-btn {
                width: 20%;
                margin-left: 4%;
                font-size: 21px;
            }

            #resend-countdown {
                font-weight: bold;
            }

            .validate-failed {
                color: #D0342C;
            }

            .validate-success {
                color: #00ff7f;
            }

            /* Chrome, Safari, Edge, Opera */
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>

        <script>
            $(document).ready(function () {
                var countdown = 30; // seconds
                $('#resend-countdown').text(countdown + " giây");

                setInterval(function () {
                    if (countdown > 0) {
                        countdown = countdown - 1;
                        $('#resend-countdown').text(countdown + " giây"); // this will run after every 1 seconds
                    }
                }, 1000);

                $('#resend-btn').on("click", function () {
                    if (countdown === 0) {
                        const recoverEmail = $('#recover-email').val();
                        $('#recover-message').css("display", "block");
                        $('#recover-message').css("color", "#e3f2e1");
                        $('#recover-message').text("Đang xử lý, vui lòng đợi...");
                        $.ajax({
                            type: "POST",
                            url: "PasswordRecovery?recoverEmail=" + recoverEmail,
                            success: function () {
                                //alert("ajax is working");
                                //$('#recover-message').attr("style", "display: block !important");
                                //$('#recover-message').attr("style", "color: #0f0 !important");
                                $('#recover-message').css("display", "block");
                                $('#recover-message').css("color", "#00ff7f");
                                $('#recover-message').text("Gửi lại mã thành công!");
                                countdown = 30;
                            },
                            error: function () {
                                //alert("ajax has failed");
                            }
                        });
                    } else {
                        $('#recover-message').css("display", "block");
                        $('#recover-message').css("color", "#D0342C"); // #b22222
                        $('#recover-message').text("Bạn chưa thể gửi lại mã, vui lòng đợi!");
                    }
                });

                $('#recover-code').on("click", function () {
                    $('#recover-message').css("display", "none");
                });

                $('#validate-form').on("submit", function (e) {
                    var dataString = $("#validate-form").serialize();
                    var map = deparam(dataString);
                    var recoverCode = map.recoverCode;
                    if (recoverCode !== "") {
                        $.ajax({
                            type: "GET",
                            url: "PasswordRecoveryValidate?" + dataString,
                            success: function (data) {
                                if (data !== null) {
                                    $("#validate-msg-container").html(data);
                                    if ($('.validate-success')[0]) {
                                        window.setTimeout(function () {
                                            window.location = "${pageContext.request.contextPath}/account_recovery_password.jsp";
                                        }, 3000);
                                    }
                                }
                            }
                        });
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
            String recoverEmail = null;

            try {
                recoverEmail = session.getAttribute("recoverEmail").toString();
                //session.removeAttribute("recoverEmail");
            } catch (NullPointerException npe) {
                response.sendRedirect(request.getContextPath() + "/account_login.jsp");
            }

        %>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Xác Thực Email</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <form action="/" method="POST" class="signin-form" id="validate-form">
                                <div class="form-group">
                                    <label for="recover-code">Mã OTP đã được gửi đến email <br><strong><%=recoverEmail%></strong><br>Mã OTP có hiệu lực <strong>10 phút</strong><br><span>Bạn có thể gửi lại mã OTP sau <span id="resend-countdown"></span></span></label><br>
                                    <input type="number" maxlength="6" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" name="recoverCode" class="form-control" id="recover-code" placeholder="Nhập Mã" required>
                                    <button type="button" id="resend-btn" class="form-control btn" style="background: #f5b8c5; color: white;" title="Gửi Lại OTP"><i class="fa-solid fa-rotate-right"></i></button><br>
                                    <div id="recover-message" style="display: none"></div>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="recoverEmail" class="form-control" id="recover-email" value="<%=recoverEmail%>">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn" style="background: #f5b8c5; color: white;">XÁC NHẬN</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-100 text-md-center">
                                        <a href="<%=request.getContextPath()%>/account_login.jsp" style="color: #fff">Quay lại đăng nhập</a>
                                    </div>
                                </div>
                                <div class="form-group d-md-flex" id="validate-msg-container">
                                    <!-- AJAX -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="user/js/jquery.min.js"></script>
        <script src="user/js/bootstrap.min.js"></script>
        <script src="user/js/login.js"></script>

    </body>
</html>
