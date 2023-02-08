<%-- 
    Document   : notification_manage
    Created on : Nov 28, 2022, 2:43:42 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="Models.User"%>
<%@page import="Models.Notification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAOs.Account.UserDAO"%>
<%@page import="DAOs.Notification.NotificationDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Quản Lí Thông Báo</title>
        <link href="user/img/logo.jpg" rel="icon">

        <!-- Custom fonts for this template-->
        <link href="manage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="manage/css/sb-admin-2.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>

    <body id="page-top">

        <!-- ///Edit Modal -->




        <style>
            /* The Modal (background) */
            .modal-edit {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-edit-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
                border-radius: 12px;
            }

            /* The Close Button */
            .close-edit {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close-edit:hover,
            .close-edit:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .center-align {
                text-align: center;
            }
            .width-5 {
                width: 5vw;
            }
            .width-8 {
                width: 8vw;
            }
            .width-10 {
                width: 10vw;
            }
            .width-12 {
                width: 12vw;
            }
            #outer-container {
                margin: 1vw 1vw;
            }
            #outer-legend {
                font-weight: bold;
                font-size: 24px;
            }
            #notif-table-container {
                margin: 2vh 0;
            }
            #add-form-legend {
                all: unset;
                cursor: pointer;
                font-size: 16px;
            }
            #add-form-container {
                display: none;
                width: 50%;
            }
            #add-form {
                margin: 1vh 0;
            }
            #add-title {
                margin-top: 2vh;
                padding: 1vh 1vw;
                border-radius: 12px;
                width: 30em;
                height: 5vh;
                width: 100%;
                font-size: 14px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            #add-details {
                margin: 2vh 0;
                padding: 1vh 1vw;
                border-radius: 12px;
                font-family: 'Arial';
                height: 30vh;
                resize: none;
                width: 100%;
                font-size: 14px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            #add-submit {
                width: 4vw;
                height: 4vh;
                border-radius: 12px;
                font-size: 14px;
                overflow: hidden;
            }
            #edit-form-legend {
                margin: 3vh 3vw;
                font-weight: bold;
                font-size: 24px;
                text-align: center;
            }
            #edit-form {
                margin: 1vh 0;
            }
            #edit-title {
                margin: 2vh 0;
                padding: 1vh 1vw;
                width: 30em;
                height: 5vh;
                width: 100%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            #edit-details {
                margin: 2vh 0;
                padding: 1vh 1vw;
                font-family: 'Arial';
                height: 30vh;
                resize: none;
                width: 100%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            #edit-submit {
                background-color: #000 !important;
                color: #fff !important;
                overflow: hidden;
            }
        </style>

        <script>
            function openModal(editID, editTitle, editDetails) {
                modal.style.display = "block";
                inputID.value = editID;
                inputTitle.value = editTitle;
                inputDetails.value = editDetails.replaceAll("<br>", "\r\n");
            }

            // Get the modal
            var modal = document.getElementById("myModal-edit");
            var inputID = document.getElementById("edit-id");
            var inputTitle = document.getElementById("edit-title");
            var inputDetails = document.getElementById("edit-details");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close-edit")[0];

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            };

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        </script>
        <!-- Edit Modal/// -->

        <!-- Page Wrapper -->
        <div id="wrapper">

            <jsp:include page="header_manage.jsp" />

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">


                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.acc.username}</span>
                                    <img class="img-profile rounded-circle"
                                         src="${sessionScope.acc.avatar}">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Đăng Xuất
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->


                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Quản Lí Thông Báo</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addNoti" class="btn btn-success" data-toggle="modal" data-target="#addNoti" style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>Tạo Thông Báo</span></a>                                             
                                </div>
                            </div>
                        </div>
                        <br>                       
                        <script>


                            function notifFormDeleteConfirm(notifID) {
                                $(document).on('click', '#notifDeleteBtn-' + notifID, function (e) {
                                    e.preventDefault();
                                    swal({
                                        title: "Bạn có chắc muốn xóa?",
                                        text: "Dữ liệu sẽ không thể phục hồi sau khi xóa!",
                                        icon: "warning",
                                        buttons: true,
                                        dangerMode: true
                                    }).then((willDelete) => {
                                        if (willDelete) {
                                            $('#notifDeleteForm-' + notifID).submit();
                                        }
                                    });
                                });
                            }
                        </script>


                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th class="width-12">Tiêu đề</th>
                                    <th>Chi tiết</th>
                                    <th class="width-8">Thời gian đăng</th>
                                    <th class="width-5">Người đăng</th>
                                    <th class="width-5">Trạng thái</th>
                                    <th class="width-5">Chỉnh sửa</th>
                                    <th>Ẩn/Hiện</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    // Get All Notification
                                    int orderNo = 0;
                                    List<User> allUserList = (List<User>) session.getAttribute("allUserList");

                                    ArrayList<Notification> nList = (ArrayList<Notification>) session.getAttribute("allNotification");
                                    for (Notification n : nList) {
                                        orderNo += 1;
                                        int id = n.getNotificationID();
                                        String title = n.getTitle();
                                        String details = n.getDetails().replace("\r\n", "<br>");
                                        String time = n.getTime();
                                        String poster = "";
                                        for (User u : allUserList) {
                                            if (u.getUserID() == n.getUserID()) {
                                                poster = u.getUsername();
                                            }
                                        }
                                        int status = n.getStatus();
                                        String statusStr = "";
                                        if (status == 0) {
                                            statusStr = "Hiện";
                                        } else if (status == 1) {
                                            statusStr = "Ẩn";
                                        }
                                %>
                                <tr>
                                    <td><%=orderNo%></td>
                                    <td style="word-break: break-word;"><%=title%></td>
                                    <td style="word-break: break-word;"><%=details%></td>
                                    <td><%=time%></td>
                                    <td><%=poster%></td>
                                    <td><%=statusStr%></td>
                                    <td class="center-align"><a href="#editNoti<%=id%>" data-toggle="modal" data-target="#editNoti<%=id%>" title="Chỉnh sửa" style="all: unset; cursor: pointer;"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                            <%
                                                if (statusStr.equals("Hiện")) {
                                            %>
                                    <td class="center-align"><form action="ToggleNotificationVisibility" method="POST"><input type="hidden" name="notifID" value="<%=id%>"><button type="submit" style="all: unset; cursor: pointer;" title="Ẩn"><i class="fa-solid fa-eye-slash"></i></button></form></td>
                                                <%
                                                } else {
                                                %>
                                    <td class="center-align"><form action="ToggleNotificationVisibility" method="POST"><input type="hidden" name="notifID" value="<%=id%>"><button type="submit" style="all: unset; cursor: pointer;" title="Hiện"><i class="fa-solid fa-eye"></i></button></form></td>
                                                <%
                                                    }
                                                    details = details.replaceAll("<br>", "\r\n");
                                                %>
                                    <td class="center-align"><form action="DeleteNotification" method="POST" id="notifDeleteForm-<%=id%>"><input type="hidden" name="notifID" value="<%=id%>"><button type="submit" onclick="notifFormDeleteConfirm(<%=id%>)" id="notifDeleteBtn-<%=id%>" style="all: unset; cursor: pointer;" title="Xóa">
                                                <i class="fa-solid fa-trash"></i></button></form></td>
                                </tr>
                            <div class="modal fade" id="editNoti<%=id%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="EditNotification" method="post">
                                            <div class="modal-header">                      
                                                <h4 class="modal-title">Cập Nhật Thông Báo</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="modal-body">   
                                                <div class="form-group" hidden>
                                                    <input type="hidden" id="<%=title%>" name="editNotifID" value="<%=id%>">
                                                </div>                            
                                                <div class="form-group">
                                                    <label>Tiêu Đề</label>
                                                    <input type="text" class="form-control" value="<%=title%>" name="editTitle" placeholder="Nhập tiêu đề">
                                                </div>
                                                <div class="form-group">
                                                    <label>Chi Tiết</label>
                                                    <textarea type="text" class="form-control" name="editDetails" placeholder="Nhập chi tiết" style="resize: none; height: 30vh;"><%=details%></textarea>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                                <input type="submit" name="submit" class="btn btn-primary" value="Cập Nhật">
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div> 

                            <%
                                }
                            %>                             
                            </tbody>
                        </table>
                    </div>  


                    <!-- Modal Add-->
                    <div class="modal fade" id="addNoti" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="AddNotification" method="post">
                                    <div class="modal-header">                      
                                        <h4 class="modal-title">Tạo Thông Báo</h4>

                                    </div>
                                    <div class="modal-body">    
                                        <div class="form-group">
                                            <label>Tiêu Đề</label>
                                            <input type="text" id="add-title" class="form-control" name="addTitle" placeholder="Nhập tiêu đề">
                                        </div>                            

                                        <div class="form-group">
                                            <label>Chi Tiết</label>
                                            <textarea type="text" id="add-details" class="form-control" name="addDetails" placeholder="Nhập chi tiết"></textarea>
                                        </div>                                                        
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                        <input type="submit" class="btn btn-success" style="background-color: #000000;" value="Tạo Thông Báo">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 


                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Bạn muốn đăng xuất ?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                        <a class="btn btn-primary" href="LogoutControl">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="manage/vendor/jquery/jquery.min.js"></script>
        <script src="manage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="manage/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="manage/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="manage/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="manage/js/demo/chart-area-demo.js"></script>
        <script src="manage/js/demo/chart-pie-demo.js"></script>

        <!-- datatable -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

        <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('#example').DataTable({
                                                "lengthMenu": [[10, 15, 20, 25, 30, -1], [10, 15, 20, 25, 30, 'Tất cả']],
                                                "pageLength": 10,
                                                "language": {
                                                    "url": "//cdn.datatables.net/plug-ins/1.12.1/i18n/vi.json",
                                                    "lengthMenu": "Hiển thị tối đa _MENU_ dữ liệu",
                                                    "info": "Hiển thị _END_ trên tổng số _TOTAL_ dữ liệu"
                                                }
                                            });
                                        });
        </script>
    </body>
</html>
