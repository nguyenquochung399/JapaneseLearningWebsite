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

        <title>Quản Lí Ngữ Pháp</title>
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
                                    <h2>Quản Lí Ngữ Pháp</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addGrammar" class="btn btn-success" data-toggle="modal" data-target="#addGrammar" style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>Tạo Ngữ Pháp</span></a>                                             
                                </div>
                            </div>
                        </div>
                        <br>
                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th hidden>ID</th>                                   
                                    <th>Cấu Trúc</th>
                                    <th>Xem</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                    <th>Ví Dụ</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listG}" var="o">
                                    <tr>
                                        <td hidden>${o.grammarID}</td>     
                                        <td>${o.structure}</td>                                                                                                       
                                        <td><a href="#viewGrammar${o.grammarID}" data-toggle="modal" data-target="#viewGrammar${o.grammarID}"><i class="edit" data-toggle="modal"><i class="fa fa-eye" data-toggle="tooltip" title="Xem"></i></a></td>
                                        <td><a href="#editGrammar${o.grammarID}" data-toggle="modal" data-target="#editGrammar${o.grammarID}"><i class="fa fa-pen" data-toggle="tooltip" title="Sửa"></i></a></td>
                                        <td><a href="#deleteGrammar${o.grammarID}" data-toggle="modal" data-target="#deleteGrammar${o.grammarID}"><i class="fa fa-trash" data-toggle="tooltip" title="Xóa"></i></a></td>
                                        <td><a href="ManageExampleControl?grammarID=${o.grammarID}"><i class="delete" data-toggle="modal"><i class="fa fa-list-alt" data-toggle="tooltip" title="Ví Dụ"></i></a></td>
                                    </tr>
                                </c:forEach>                              
                            </tbody>
                    </div>

                    <!-- Modal Add-->
                    <div class="modal fade" id="addGrammar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="CreateGrammarControl" method="post">
                                    <div class="modal-header">                      
                                        <h4 class="modal-title">Thêm Ngữ Pháp</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">                    
                                        <div class="form-group">
                                            <label>Cấu Trúc</label>
                                            <textarea name="structure" type="text" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Cách Dùng</label>
                                            <textarea name="use" type="text" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Cấp Độ</label>
                                            <select name="level" class="form-select" aria-label="Default select example">
                                                <c:forEach items="${listL}" var="o">
                                                    <option value="${o.levelID}">${o.levelName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                        <input type="submit" name="submit" class="btn btn-primary" value="Thêm Ngữ Pháp">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>    

                    <!-- Modal View-->
                    <c:forEach items="${listG}" var="o">
                        <div class="modal fade" id="viewGrammar${o.grammarID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form>
                                        <div class="modal-header">                      
                                            <h4 class="modal-title">Chi Tiết Ngữ Pháp</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">                    
                                            <div class="form-group" hidden>
                                                <label>ID</label>
                                                <input value="${o.grammarID}" name="grammarID" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Cấu Trúc: <br>${o.structure}</label>

                                            </div>
                                            <div class="form-group">
                                                <label>Cấp Độ: ${o.level}</label>                                                      
                                            </div>
                                            <div class="form-group">
                                                <label>Cách Dùng: ${o.use}</label>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-primary" data-dismiss="modal" value="Thoát">     
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>    
                    </c:forEach>

                    <!-- Modal Edit-->
                    <c:forEach items="${listG}" var="o">
                        <div class="modal fade" id="editGrammar${o.grammarID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="UpdateGrammarControl" method="post">
                                        <div class="modal-header">                      
                                            <h4 class="modal-title">Cập Nhật Ngữ Pháp</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">                    
                                            <div class="form-group" hidden>
                                                <label>ID</label>
                                                <input value="${o.grammarID}" name="grammarID" type="text" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Cấu Trúc</label>
                                                <textarea value="${o.structure}" name="structure" type="text" class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Cách Dùng</label>
                                                <textarea value="${o.use}" name="use" type="text" class="form-control" required></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Cấp Độ</label>
                                                <select name="level" class="form-select" aria-label="Default select example">
                                                    <c:forEach items="${listL}" var="o">
                                                        <option value="${o.levelID}">${o.levelName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">    
                                            <input type="submit" name="submit" class="btn btn-primary" value="Cập Nhật Ngữ Pháp">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>    
                    </c:forEach>


                    <!-- Modal Delete-->
                    <c:forEach items="${listG}" var="o">
                        <div class="modal fade" id="deleteGrammar${o.grammarID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">Bạn muốn xóa ngữ pháp ?</div>                       
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                                        <a class="btn btn-primary" href="DeleteGrammarControl?grammarID=${o.grammarID}">Xóa</a>
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