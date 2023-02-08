<%-- 
    Document   : Test_manage_insretTest_Test
    Created on : Nov 30, 2022, 6:20:44 PM
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
                        <a href="${pageContext.request.contextPath}/testControl"><i class="fa fa-arrow-left"> Quay lại</i></a>

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
                                    <h2>Quản Lý Câu Hỏi</h2>
                                    <h4>Bài kiểm tra: ${nameTest}</h4>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#add" class="btn btn-success" data-toggle="modal" data-target="#add" 
                                       style="margin-left: 450px; background-color: #000000; border-color: #000000;"><span>                                          
                                            Thêm Câu Hỏi
                                        </span>
                                    </a>                                             
                                </div>
                            </div>
                        </div>
                        <br>  
                        <form action="${pageContext.request.contextPath}/questionControl" method="POST">
                            <table id="example" class="table table-striped" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>STT</th>                                       
                                        <th>Câu Hỏi</th>
                                        <th>Cập Nhật</th>
                                        <th>Xoá</th>
                                        <th>Quản Lý Câu Trả Lời</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listQuestion}" var="o" varStatus="i">
                                        <tr>
                                            <td>${i.index+1}</td>

                                            <td>${o.question}</td>

                                            <td>
                                                <c:if test="${sessionScope.status==0}">
                                                    <c:if test = "${sessionScope.hasResult==0}">
                                                        <a  data-toggle="modal" data-target="#editQuestionModal${i.index+1}">
                                                            <i class="fa fa-pen" title="Cập Nhật"></i>   
                                                        </a>
                                                    </c:if>
                                                </c:if>                                                
                                            </td>

                                            <td>
                                                <c:if test="${sessionScope.status==0}">
                                                    <c:if test = "${sessionScope.hasResult==0}">
                                                        <c:if test="${numberques!=1}">
                                                            <a data-toggle="modal" data-target="#deleteQuestionModal${i.index+1}">
                                                                <i class="fa fa-trash" title="Xóa"></i> 
                                                            </a>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="insertTest_Answer?questionID=${o.questionID}">
                                                    <i class="fa fa-list-alt" title="Quản lí câu trả lời"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </form>
                    </div> 

                    <c:forEach items="${listQuestion}" var="o" varStatus="i">
                        <!-- Modal Edit Question-->
                        <div class="modal fade" id="editQuestionModal${i.index+1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">                      
                                        <h5 class="modal-title" id="exampleModalLabel">Cập Nhật Câu Hỏi</h5>
                                    </div>
                                    <div class="modal-body">    
                                        <form id="editQuestionform${o.questionID}" action="${pageContext.request.contextPath}/insertTest_EditQuestion" method="post">
                                            <div class="form-group">
                                                <label>Câu Hỏi:</label>
                                                <input type="text" name="question" value="${o.question}" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <input name="questionID" value="${o.questionID}"  style="display: none">
                                                <input name="testID" value="${o.testID}"  style="display: none">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">

                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                        <input type="submit" form="editQuestionform${o.questionID}"  name="submit" class="btn btn-primary" value="Cập Nhật">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Delete Question-->
                        <div class="modal fade" id="deleteQuestionModal${i.index+1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">                      
                                        <h5 class="modal-title" id="exampleModalLabel">Xoá Câu Hỏi</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form id="deleteQuestionform${i.index+1}" action="${pageContext.request.contextPath}/insertTest_DeleteQuestion" method="post">
                                            <div class="form-group">
                                                <label>Bạn muốn xóa câu hỏi?</label>
                                                <input name="questionID" value="${o.questionID}" style="display: none">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">

                                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                        <input type="submit" form="deleteQuestionform${i.index+1}"  name="submit" class="btn btn-primary" value="Xóa">
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
                                    <h5 class="modal-title" id="exampleModalLabel">Thêm Câu Hỏi</h5>
                                </div>
                                <div class="modal-body">   
                                    <form id="addQuestioform" action="${pageContext.request.contextPath}/insertTest_CreateQuestion" method="post">
                                        <div class="form-group">
                                            <label>Câu Hỏi:</label>
                                            <input type="text" name="question" class="form-control" required>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">

                                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Hủy">
                                    <input type="submit" form="addQuestioform" name="submit" class="btn btn-primary" value="Thêm Câu Hỏi">
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