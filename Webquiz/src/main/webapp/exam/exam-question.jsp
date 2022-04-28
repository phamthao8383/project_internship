<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <link rel="stylesheet" href="/exam/exam.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <jsp:include page="/view/head.jsp"/>
    <title>Đề thi minh họa tốt nghiệp THPT năm 2022 môn Toán - Bộ Giáo Dục và Đào Tạo</title>

</head>

<body  oncopy="return false" oncut="return false" onpaste="return false">
<jsp:include page="/view/header.jsp"/>
<div class="container-fluid">
    <div class="wrapper">
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
                                    <h1 class="title22Bold "> ${exam.exam.examName}</h1>
                                    <p>Bộ Giáo Dục và Đào Tạo</p>
                                    <div class="detail-question">
                                        <div class="num-question col"><span><i class="fa fa-check-square"></i> ${exam.total} câu</span>
                                        </div>
                                        <div class="num-minutes col"><span><i class="fa fa-clock-o"
                                                                              aria-hidden="true"></i>${exam.exam.allowedTime} phút</span>
                                        </div>
                                        <div class="num-attempt col"><span><i class="fa fa-user" aria-hidden="true"></i>${exam.timesExam} lượt thi</span>
                                        </div>
                                    </div>
                                    <div class="exam-content">
                                        <ul>
                                            <c:forEach items="${listQuestion}" var="question" varStatus="loop">
                                                <input type="hidden" name="question${question.question_id}" value="${question.correct_answer}">

                                                <li>
                                                    <h4>Câu ${loop.index + 1}:</h4>
                                                    <h4><p>${question.description}</p></h4>
                                                    <p>A. ${question.answer1}</p>
                                                    <p>B. ${question.answer2}</p>
                                                    <p>C. ${question.answer3}</p>
                                                    <p>D. ${question.answer4}</p>
                                                </li>
                                                <hr  width="90%" align="left" />
                                            </c:forEach>
                                        </ul>
                                        <div class="ml-3 mt-4 btn-group-do-exam-share">
                                            <form action="/exam_list" method="post">
                                                <input type="hidden" name="action" value="goExam">
                                                <input type="hidden" name="examId" value="${examId}">
                                                <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                                <input type="submit" value="Bắt đầu thi" style="margin-top: 10px;" class="btn orange f16b h51" >
                                            </form>
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
</div>
<jsp:include page="/view/footer.jsp"/>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.2/MathJax.js?config=TeX-MML-AM_CHTML">
</script>
</body>
</html>