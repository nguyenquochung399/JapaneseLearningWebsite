<%-- 
    Document   : practice
    Created on : Nov 26, 2022, 7:14:55 PM
    Author     : ACER
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Alphabet</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/user/img/logo.jpg" rel="icon">
        <link href="${pageContext.request.contextPath}/user/img/logo.jpg" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/user/vendor/aos/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/user/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/user/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Gp - v4.9.1
        * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <style type="text/css">

            .tools a
            {
                text-decoration: none;
                font-size: 1.5rem;
            }
            #colors_sketch
            {
                border: 1px solid #ccc;
            }
            .draw
            {
                color: blue
            }
            #wrapper{
                display: flex;
                align-items: center;
                justify-content: center;                    
            }
            #colors_sketch{
                margin: 20px;
            }
            #imgCapture{
                margin: 20px;
            }

        </style>
    </head>

    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top" style="background-color: rgba(0,0,0,0.8);">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <h1 class="logo me-auto me-lg-0"><a href="<%= request.getContextPath()%>/HomeControl">JPD<span>.</span></a></h1>

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/HomeControl">Trang Ch???</a></li>
                        <li class="dropdown"><a href=""><span>T??i Li???u</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a><span>B???ng Ch??? C??i</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listT}" var="q">
                                            <li><a href="<%= request.getContextPath()%>/AlphabetControl?type=${q.type}">${q.type}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Kanji</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="w">
                                            <li><a href="<%= request.getContextPath()%>/KanjiControl?levelID=${w.levelID}">${w.levelName}</a></li>
                                            </c:forEach> 
                                    </ul>
                                </li>
                                <li class="dropdown"><a><span>Ng??? Ph??p</span> <i class="bi bi-chevron-right"></i></a>
                                    <ul>
                                        <c:forEach items="${listL}" var="e">
                                            <li><a href="<%= request.getContextPath()%>/GrammarControl?levelID=${e.levelID}">${e.levelName}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="nav-link scrollto"><span>Ki???m Tra</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:forEach items="${listtag}" var="i">
                                    <li class="dropdown"><a><span>${i.desc}</span> <i class="bi bi-chevron-right"></i></a>
                                        <ul>
                                            <c:forEach items="${listlevel}" var="x">
                                                <li><a href="<%= request.getContextPath()%>/choiceTestControl?levelID=${x.levelID}&&tagID=${i.tagID}">${x.levelName}</a></li>
                                                </c:forEach> 
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto active" href="<%= request.getContextPath()%>/Practice">Luy???n T???p</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Forum">C???ng ?????ng</a></li>
                        <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/Chat">H??? Tr???</a></li>
                            <c:if test="${sessionScope.acc.role == 'Qu???n tr??? vi??n' || sessionScope.acc.role == 'Qu???n l?? n???i dung'}">
                            <li><a class="nav-link scrollto" href="<%= request.getContextPath()%>/dashboard.jsp">Qu???n L??</a></li>
                            </c:if>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
                <ul>
                    <c:if test="${sessionScope.acc.role == 'Ng?????i d??ng' || sessionScope.acc.role == 'Qu???n tr??? vi??n' || sessionScope.acc.role == 'Qu???n l?? n???i dung'}">
                        <!-- ???? ????ng nh???p -->

                        <a href="<%= request.getContextPath()%>/ProfileUserControl" class="logo me-auto me-lg-0" ><img src="${sessionScope.acc.avatar}" alt="" class="rounded-circle" width="40" height="40"></a>                        
                        <a class="username dropdown-toggle" data-bs-toggle="dropdown" style="color: white">${sessionScope.acc.username}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/ProfileUserControl">T??i Kho???n</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logoutModal">????ng Xu???t</a></li>                            
                        </ul>
                    </c:if>

                    <c:if test="${sessionScope.acc.role != 'Ng?????i d??ng' && sessionScope.acc.role != 'Qu???n tr??? vi??n' && sessionScope.acc.role != 'Qu???n l?? n???i dung'}">               
                        <a href="<%= request.getContextPath()%>/account_signup.jsp" class="get-started-btn scrollto">????ng K??</a>
                        <a href="<%= request.getContextPath()%>/account_login.jsp" class="get-started-btn scrollto">????ng Nh???p</a>
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
                        <h5 class="modal-title" id="exampleModalLabel">Th??ng B??o</h5>
                        <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">??</span>
                        </button>
                    </div>
                    <div class="modal-body">B???n mu???n ????ng xu???t ?</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">H???y</button>
                        <a class="btn" style="background-color: #f5b8c5; color: white" href="<%= request.getContextPath()%>/LogoutControl">????ng Xu???t</a>
                    </div>
                </div>
            </div>
        </div>

        <main id="main" class="bg-light">

            <!-- ======= Breadcrumbs ======= -->
            <section id="breadcrumbs" class="breadcrumbs bg-light">
                <div class="container">

                    <div class="d-flex justify-content-between align-items-center">
                        <h2>Luy???n T???p</h2>
                        <ol>
                            <li><a href="<%= request.getContextPath()%>/HomeControl">Trang Ch???</a></li>
                            <li>Luy???n T???p</li>
                        </ol>
                    </div>

                </div>
            </section><!-- End Breadcrumbs -->

            <!-- ??i???n n???i dung -->
            <div class="container">
                <div id="myGroup">
                    <div class="text-center">
                        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                            <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample1" aria-expanded="false"
                                    aria-controls="multiCollapseExample1" class="btn btn-secondary">Luy???n Nghe</button>
                            <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2" aria-expanded="false"
                                    aria-controls="multiCollapseExample2" class="btn btn-secondary">Luy???n N??i</button>
                            <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample3" aria-expanded="false"
                                    aria-controls="multiCollapseExample3" class="btn btn-secondary">D???ch Thu???t</button>
                            <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample4" aria-expanded="false"
                                    aria-controls="multiCollapseExample4" class="btn btn-secondary">Luy???n Vi???t</button>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="accordion-group">
                        <div data-bs-parent="#myGroup" class="collapse  multi-collapse" id="multiCollapseExample1">
                            <div class="card mb-4 box-shadow">
                                <div class="card-body">
                                    <div class="card-body text-center">
                                        <textarea name="sentence" rows="3" class="form-control" required="required" id="text"></textarea>
                                        <br>
                                        <label for="speak">Ch???n T???c ?????</label>
                                        <select id="speak">
                                            <option value="0.5">0.5</option>
                                            <option selected value="1">1</option>
                                            <option value="2">2</option>
                                        </select>
                                        <button class="btn" onclick="myFunction()" style="background-color: #f5b8c5; margin:auto; color: white">Ph??t ??m</button>
                                    </div>
                                    <script>
                                        function myFunction() {
                                            var text = document.getElementById("text").value
                                            var speed = document.getElementById("speak").value
                                            document.getElementById("text").value = text;

                                            var msg = new SpeechSynthesisUtterance();
                                            var voices = window.speechSynthesis.getVoices();

                                            msg.volume = 1; // 0 to 1
                                            //msg.rate = 1; // 0.1 to 10
                                            msg.rate = speed; // 0.1 to 10  
                                            msg.text = text;
                                            msg.lang = 'ja-JP';

                                            msg.onend = function (e) {
                                                console.log('Finished in ' + event.elapsedTime + ' seconds.');
                                            };
                                            speechSynthesis.speak(msg);
                                        }

                                    </script>
                                </div>
                            </div>
                        </div>
                        <div data-bs-parent="#myGroup" class="collapse  multi-collapse" id="multiCollapseExample2">
                            <div class="card mb-4 box-shadow">
                                <div class="card-body text-center">
                                    <button class="btn" id="btnTalk" style="background-color: #f5b8c5; margin:auto; color: white">Nh???n ????? N??i</button>
                                    <br><br>
                                    <span style="font-weight: bold; font-size: large;" id="message"></span>
                                    <br>
                                    <span style="font-weight: bold; font-size: large;" id="confidence"></span>
                                    <br><br>
                                    <script>
                                        var message = document.querySelector('#message');
                                        var messageC = document.querySelector('#confidence');

                                        var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
                                        var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

                                        var grammar = '#JSGF V1.0';

                                        var recognition = new SpeechRecognition();
                                        var speechRecognitionList = new SpeechGrammarList();
                                        speechRecognitionList.addFromString(grammar, 1);
                                        recognition.grammars = speechRecognitionList;
                                        recognition.lang = 'ja-JP';
                                        recognition.interimResults = false;

                                        recognition.onresult = function (event) {
                                            var lastResult = event.results.length - 1;
                                            var content = event.results[lastResult][0].transcript;
                                            var confidence = event.results[lastResult][0].confidence;
                                            message.textContent = 'C??u n??i nh???n di???n ???????c: ' + content;
                                            
                                        };

                                        recognition.onspeechend = function () {
                                            // Stop recognition
                                            recognition.stop();
                                        };

                                        recognition.onerror = function (event) {
                                            message.textContent = 'Kh??ng th??? nh???n di???n gi???ng n??i. Vui l??ng th??? l???i!';
                                        }

                                        document.querySelector('#btnTalk').addEventListener('click', function () {
                                            recognition.start();
                                        });
                                    </script>
                                    <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample2"
                                            aria-expanded="false" aria-controls="multiCollapseExample2"
                                            class="btn btn-outline-secondary">????ng</button>
                                </div>

                            </div>
                        </div>
                        <%
                            String text = (String) request.getAttribute("text");
                            String translatedText = (String) request.getAttribute("translatedText");
                            if (translatedText != null) {
                        %>
                        <div data-bs-parent="#myGroup" class="collapse show multi-collapse" id="multiCollapseExample3">
                            <%
                            } else {
                            %>
                            <div data-bs-parent="#myGroup" class="collapse  multi-collapse" id="multiCollapseExample3">
                                <%
                                    }
                                %>
                                <div class="card mb-4 box-shadow">
                                    <div class="card-body">
                                        <form method="post" action="Practice" accept-charset="utf-8">
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Nh???p V??n B???n Ti???ng Nh???t</label>                                        
                                                <%
                                                    if (text != null) {
                                                %>
                                                <textarea name="sentence" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=text%></textarea>
                                                <%
                                                } else {
                                                %>
                                                <textarea name="sentence" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <br>
                                            <button type="submit" name="translate" value="translate" class="btn" style="background-color: #f5b8c5; margin:auto; color: white">D???ch</button>
                                            <button type="button" data-bs-toggle="collapse" data-bs-target="#multiCollapseExample3"
                                                    aria-expanded="false" aria-controls="multiCollapseExample3"
                                                    class="btn btn-outline-secondary">????ng</button>
                                        </form>
                                    </div>
                                    <div class="card-body">
                                        <label for="exampleFormControlTextarea2">B???n D???ch Ti???ng Vi???t</label>
                                        <%
                                            if (translatedText != null) {
                                        %>
                                        <textarea class="form-control" id="exampleFormControlTextarea2" rows="3"><%=translatedText%></textarea>
                                        <%
                                        } else {
                                        %>
                                        <textarea class="form-control" id="exampleFormControlTextarea2" rows="3"></textarea>
                                        <%
                                            }
                                        %>
                                    </div>

                                </div>
                            </div>
                            <%
                                String recognizeWord = (String) session.getAttribute("recognizeWord");
                                if (recognizeWord != null) {
                                    if (translatedText == null) {
                            %>
                            <div data-bs-parent="#myGroup" class="collapse show multi-collapse" id="multiCollapseExample4">
                                <%
                                } else {
                                %>
                                <div data-bs-parent="#myGroup" class="collapse multi-collapse" id="multiCollapseExample4">
                                    <%
                                        }
                                    } else {
                                    %>
                                    <div data-bs-parent="#myGroup" class="collapse multi-collapse" id="multiCollapseExample4">
                                        <%
                                            }
                                        %>
                                        <div class="card mb-4 box-shadow">
                                            <div class="card-body text-center">
                                                <div class="tools">
                                                    <p>(T??nh n??ng g???p l???i khi up l??n server)</p>
                                                    <a class="draw" href="#colors_sketch" data-tool="marker">V??? &nbsp</a>                                                    
                                                    <a class="draw" href="#colors_sketch" data-tool="eraser">&nbsp Xo??</a>

                                                </div>
                                                <br/>
                                                <div id="wrapper">
                                                    <canvas id="colors_sketch" width="200" height="200">
                                                    </canvas>                                                    
                                                    <input type="button" class="btn" style="background-color: #f5b8c5; color: white" id="btnSave" value="Nh???n Di???n" />
                                                </div>                                                
                                                <br />
                                                <%
                                                    String imageBase64 = (String) session.getAttribute("imageBase64");
                                                    if (imageBase64 != null) {

                                                %>
                                                <div id="wrapper">
                                                    <img id = "imgCapture" src="<%= imageBase64%>" alt = "" style = "border:1px solid #ccc" />
                                                    <%
                                                        }
                                                    %>

                                                    <%
                                                        if (recognizeWord != null) {
                                                    %>                                                    
                                                    <p style="display: inline; font-size:100px; font-weight: bolder"><%= recognizeWord%></p>
                                                </div>
                                                <%
                                                    }
                                                %>
                                                <br />
                                                <br />


                                                <form style="display: none" id="formSubmitImage64" method="post" action="SubmitImage">
                                                    <input id="imageBase64" name="imageBase64" value=""></input>
                                                    <button id="submitImage" type="submit" name="submitImage" value="submitImage">Send Image</button>
                                                </form>

                                                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                                                <script src="https://cdn.rawgit.com/mobomo/sketch.js/master/lib/sketch.min.js" type="text/javascript"></script>
                                                <script type="text/javascript">

                                        $(function () {
                                            $('#colors_sketch').sketch();
                                            $(".tools a").eq(0).attr("style", "color:#000");
                                            $(".tools a").click(function () {
                                                $(".tools a").removeAttr("style");
                                                $(this).attr("style", "color:#000");
                                            });
                                            $("#btnSave").bind("click", function () {
                                                var base64 = $('#colors_sketch')[0].toDataURL();
                                                $("#imageBase64").attr("value", base64);
                                                document.getElementById('formSubmitImage64').submit();
                                            });
                                        });
                                                </script>                                                
                                            </div>
                                        </div>

                                        <script>
                                            var voiceList = document.querySelector('#voiceList');
                                            var txtInput = document.querySelector('#txtInput');
                                            var btnSpeak = document.querySelector('#btnSpeak');



                                            var tts = window.speechSynthesis;
                                            var voices = [];

                                            GetVoice();

                                            if (speechSynthesis !== undefined) {
                                                speechSynthesis.onvoiceschanged = GetVoice;
                                            }

                                            btnSpeak.addEventListener('click', () => {
                                                var toSpeak = new SpeechSynthesisUtterance(txtInput.value);
                                                var selectedVoiceName = voiceList.selectedOptions[0].getAttribute('data-name');
                                                voices.forEach((voice) => {
                                                    if (voice.name === selectedVoiceName) {
                                                        toSpeak.voice = voice;
                                                    }
                                                });
                                                tts.speak(toSpeak);
                                            });

                                            function GetVoice() {
                                                voices = tts.getVoices();
                                                voiceList.innerHTML = '';
                                                voices.forEach((voice) => {
                                                    var listItem = document.createElement('option');
                                                    listItem.textContent = voice.name;
                                                    listItem.setAttribute('data-lang', voice.lang);
                                                    listItem.setAttribute('data-name', voice.name);
                                                    voiceList.appendChild(listItem);
                                                });

                                                voiceList.selectedIndex = 191;
                                            }
                                        </script>

                                    </div>
                                </div>

                            </div>
                        </div>

                        </main><!-- End #main -->

                        <!-- ======= Footer ======= -->
                        <jsp:include page="footer_user.jsp" />


                        <!-- Vendor JS Files -->
                        <script src="${pageContext.request.contextPath}/user/vendor/purecounter/purecounter_vanilla.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/aos/aos.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/glightbox/js/glightbox.min.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/isotope-layout/isotope.pkgd.min.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/swiper/swiper-bundle.min.js"></script>
                        <script src="${pageContext.request.contextPath}/user/vendor/php-email-form/validate.js"></script>

                        <!-- Template Main JS File -->
                        <script src="${pageContext.request.contextPath}/user/js/main.js"></script>

                        </body>

                        </html>
