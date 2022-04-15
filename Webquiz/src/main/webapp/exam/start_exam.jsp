<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán - Bộ Giáo Dục và Đào Tạo</title>
    <link rel="stylesheet" href="exam.css">
   </head>

<body  oncopy="return false" oncut="return false" onpaste="return false">
<div class="wrapper">
    <jsp:include page="/view/header.jsp"/>
    <div class="main-content">
    <div class="breadcrumb">
        <div class="container">
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
            <div class="cot-trai">
                <div class="skill-test-lists common-test-detail">
                    <div class="col-12 col-lg-12 col-sm-12">
                        <div class="row">
                            <div class="d9Box part-item detail">
                                <h1 class="title22Bold ">Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán</h1>
                                <p>Bộ Giáo Dục và Đào Tạo</p>
                                <div class="detail-question">
                                    <div class="num-question col"><span><i class="fa fa-check-square"></i> 50 câu</span>
                                    </div>
                                    <div class="number-of-questions">
                                        <div class="time-remain">
                                            <div class="time" style="display: flex; align-items: center"><i class="fa fa-clock-o" style="padding-right: 5px" aria-hidden="true"></i><countdown-time autostart add="90m"></countdown-time>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="num-attempt col"><span><i class="fa fa-user" aria-hidden="true"></i>80 lượt thi</span>
                                    </div>
                                </div>
                                <div class="exam-content">
                                    <ul>
                                        <c:forEach items="${listQuestion}" var="question" varStatus="loop">
                                            <input type="hidden" name="question${question.question_id}" value="${question.correct_answer}">

                                            <li>
                                                <h4>Câu ${loop.index + 1}:</h4>
                                                <h4><p>${question.description}</p></h4>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}"
                                                           id="question${loop.index + 1}A" value="Option1">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>A. ${question.answer1}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}B" value="Option1">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>B. ${question.answer2}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}C" value="Option1">
                                                    <label class="form-check-label" for="question${loop.index + 1}">
                                                        <p>C. ${question.answer3}</p>
                                                    </label>
                                                </div>
                                                <div class="form-check mx-4">
                                                    <input class="form-check-input" type="radio" name="question${loop.index + 1}" id="question${loop.index + 1}D" value="Option1">
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
                                            <a type="button" style="margin-top: 10px;" href="exam_result.jsp"
                                                   class="btn orange f16b h51">Nộp Bài</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>
</div>
<jsp:include page="/view/footer.jsp"/>
</div>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
</script>


</div>
</body>
</html>