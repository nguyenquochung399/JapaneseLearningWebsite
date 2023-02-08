<%-- 
    Document   : forum_topic
    Created on : Nov 26, 2022, 8:32:10 PM
    Author     : ACER
--%>

<%@page import="Models.ForumTopic"%>
<%@page import="java.util.List"%>
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

        <title>Quản Lí Chủ Đề</title>
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
                                    <h2>Quản Lí Chủ Đề</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addTopic" class="btn btn-success" data-toggle="modal" data-target="#addTopic" style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>Tạo Chủ Đề</span></a>                                             
                                </div>
                            </div>
                        </div>
                        <br>
                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Tên Chủ Đề</th>                   
                                    <th>Chỉnh Sửa</th>
                                    <th>Vô Hiệu Hoá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    //ResultSet rs = (ResultSet) session.getAttribute("allTopic");
                                    //while (rs.next()) {
                                    List<ForumTopic> t = (List<ForumTopic>) session.getAttribute("allTopic");
                                    for (int i = 0; i < t.size(); i++) {


                                %>
                                <tr>
                                    <td><%= t.get(i).getTopic_name()%>
                                        <%
                                            if (t.get(i).getTopic_id() == 1) {
                                        %>(Chủ đề mặc định)<%
                                            }
                                        %>
                                    </td>                    
                                    <td>
                                        <a type="button" data-toggle="modal" data-target="#exampleModalEdit<%= t.get(i).getTopic_id()%>"
                                           ><i class="fa fa-pen" title="Chỉnh sửa"></i></a>
                                    </td>
                                    <td> 
                                        <%
                                            if (t.get(i).getTopic_id() != 1) {
                                        %>
                                        <a type="button" data-toggle="modal" data-target="#exampleModalDelete<%= t.get(i).getTopic_id()%>"
                                           ><i class="fa fa-eye-slash" title="Vô hiệu hoá"></i></a>
                                            <%
                                                }
                                            %>  
                                    </td>
                                    <!-- Modal Edit Topic-->
                            <div class="modal fade" id="exampleModalEdit<%= t.get(i).getTopic_id()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Chỉnh Sửa Chủ Đề</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Tên Chủ Đề Mới
                                            <form id="myform<%= t.get(i).getTopic_id()%>" role='form' method="post" action="<%= request.getContextPath()%>/EditTopic">
                                                <label for="exampleFormControlTextarea1"></label>
                                                <input name="topic_name" value="<%= t.get(i).getTopic_name()%>" required="required">
                                                <input name="topic_id" value="<%= t.get(i).getTopic_id()%>" style="display: none">
                                            </form>                                                        
                                        </div>
                                        <div class="modal-footer">  
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                                            <button type="submit" form="myform<%= t.get(i).getTopic_id()%>" value="editTopic" name="editTopic" class="btn btn-danger">Chỉnh Sửa</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Delete Topic-->
                            <div class="modal fade" id="exampleModalDelete<%= t.get(i).getTopic_id()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Vô Hiệu Hoá Chủ Đề</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn vô hiệu hoá chủ đề này?
                                            <br>
                                            Những bài đăng thuộc chủ đề này sẽ bị vô hiệu hoá
                                            <form id="myformDelete<%= t.get(i).getTopic_id()%>" role='form' method="post" action="<%= request.getContextPath()%>/DisableTopic">
                                                <label for="exampleFormControlTextarea1"></label>
                                                <input name="topic_id" value="<%= t.get(i).getTopic_id()%>" style="display: none">
                                            </form>                                                        
                                        </div>
                                        <div class="modal-footer">  
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
                                            <button type="submit" form="myformDelete<%= t.get(i).getTopic_id()%>" value="disableTopic" name="disableTopic" class="btn btn-danger">Vô Hiệu Hoá</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Modal Add-->
                    <div class="modal fade" id="addTopic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form role='form' method="post" action="NewTopic" accept-charset="utf-8">
                                    <div class="modal-header">                      
                                        <h4 class="modal-title">Tạo Chủ Đề</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">    
                                        <div class="form-group">
                                            <label for="exampleFormControlTextarea1">Tên Chủ Đề</label>
                                            <textarea class="form-control" required="required" name="topic_name" id="exampleFormControlTextarea1"
                                                      rows="1" placeholder="Xin hãy điền tên chủ đề"></textarea>
                                        </div>                                                                                                                         
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                        <input type="submit" class="btn btn-success" style="background-color: #000000;" value="Tạo Chủ Đề">
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
