<%-- 
    Document   : dashboard
    Created on : 25-Nov-2022, 14:15:59
    Author     : A Hi
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

        <title>Quản Lí Ví Dụ Ngữ Pháp</title>
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
                        <a href="ManageGrammarControl"><i class="fa fa-arrow-left"> Quay lại</i></a>
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
                                    <h2>Quản Lí Ví Dụ Ngữ Pháp: </h2>
                                    <h4>${gm.structure}</h4>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addExample" class="btn btn-success" data-toggle="modal" data-target="#addExample" style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>Thêm Ví Dụ</span></a>                                             
                                </div>
                            </div>
                        </div>
                        <br>
                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th hidden>ID G</th>
                                    <th hidden>ID E</th>
                                    <th>Câu Ví Dụ Tiếng Nhật</th>
                                    <th>Nghĩa Tiếng Việt</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listE}" var="o">
                                    <tr>
                                        <td hidden>${o.grammarID}</td>
                                        <td hidden>${o.exampleID}</td>
                                        <td>${o.exJ}</td>
                                        <td>${o.exV}</td>                               
                                        <td><a href="#viewExample${o.exampleID}" data-toggle="modal" data-target="#viewExample${o.exampleID}" ><i class="edit" data-toggle="modal"><i class="fa fa-pen" data-toggle="tooltip" title="Sửa"></i></a></td>
                                        <td><a href="#deleteExample${o.exampleID}" data-toggle="modal" data-target="#deleteExample${o.exampleID}" ><i class="delete" data-toggle="modal"><i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i></a></td>                                   
                                    </tr>
                                </c:forEach>                              
                            </tbody>
                    </div>

                    <!-- Modal Add-->
                    <div class="modal fade" id="addExample" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="CreateExampleControl" method="post">
                                    <div class="modal-header">                      
                                        <h4 class="modal-title">Thêm Ví Dụ</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body"> 
                                        <div class="form-group" hidden>
                                            <label>ID G</label>
                                            <input name="grammarID" value="${gm.grammarID}">
                                        </div>
                                        <div class="form-group">
                                            <label>Câu Ví Dụ</label>
                                            <input name="exJ" type="text" class="form-control"  required>
                                        </div>
                                        <div class="form-group">
                                            <label>Nghĩa</label>
                                            <input name="exV" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy bỏ">
                                        <input type="submit" name="submit" class="btn btn-primary" value="Thêm Ví Dụ">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>    

                    <!-- Modal Edit-->
                    <c:forEach items="${listE}" var="o">
                        <div class="modal fade" id="viewExample${o.exampleID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="UpdateExampleControl" method="post">
                                        <div class="modal-header">                      
                                            <h4 class="modal-title">Cập Nhật Ví Dụ</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body"> 
                                            <div class="form-group" hidden>
                                                <label>ID</label>
                                                <input value="${o.exampleID}" name="exampleID" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group" >
                                                <label>Câu Ví Dụ</label>
                                                <input value="${o.exJ}" name="exJ" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Nghĩa</label>
                                                <input value="${o.exV}" name="exV" type="text" class="form-control" required>
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
                    </c:forEach>

                    <!-- Modal Delete-->
                    <c:forEach items="${listE}" var="o">
                        <div class="modal fade" id="deleteExample${o.exampleID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">Bạn muốn xóa ?</div>                       
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                                        <a class="btn btn-primary" href="DeleteExampleControl?exampleID=${o.exampleID}">Xóa</a>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </c:forEach>


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
