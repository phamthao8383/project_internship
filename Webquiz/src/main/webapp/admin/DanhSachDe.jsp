<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hongson
  Date: 07/04/2022
  Time: 3:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>QuizGym - Đề thi môn ${listExam[0].exam.getSubject().getSubject_name()} </title>
    <link rel="stylesheet" href="/static/css/danhSachDe.css">
</head>
<body>
    <jsp:include page="/view/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-8">
                <h4>Đề thi trắc nghiệm môn ${listExam[0].exam.getSubject().getSubject_name()}</h4>
            </div>
            <div class="col-4">
                <select class="custom-select">
                    <option selected>Chọn môn</option>
                    <option value="1">Toán</option>
                    <option value="2">Lý</option>
                    <option value="3">Hoá</option>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-8">
                <c:forEach items="${listExam}" var="examQuestion">
                    <div class="exam-cart row">
                        <div class="col-2">
                            <img src="https://s.tracnghiem.net/assets/images/thpt/hoa-hoc.png" alt="">
                        </div>
                        <div class="exam-cart__infor col-10">
                            <h4 class="exam__label">${examQuestion.exam.getExamName()}</h4>
                            <div class="exam__description row">
                                <p class="exam__time">Thời gian: ${examQuestion.exam.getAllowedTime()}</p>
                                <p class="exam__question-number">Số câu: ${examQuestion.total}</p>
                                <div class="exam__start-btn">
                                    <form method="post" action="/exam_list">
                                        <input type="hidden" name="action" value="goExam">
                                        <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                        <input type="hidden" name="examId" value="${examQuestion.exam.getExamId()}">
                                        <button type="submit" class="btn btn-outline-primary">Xem đề thi</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="col-4">
                <div class="common-exam">
                    <div class="common-exam__header">
                        <h4 class="common-exam__header-label">Đề thi nổi bật</h4>
                    </div>
                    <div class="common-exam__body">
                        <ul class="common-exam__list">
                            <li class="common-exam__item">
                                <div class="common-exam__cart">
                                    <a href="" class="ce__link">
                                        <h6 class="ce_label">Đề thi giữa HK2 môn Toán 12 năm 2021-2022</h6>
                                    </a>
                                    <div class="ce__description row">
                                        <p class="ce__time">Thời gian: 60 phút</p>
                                        <p class="ce__question-number">Số câu: 40</p>
                                    </div>
                                </div>
                            </li>
                            <li class="common-exam__item">
                                <div class="common-exam__cart">
                                    <a href="" class="ce__link">
                                        <h6 class="ce_label">Đề thi giữa HK2 môn Toán 12 năm 2021-2022</h6>
                                    </a>
                                    <div class="ce__description row">
                                        <p class="ce__time">Thời gian: 60 phút</p>
                                        <p class="ce__question-number">Số câu: 40</p>
                                    </div>
                                </div>
                            </li>
                            <li class="common-exam__item">
                                <div class="common-exam__cart">
                                    <a href="" class="ce__link">
                                        <h6 class="ce_label">Đề thi giữa HK2 môn Toán 12 năm 2021-2022</h6>
                                    </a>
                                    <div class="ce__description row">
                                        <p class="ce__time">Thời gian: 60 phút</p>
                                        <p class="ce__question-number">Số câu: 40</p>
                                    </div>
                                </div>
                            </li>
                            <li class="common-exam__item">
                                <div class="common-exam__cart">
                                    <a href="" class="ce__link">
                                        <h6 class="ce_label">Đề thi giữa HK2 môn Toán 12 năm 2021-2022</h6>
                                    </a>
                                    <div class="ce__description row">
                                        <p class="ce__time">Thời gian: 60 phút</p>
                                        <p class="ce__question-number">Số câu: 40</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/view/footer.jsp"/>

</body>
</html>