<%-- 
    Document   : error
    Created on : Dec 9, 2022, 2:41:40 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lỗi</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="<%= request.getContextPath()%>/user/img/logo.jpg" rel="icon">
        <link href="<%= request.getContextPath()%>/user/img/logo.jpg" rel="apple-touch-icon">
        
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="<%= request.getContextPath()%>/user/css/login.css">

        <script src="<%= request.getContextPath()%>/user/js/jquery.min.js"></script>
    </head>
    <style type="text/css">
        #wrapper{
            display: flex;
            align-items: center;
            justify-content: center;                    
        }
    </style>
    <body>
        <div class="container">
            <div id="wrapper">
                <h1>Chức Năng Chưa Hỗ Trợ</h1>
            </div> 

            <div id="wrapper">


                <div class="form-group">
                    <a type="button" href="<%= request.getContextPath()%>/HomeControl" class="btn" style="background: #f5b8c5; color: white;">Quay Lại Trang Chủ</a>                                                                     
                </div>
            </div>    
        </div>

    </body>
</html>