<%-- 
Document   : detailTest
Created on : Oct 12, 2022, 12:09:38 AM
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

        <title>Quản Lí Bài Kiểm Tra</title>
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
                                    <h2>Quản Lý Bài Kiểm Tra</h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#add" class="btn btn-success" data-toggle="modal" data-target="#add" 
                                       style="margin-left: 430px; background-color: #000000; border-color: #000000;">
                                        <span>                                            
                                            Thêm Bài Kiểm Tra
                                        </span>
                                    </a>                                             
                                </div>
                            </div>
                        </div>
                        <br>      
                        <form action="${pageContext.request.contextPath}/testControl" method="POST">
                            <table id="example" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Nội Dung</th>
                                        <th>Thể Loại</th>
                                        <th>Mức Độ</th>
                                        <th>Trạng Thái</th>
                                        <th>Ẩn / Hiện</th>
                                        <th>Cập Nhật</th>
                                        <th>Xoá</th>
                                        <th>Quản Lý Câu Hỏi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listTest}" var="o" varStatus="i">
                                        <tr>
                                            <td style="text-align: center;">${i.index+1}</td>
                                            <td>${o.name}</td>
                                            <td style="text-align: center;">
                                                <c:forEach items="${listtag}" var="t">
                                                    <c:if test="${o.tagID.equals(t.tagID)}">
                                                        ${t.desc}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:forEach items="${listlevel}" var="l">
                                                    <c:if test="${o.levelID.equals(l.levelID)}">
                                                        ${l.levelName}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:if test="${o.status == 1}">Mở</c:if>
                                                <c:if test="${o.status == 1}&&${o.hasResult!=0}">Mở + Đã có kết quả</c:if>
                                                <c:if test="${o.status == 0}">Đang Hoàn Thiện</c:if>
                                            </td>
                                            <td style="text-align: center;">
                                                <c:if test="${o.status==1}">
                                                    <button type="submit" form="changeStstus${i.index}" style="all: unset; cursor: pointer;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                                        </svg>
                                                    </button>
                                                </c:if>
                                                <c:if test="${o.status==0}">
                                                    <button type="submit" form="changeStstus${i.index}" style="all: unset; cursor: pointer;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-fill" viewBox="0 0 16 16">
                                                        <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7.029 7.029 0 0 0 2.79-.588zM5.21 3.088A7.028 7.028 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474L5.21 3.089z"/>
                                                        <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829l-2.83-2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12-.708.708z"/>
                                                        </svg>
                                                    </button>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${o.status==0}">
                                                    <c:if test = "${o.hasResult==0}"> 
                                                        <a  data-toggle="modal" data-target="#editTestModal${i.index+1}">
                                                            <i class="fa fa-pen" title="Cập Nhật"></i>                                               

                                                        </a>
                                                    </c:if>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test = "${o.status==0}">
                                                    <a data-toggle="modal" data-target="#deleteTestModal${i.index+1}">
                                                        <i class="fa fa-trash" title="Xóa"></i>  
                                                    </a>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="managequestion?testID=${o.testID}">
                                                    <i class="fa fa-list-alt" title="Quản lí câu hỏi"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>  
                    </div> 

                    <c:forEach items="${listTest}" var="o" varStatus="i">
                        <!-- Form Change Status Test-->
                        <form id="changeStstus${i.index}" action="changeStstus" method="POST">
                            <input  name="testID" value="${o.testID}"style="display: none">
                            <input  name="name" value="${o.name}"style="display: none">
                            <input  name="tag" value="${o.tagID}"style="display: none">
                            <input  name="level" value="${o.levelID}"style="display: none">
                            <input  name="status" value="${o.status==1?"0":"1"}"style="display: none">
                        </form>

                        <!-- Modal Edit Test-->
                        <div class="modal fade" id="editTestModal${i.index+1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">                      
                                        <h5 class="modal-title" id="exampleModalLabel">Cập Nhật Thông Tin Của Bài Kiểm Tra</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form id="editTestform${i.index}" action="${pageContext.request.contextPath}/testEdit" method="post">
                                            <div class="form-group">
                                                <input name="testID" value="${o.testID}" style="display: none">
                                            </div>
                                            <div class="form-group">
                                                <label>Nội dung:</label>
                                                <label id="testError" hidden>Hãy nhập lại đi ạ! Vì nó không có thay đổi.</label>
                                                <input id="testEdit" type="text" name="name" value="${o.name}" class="form-control" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Thể loại:</label>
                                                <label id="tagError" hidden>Hãy nhập lại đi ạ! Vì nó không có thay đổi.</label>
                                                <select name="listtag">
                                                    <c:forEach items="${listtag}" var="t">
                                                        <option value="${t.tagID}" ${o.tagID == t.tagID?"selected":""}>${t.desc}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Mức độ:</label>
                                                <label id="levelError" hidden>Hãy nhập lại đi ạ! Vì nó không có thay đổi.</label>
                                                <select name="listlevel">
                                                    <c:forEach items="${listlevel}" var="l">
                                                        <option value="${l.levelID}" ${o.levelID == l.levelID?"selected":""}>${l.levelName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>  
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                        <input type="submit" form="editTestform${i.index}" name="submit" class="btn btn-primary" value="Cập Nhật">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Delete Test-->
                        <div class="modal fade" id="deleteTestModal${i.index+1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">                      
                                        <h5 class="modal-title" id="exampleModalLabel">Xoá Câu Hỏi</h5>
                                    </div>
                                    <div class="modal-body">  
                                        <form id="deleteTestform${i.index+1}" action="${pageContext.request.contextPath}/testDelete" method="post">
                                            <div class="form-group">
                                                <label>Bạn muốn xóa bài kiểm tra?</label>
                                                <input name="testID" value="${o.testID}" style="display: none"/>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                        <input type="submit" form="deleteTestform${i.index+1}" name="submit" class="btn btn-primary" value="Xóa">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- Modal Add-->
                    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <div class="modal-header">                      
                                    <h5 class="modal-title">Thêm Bài Kiểm Tra</h5>
                                </div>
                                <div class="modal-body">   
                                    <form id="addTestform" action="${pageContext.request.contextPath}/testCreate" method="post">                 
                                        <div class="form-group">
                                            <label>Nội dung:</label>
                                            <input id="testAdd" type="text" name="name" class="form-control" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Thể loại:</label>
                                            <select name="listtag">
                                                <c:forEach items="${listtag}" var="t">
                                                    <option value="${t.tagID}">${t.desc}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Mức độ:</label>
                                            <select name="listlevel">
                                                <c:forEach items="${listlevel}" var="l">
                                                    <option value="${l.levelID}">${l.levelName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>                                
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                    <input type="submit" form="addTestform" name="submit" class="btn btn-primary" value="Thêm Bài Kiểm Tra">
                                </div>

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


