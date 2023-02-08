<%-- 
    Document   : forum_reportComment
    Created on : Nov 26, 2022, 8:31:44 PM
    Author     : ACER
--%>

<%@page import="java.util.List"%>
<%@page import="Models.ForumAllReportComment"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Quản Lí Bình Luận Bị Báo Cáo</title>
        <link href="user/img/logo.jpg" rel="icon">

        <!-- Custom fonts for this template-->
        <link href="manage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="manage/css/sb-admin-2.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

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
                                    <h2>Quản Lí Bình Luận Bị Báo Cáo</h2>
                                </div>
                            </div>
                        </div>
                        <br>

                        <%
                            List<ForumAllReportComment> rs = (List<ForumAllReportComment>) session.getAttribute("allReportComment");
                            for (int i = 0; i < rs.size(); i++) {
                        %>
                        <div>
                            <div class="card mb-4 box-shadow">
                                <div class="card-body">
                                    <div class="d-flex">

                                        <h3 style="display: inline-block" class="card-text">Tiêu đề: <%= rs.get(i).getPost_title()%></h3>
                                        <p class="text-muted ml-auto p-2">Ngày Chỉnh Sửa: <%= rs.get(i).getComment_edit_date().substring(0, Math.min(rs.get(i).getComment_edit_date().length(), 19))%></p>
                                    </div>                                    
                                </div>
                                <div class="card-body" >
                                    <p class="card-text"><%= rs.get(i).getComment_content()%></p>
                                </div>
                                <div class="card-body" >
                                    <p style="color: red">Lý Do Báo Cáo: <%= rs.get(i).getReport_comment_reason()%></p>
                                    <p>Thành Viên Báo Cáo: <%= rs.get(i).getUsername()%></p>
                                    <p>Ngày Báo Cáo: <%= rs.get(i).getReport_comment_date().substring(0, Math.min(rs.get(i).getReport_comment_date().length(), 19))%></p>
                                    <form method="post" action="<%= request.getContextPath()%>/ReportComment" style="display: inline">
                                        <input name="report_comment_id" value="<%= rs.get(i).getReport_comment_id()%>" style="display: none">
                                        <input name="comment_id" value="<%= rs.get(i).getComment_id()%>" style="display: none">
                                        <input name="reportCommentDelete" value="" style="display: none">
                                        <button type="submit" value="reportIgnore" name="reportIgnore" class="btn btn-secondary">Bỏ Qua</button>
                                    </form>
                                    <button type="button" data-toggle="modal" data-target="#exampleModalPost<%= rs.get(i).getReport_comment_id()%>"
                                            class="btn btn-danger">Xử Lý</button>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Delete Report and Comment-->
                        <div class="modal fade" id="exampleModalPost<%= rs.get(i).getReport_comment_id()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Xử Lý Báo Cáo</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc xử lý báo cáo này lẫn bình luận?
                                        <form id="myform<%= rs.get(i).getReport_comment_id()%>" method="post" action="<%= request.getContextPath()%>/ReportComment">
                                            <textarea class="form-control" required="required" name="report_notification_content" id="exampleFormControlTextarea2"
                                                      rows="6" placeholder="Nhập lý do xoá để thông báo cho người dùng"></textarea>
                                            <input name="report_comment_id" value="<%= rs.get(i).getReport_comment_id()%>" style="display: none">
                                            <input name="comment_id" value="<%= rs.get(i).getComment_id()%>" style="display: none">
                                            <input name="reportIgnore" value="" style="display: none">                                                            
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                        <button form="myform<%= rs.get(i).getReport_comment_id()%>" type="submit" value="reportCommentDelete" name="reportCommentDelete" class="btn btn-danger">Xử Lý</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>

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
                    "lengthMenu": [[5, 10, 15, 20, 25, 30, -1], [5, 10, 15, 20, 25, 30, 'Tất cả']],
                    "pageLength": 5,
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
