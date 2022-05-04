<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${sessionScope.account == null}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error.jsp"/>
</c:if>
<c:if test="${sessionScope.account != null}">

    <html lang="vi">
    <head>
        <link rel="stylesheet" href="/exam/exam.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.9/dist/sweetalert2.all.min.js"></script>
        <jsp:include page="/view/head.jsp"/>
        <title>Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán - Bộ Giáo Dục và Đào Tạo</title>
    </head>
    <body oncopy="return false" oncut="return false" onpaste="return false">
    <jsp:include page="/view/header.jsp"/>
    <div class="container-fluid">
        <div class="wrapper">
            <div class="main-content">
                <div class="breadcrumb">
                    <div class="container" onload="start()">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="">Thi THPTQG </a></li>
                                <li class="breadcrumb-item"><a href="">Toán</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-two-columns">
            <div class="container">
                <div class="row">
                    <div class="col-10">
                        <div class="skill-test-lists common-test-detail">
                            <div class="col-12 col-lg-12 col-sm-12">
                                <div class="row">
                                    <form action="/exam_list" name="exam-form" id="exam-form" method="post">
                                        <input type="hidden" name="action" value="examSummit">
                                        <input type="hidden" name="examId" value="${examId}">
                                        <input type="hidden" name="timeStart" value="${timeStart}">
                                        <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                        <div class="d9Box part-item detail">
                                            <h1 class="title22Bold ">${sessionScope.exam.examName}</h1>
                                            <p>Bộ Giáo Dục và Đào Tạo</p>
                                            <div class="detail-question">
                                                <div class="num-question col"><span><i
                                                        class="fa fa-check-square"></i> ${sessionScope.examQuestion.total} câu</span>
                                                </div>
                                                <div class="number-of-questions">
                                                        <%--                                        <div class="time-remain">--%>
                                                        <%--                                            <div class="time" style="display: flex; align-items: center"><i class="fa fa-clock-o" style="padding-right: 5px" aria-hidden="true"></i><countdown-time autostart add="90m"></countdown-time>--%>
                                                        <%--                                            </div>--%>
                                                        <%--                                        </div>--%>
                                                    <span><i class="fa fa-clock-o"></i>${sessionScope.exam.allowedTime} phút</span>
                                                </div>
                                                <div class="num-attempt col"><span><i class="fa fa-user"
                                                                                      aria-hidden="true"></i>${sessionScope.examQuestion.timesExam} lượt thi</span>
                                                </div>
                                            </div>
                                            <div class="exam-content">
                                                <ul>
                                                    <c:forEach items="${sessionScope.listQuestion}" var="question"
                                                               varStatus="loop">
                                                        <input type="hidden" name="description${loop.index + 1}"
                                                               value="${question.description}">
                                                        <input type="hidden" name="answer1${loop.index + 1}"
                                                               value="${question.answer1}">
                                                        <input type="hidden" name="answer2${loop.index + 1}"
                                                               value="${question.answer2}">
                                                        <input type="hidden" name="answer3${loop.index + 1}"
                                                               value="${question.answer3}">
                                                        <input type="hidden" name="answer4${loop.index + 1}"
                                                               value="${question.answer4}">
                                                        <input type="hidden" name="answerQuestion${loop.index + 1}"
                                                               value="${question.correct_answer}">

                                                        <li>
                                                            <h4>Câu ${loop.index + 1}:</h4>
                                                            <h4><p>${question.description}</p></h4>
                                                            <div class="form-check mx-4">
                                                                <input class="form-check-input" type="radio"
                                                                       name="question${loop.index + 1}"
                                                                       id="question${loop.index + 1}A"
                                                                       value="${question.answer1}">
                                                                <label class="form-check-label"
                                                                       for="question${loop.index + 1}A">
                                                                    <p>A. ${question.answer1}</p>
                                                                </label>
                                                            </div>
                                                            <div class="form-check mx-4">
                                                                <input class="form-check-input" type="radio"
                                                                       name="question${loop.index + 1}"
                                                                       id="question${loop.index + 1}B"
                                                                       value="${question.answer2}">
                                                                <label class="form-check-label"
                                                                       for="question${loop.index + 1}B">
                                                                    <p>B. ${question.answer2}</p>
                                                                </label>
                                                            </div>
                                                            <c:if test="${question.answer3 != ''}">
                                                                <div class="form-check mx-4">
                                                                    <input class="form-check-input" type="radio"
                                                                           name="question${loop.index + 1}"
                                                                           id="question${loop.index + 1}C"
                                                                           value="${question.answer3}">
                                                                    <label class="form-check-label"
                                                                           for="question${loop.index + 1}C">
                                                                        <p>C. ${question.answer3}</p>
                                                                    </label>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${question.answer4 != ''}">
                                                                <div class="form-check mx-4">
                                                                    <input class="form-check-input" type="radio"
                                                                           name="question${loop.index + 1}"
                                                                           id="question${loop.index + 1}D"
                                                                           value="${question.answer4}">
                                                                    <label class="form-check-label"
                                                                           for="question${loop.index + 1}D">
                                                                        <p>D. ${question.answer4}</p>
                                                                    </label>
                                                                </div>
                                                            </c:if>

                                                        </li>
                                                        <hr width="90%" align="left"/>
                                                    </c:forEach>
                                                </ul>
                                                <div class="ml-3 mt-4 btn-group-do-exam-share">
                                                    <div>
                                                        <button id="btn_submit" type="button" style="margin-top: 10px;"
                                                                href="exam_result.jsp"
                                                                class="btn orange f16b h51">
                                                            Nộp Bài
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-2">
                        <div id="countdown" class="countdown">
                            <div class="countdown__item">
                                <h5 class="countdown__label">
                                    Thời gian còn lại <br/>
                                </h5>
                            </div>
                            <div class="countdown__item">
                                <span id="m" class="countdown__time"></span>
                                <span class="countdown__time">:</span>
                                <span id="s" class="countdown__time"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </section>
        </div>
    </div>
    <jsp:include page="/view/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>

    <script language="javascript">
        function start() {
            let time = new Date("${sessionScope.timeStartS}");
            let m = ${exam.allowedTime};
            let timeEnd = time.setMinutes(time.getMinutes() + m);
            // timeEnd = time.setSeconds(time.getSeconds() + 3 );
            const demgio = setInterval(function () {
                const today = new Date();
                const timeBack = timeEnd - today;
                console.log(timeBack);
                var hours = Math.floor(timeBack / (1000 * 60 * 60))
                var minutes = Math.floor(timeBack / (1000 * 60))
                var seconds = Math.floor(timeBack / (1000))
                hours %= 24
                minutes %= 60
                seconds %= 60
                if (seconds < 0) {
                    clearInterval(demgio);
                    localStorage.setItem('isTimeUp', true);
                    // if (document.getElementById("exam-form"))
                    //     setTimeout(function () {
                    //         document.forms["exam-form"].submit();
                    //     }, 3000);
                    document.forms["exam-form"].submit();
                    return false;
                }

                if (minutes === 0 && seconds <= 59) {
                    document.getElementById("countdown").style.color = "white";
                    document.getElementById("countdown").style.backgroundColor = "yellow";
                }
                if (minutes === 0 && seconds <= 10) {
                    document.getElementById("countdown").style.color = "white";
                    document.getElementById("countdown").style.backgroundColor = "red";
                    document.getElementById("countdown").style.animation = "blinker 1s linear infinite";
                }
                console.log(seconds);
                document.getElementById('m').innerText = minutes.toString();
                document.getElementById('s').innerText = seconds.toString();
            }, 1000);
        }

        $(document).ready(function () {
            start();
        })

        function stop() {
            clearInterval(demgio);
        }

    </script>

    <script language="javascript">

        $(document).ready(function () {
            var checked = 0;
            let ques = ${sessionScope.examQuestion.total}
                function count() {
                    checked = $("input:checked").length;
                    console.log(checked)
                }
            count();
            $(":radio").click(count);

            $("#btn_submit").click(function () {
                if (checked == ques) {
                    document.forms["exam-form"].submit();
                } else {
                    // alert("còn câu chưa trả lời!")
                    Swal.fire(
                        'Bạn vẫn còn câu hỏi chưa trả lời!',
                        'Vui lòng kiểm tra lại.',
                        'question'
                    )
                }
            })
        });
    </script>

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
    </script>

    </body>
    </html>

</c:if>