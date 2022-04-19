<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán - Bộ Giáo Dục và Đào Tạo</title>
    <link rel="stylesheet" href="/exam/exam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body  oncopy="return false" oncut="return false" onpaste="return false">
<jsp:include page="/view/header.jsp"/>
<div class="wrapper">
    <div class="main-content">
    <div class="breadcrumb">
        <div class="container" onload="start(${exam.allowedTime}, 0)">
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
                                <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                            <div class="d9Box part-item detail">
                                <h1 class="title22Bold ">Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán</h1>
                                <p>Bộ Giáo Dục và Đào Tạo</p>
                                <div class="detail-question">
                                    <div class="num-question col"><span><i class="fa fa-check-square"></i> 50 câu</span>
                                    </div>
                                    <div class="number-of-questions">
<%--                                        <div class="time-remain">--%>
<%--                                            <div class="time" style="display: flex; align-items: center"><i class="fa fa-clock-o" style="padding-right: 5px" aria-hidden="true"></i><countdown-time autostart add="90m"></countdown-time>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <span><i class="fa fa-clock-o"></i>${exam.allowedTime} phút</span>
                                    </div>
                                    <div class="num-attempt col"><span><i class="fa fa-user" aria-hidden="true"></i>80 lượt thi</span>
                                    </div>
                                </div>
                                <div class="exam-content">
                                    <ul>
                                        <c:forEach items="${listQuestion}" var="question" varStatus="loop">
                                            <input type="hidden" name="answerQuestion${loop.index + 1}" value="${question.correct_answer}">

                                            <li>
                                                <h4>Câu ${loop.index + 1}:</h4>
                                                <h4><p>${question.description}</p></h4>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}"
                                                           id="question${loop.index + 1}A" value="${question.answer1}">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>A. ${question.answer1}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}B" value="${question.answer2}">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>B. ${question.answer2}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}C" value="${question.answer3}">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>C. ${question.answer3}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}D" value="${question.answer4}">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>D. ${question.answer4}</p>
                                                    </label>
                                                </div>
                                            </li>
                                            <hr  width="90%" align="left" />
                                        </c:forEach>
                                    </ul>
                                    <div class="ml-3 mt-4 btn-group-do-exam-share">
                                        <div>
                                            <button type="submit" style="margin-top: 10px;" href="exam_result.jsp"
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
                        <span id="m" class="countdown__time">Phút</span>
                        <span class="countdown__time">:</span>
                        <span id="s" class="countdown__time">Giây</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>
</div>
<jsp:include page="/view/footer.jsp"/>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
<script language="javascript">

    var h = null; // Giờ
    var m = null; // Phút
    var s = null; // Giây

    var timeout = null; // Timeout

    function start(m, s)
    {
        /*BƯỚC 1: LẤY GIÁ TRỊ BAN ĐẦU*/
        if (m === null){
            this.m = m;
            this.s = s;
        }

        /*BƯỚC 1: CHUYỂN ĐỔI DỮ LIỆU*/
        // Nếu số giây = -1 tức là đã chạy ngược hết số giây, lúc này:
        //  - giảm số phút xuống 1 đơn vị
        //  - thiết lập số giây lại 59
        if (s === -1){
            m -= 1;
            s = 59;
        }
        if(m === 0 && s <= 59){
            document.getElementById("countdown").style.color = "white";
            document.getElementById("countdown").style.backgroundColor = "yellow";
        }
        if(m === 0 && s <= 10){
            document.getElementById("countdown").style.color = "white";
            document.getElementById("countdown").style.backgroundColor = "red";
            document.getElementById("countdown").style.animation = "blinker 1s linear infinite";
        }

        // Nếu số phút = -1 tức là đã hết giờ, lúc này:
        //  - Dừng chương trình
        if (m == -1){
            clearTimeout(timeout);
            document.forms["exam-form"].submit();
            alert('Hết giờ');
            return false;
        }

        /*BƯỚC 1: HIỂN THỊ ĐỒNG HỒ*/
        // document.getElementById('h').innerText = h.toString();
        document.getElementById('m').innerText = m.toString();
        document.getElementById('s').innerText = s.toString();

        /*BƯỚC 1: GIẢM PHÚT XUỐNG 1 GIÂY VÀ GỌI LẠI SAU 1 GIÂY */
        timeout = setTimeout(function(){
            s--;
            start(m, s);
        }, 1000);
    }

    window.onload = function () {
        start(${exam.allowedTime}, 0);
    }

    function stop(){
        clearTimeout(timeout);
    }
</script>
</body>
</html>