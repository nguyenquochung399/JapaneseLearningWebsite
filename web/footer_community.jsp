<%-- 
    Document   : alphabet_alphabet
    Created on : 24-Nov-2022, 21:21:57
    Author     : A Hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Nguyên Tắc Cộng Đồng</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="user/img/logo.jpg" rel="icon">
        <link href="user/img/logo.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="user/vendor/aos/aos.css" rel="stylesheet">
        <link href="user/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="user/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="user/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="user/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="user/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="user/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="user/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Gp - v4.9.1
        * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>



    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top" style="background-color: rgba(0,0,0,0.8);">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="HomeControl">JPD<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="user/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="HomeControl">Trang Chủ</a></li>
                        <li class="dropdown"><a href=""><span>Tài Liệu</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a><span>Bảng Chữ Cái</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listT}" var="q">
                                            <li><a href="AlphabetControl?type=${q.type}">${q.type}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Kanji</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="w">
                                            <li><a href="KanjiControl?levelID=${w.levelID}">${w.levelName}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Ngữ Pháp</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="GrammarControl?levelID=${e.levelID}">${e.levelName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="nav-link scrollto"><span>Kiểm Tra</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:forEach items="${listtag}" var="i">
                                    <li class="dropdown"><a><span>${i.desc}</span> <i class="bi bi-chevron-right"></i></a>
                                        <ul>
                                            <c:forEach items="${listlevel}" var="x">
                                                <li><a href="choiceTestControl?levelID=${x.levelID}&&tagID=${i.tagID}">${x.levelName}</a></li>
                                                </c:forEach> 
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto " href="<%= request.getContextPath()%>/Practice">Luyện Tập</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Forum">Cộng Đồng</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Chat">Hỗ Trợ</a></li>
                            <c:if test="${sessionScope.acc.role == 'Quản trị viên' || sessionScope.acc.role == 'Quản lí nội dung'}">
                            <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/dashboard.jsp">Quản Lý</a></li>
                            </c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <ul>
                    <c:if test="${sessionScope.acc.role == 'Người dùng' || sessionScope.acc.role == 'Quản trị viên' || sessionScope.acc.role == 'Quản lí nội dung'}">
                        <!-- đã đăng nhập -->

                        <a href="ProfileUserControl" class="logo me-auto me-lg-0" ><img src="${sessionScope.acc.avatar}" alt="" class="rounded-circle" width="40" height="40"></a>                        
                        <a class="username dropdown-toggle" data-bs-toggle="dropdown" style="color: white">${sessionScope.acc.username}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ProfileUserControl">Tài Khoản</a></li>  
                            <li><a class="dropdown-item" href="viewHistoryTest">Lịch Sử Kiểm Tra</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">Đăng Xuất</a></li>                            
                        </ul>
                    </c:if>

                    <c:if test="${sessionScope.acc.role != 'Người dùng' && sessionScope.acc.role != 'Quản trị viên' && sessionScope.acc.role != 'Quản lí nội dung'}">               
                        <a href="account_signup.jsp" class="get-started-btn scrollto">Đăng Ký</a>
                        <a href="account_login.jsp" class="get-started-btn scrollto">Đăng Nhập</a>
                    </c:if>
                </ul>
            </div>

            <style>
                .dropdown-menu li:hover>a{
                    background-color: #f5b8c5;
                }
            </style>
        </header><!-- End Header -->


        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                        <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Bạn muốn đăng xuất ?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Hủy</button>
                        <a class="btn" style="background-color: #f5b8c5; color: white" href="LogoutControl">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>


        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>${type}</h2>
                        <ol>
                            <li><a href="HomeControl">Trang Chủ</a></li>
                            <li>Nguyên Tắc Cộng Đồng</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- ======= Services Section ======= -->
            <section >
                <div class="container">
                    <h2 style="text-align: center">Nguyên Tắc Cộng Đồng</h2>
                    <p>Tiêu chuẩn cộng đồng của chúng tôi đóng vai trò như tài liệu hướng dẫn giao tiếp trên JPD. Chúng tôi sẽ tiếp tục phát triển các tiêu chuẩn này theo thời gian. Với tinh thần đó, chúng tôi yêu cầu các thành viên của cộng đồng JPD tuân thủ các nguyên tắc này.</p>
                    <h5>1. Bạo lực có thể xảy ra</h5>
                    <p>Mục đích của chúng tôi là ngăn chặn nguy cơ tiềm ẩn trong thế giới thực mà có thể liên quan đến nội dung trên Facebook. Chúng tôi hiểu rằng mọi người thường bày tỏ thái độ khinh thị hoặc bất hòa bằng cách đe dọa hoặc nói đùa và giả vờ kêu gọi bạo lực. Đó là lý do chúng tôi cố gắng xem xét ngôn ngữ, bối cảnh và chi tiết để phân biệt những câu vô tình với nội dung tạo thành sự đe dọa có thể xảy ra với sự an toàn chung hoặc cá nhân. Để xác định liệu một mối đe doạ có thể xảy ra hay không, chúng tôi cũng có thể xem xét các thông tin bổ sung như khả năng biết đến công khai và điểm yếu của một người. Chúng tôi xóa nội dung cộng tác với cơ quan thực thi pháp luật khi chúng tôi cho rằng thực sự có nguy cơ tổn hại về vật chất hoặc mối đe dọa trực tiếp tới sự an toàn của cộng đồng.</p>
                    <h5>2. Khuyến khích hoặc quảng bá hành vi phạm tội</h5>
                    <p>Chúng tôi nghiêm cấm mọi người khuyến khích hoặc quảng bá hành vi phạm tội bạo lực, trộm cắp và/hoặc gian lận vì chúng tôi không muốn bỏ qua cho hoạt động này và vì điều đó có thể dẫn đến rủi ro về hành vi bắt chước. Chúng tôi cũng không cho phép mọi người mô tả hoạt động tội phạm hoặc thừa nhận những tội ác mà họ hoặc đồng bọn của họ đã phạm phải. Tuy nhiên, chúng tôi cho phép mọi người tranh luận hoặc biện hộ cho tính hợp pháp của hoạt động tội phạm, cũng như đề cập đến chúng theo cách ẩn dụ hoặc châm biếm.</p>
                    <h5>3. Bắt nạt</h5>
                    <p>Bắt nạt xảy ra ở nhiều nơi, dưới nhiều hình thức khác nhau – từ việc đưa ra những lời phát biểu hạ thấp danh tiếng của ai đó nhằm đe dọa ai đó. Chúng tôi không chấp nhận hành vi bắt nạt trên JPD vì chúng tôi muốn các thành viên trong cộng đồng của mình cảm thấy an toàn và được tôn trọng.Chúng tôi sẽ xóa nội dung cố ý nhằm vào các cá nhân với mục đích hạ nhục hoặc nhạo báng họ. Chúng tôi nhận thấy rằng bắt nạt có thể đặc biệt nguy hại với trẻ vị thành niên. Do đó, chính sách của chúng tôi đã tăng cường bảo vệ trẻ vị thành niên vì trẻ dễ bị bắt nạt trực tuyến hơn và dễ bị tổn thương hơn trong hoàn cảnh đó. Trong một số trường hợp, chúng tôi yêu cầu cá nhân là mục tiêu của hành vi bắt nạt báo cáo nội dung cho chúng tôi trước khi xóa.</p>
                    <h5>4. Quấy rối</h5>
                    <p>Chúng tôi không khoan dung với hành vi quấy rối trên JPD. Chúng tôi muốn mọi người cảm thấy an toàn khi tương tác và kết nối với cộng đồng của họ. Chính sách ngăn chặn quấy rối của chúng tôi áp dụng cho cả người của công chúng và cá nhân vì chúng tôi muốn ngăn chặn liên lạc không mong muốn hoặc có hại trên nền tảng. Ngữ cảnh và mục đích rất quan trọng. Chúng tôi cho phép mọi người chia sẻ các bài viết nếu biết rõ là họ chia sẻ nội dung nào đó nhằm lên án hoặc thu hút sự chú ý vào vấn đề quấy rối. Ngoài việc báo cáo nội dung và hành vi quấy rối, chúng tôi khuyến khích mọi người sử dụng công cụ có sẵn trên JPD để ngăn ngừa quấy rối.</p>
                    <h5>5. Vi phạm quyền riêng tư và quyền riêng tư về hình ảnh</h5>
                    <p>Quyền riêng tư và bảo vệ thông tin cá nhân là những giá trị cơ bản quan trọng của JPD. Chúng tôi luôn nỗ lực bảo vệ tài khoản và thông tin cá nhân của bạn để tránh cho bạn khỏi những thiệt hại tiềm ẩn về thể chất hoặc tài chính. Bạn không được đăng thông tin cá nhân hoặc thông tin bí mật của người khác mà không được họ đồng ý trước.</p>
                    <h5>6. Ngôn từ kích động thù địch</h5>
                    <p>Chúng tôi không cho phép sử dụng ngôn từ kích động thù địch trên JPD vì điều đó tạo ra môi trường đe dọa và bài trừ; đồng thời, trong một số trường hợp còn có thể thúc đẩy bạo lực trong thế giới thực.Chúng tôi định nghĩa ngôn từ kích động thù địch là sự công kích trực tiếp những gì mà chúng tôi gọi là đặc điểm được bảo vệ – chủng tộc, dân tộc, nguồn gốc quốc gia, thành phần tôn giáo, khuynh hướng tình dục, giới tính, bản dạng giới và tình trạng khuyết tật hoặc căn bệnh nghiêm trọng. Chúng tôi định nghĩa sự công kích là ngôn từ bạo lực hoặc xúc phạm nhân phẩm, những lời nhục mạ, kêu gọi bài trừ hoặc cô lập.</p> 
                    <p>Đôi khi, mọi người chia sẻ nội dung chứa ngôn từ kích động thù địch của người khác nhằm mục đích nâng cao nhận thức hoặc giáo dục người khác. Tương tự như vậy, trong một số trường hợp, mọi người sử dụng các từ hoặc thuật ngữ lẽ ra là vi phạm tiêu chuẩn của chúng tôi nhưng để tự nói về mình hoặc để truyền sức mạnh tinh thần. Trong trường hợp này, chúng tôi cho phép sử dụng nội dung nêu trên nhưng mong mọi người nêu rõ ý định của mình. Điều này giúp chúng tôi hiểu rõ hơn lý do họ chia sẻ nội dung đó. Khi ý định không rõ ràng, chúng tôi có thể xóa nội dung.</p>
                    <p>Chúng tôi cho phép mọi người viết bình luận hài hước và mang tính xã hội liên quan đến các chủ đề này. Ngoài ra, chúng tôi tin rằng khi mọi người sử dụng danh tính thật, họ sẽ có trách nhiệm hơn khi chia sẻ loại bình luận này.</p>
                    <h5>7. Spam</h5>
                    <p>Chúng tôi nỗ lực để hạn chế lan truyền spam thương mại nhằm ngăn chặn quảng cáo lừa đảo, gian lận và vi phạm bảo mật. Tất cả những hành vi này đều làm giảm khả năng chia sẻ và kết nối của mọi người. Chúng tôi không cho phép mọi người sử dụng thông tin sai lệch hoặc không chính xác.</p>
                </div>
            </section><!-- End Services Section -->

        </main><!-- End #main -->

    </main><!-- End #main -->

    <jsp:include page="footer_user.jsp" />


    <!-- Vendor JS Files -->
    <script src="user/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="user/vendor/aos/aos.js"></script>
    <script src="user/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="user/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="user/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="user/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="user/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="user/js/main.js"></script>

</body>

</html>
