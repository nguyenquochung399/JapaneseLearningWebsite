<%-- 
    Document   : detailLevel
    Created on : Oct 11, 2022, 11:58:23 PM
    Author     : Saing
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Quản Lí Mức Độ</title>
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

            <jsp:include page="header_manage.jsp"/>

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
                                    <h2>Quản Lí Bảng Mức Độ Của Bài Kiểm Tra</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#add" class="btn btn-success" data-toggle="modal" data-target="#add" 
                                       style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>Tạo Mới</span></a>                                             
                                </div>
                            </div>
                        </div>
                        <br>
                        <form action="levelControl" method="POST">
                            <table id="example" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Nội Dung</th>
                                        <th>Cập Nhật/ Xoá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listLevel}" var="o" varStatus="i">
                                        <tr>
                                            <td>${i.index+1}</td>
                                            <td>${o.levelName}</td>
                                            <td>
                                                <a href="leveEdit?levelID=${o.levelID}" class="btn btn-secondary" tabindex="-1" role="button">Cập Nhật</a>
                                                <a class="btn btn-danger" tabindex="-1" role="button" onclick="showMess(${o.levelID})">Xoá</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>STT</th>
                                        <th>Nội Dung</th>
                                        <th>Cập Nhật/ Xoá</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </form> 
                    </div> 

                    <!-- Modal Add-->
                    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="levelCreate" method="post">
                                    <div class="modal-header">                      
                                        <h4 class="modal-title">Thêm mức độ mới</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">                    
                                        <div class="form-group">
                                            <label>Mô tả:</label>
                                            <input type="text" name="desc" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy"/>
                                        <input type="submit" class="btn btn-success" value="submit" role="button"></input>
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
        <script src="${pageContext.request.contextPath}/manage/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/manage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/manage/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/manage/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/manage/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/manage/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/manage/js/demo/chart-pie-demo.js"></script>

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
                                                    function showMess(ID) {
                                                        var option = confirm('Bạn có muốn xoá hay không?');
                                                        if (option === true) {
                                                            window.location.href = '${pageContext.request.contextPath}/levelDelete?levelID=' + ID;
                                                        }
                                                    }
                                                    ;
        </script>
    </body>

</html>
