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
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-8">
                    <h4>Đề thi trắc nghiệm môn ${listExam[0].exam.getSubject().getSubject_name()}</h4>
                </div>
                <div class="col-4">
                    <form id="formSJ" method="get" action="/exam_list?action=list_exam">
                        <select onchange="submitForm()" name="sj_id" class="custom-select">
                            <c:forEach var="subject" items="${listSubject}">
                                <c:choose>
                                    <c:when test="${subject.subject_name eq listExam[0].exam.getSubject().getSubject_name()}">
                                        <option value="${subject.subject_id}" selected>
                                            <a href="/exam_list?action=list_exam&sj_id=${subject.subject_id}"> ${subject.subject_name}</a>
                                        </option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${subject.subject_id}" >
                                            <a href="/exam_list?action=list_exam&sj_id=${subject.subject_id}">${subject.subject_name}</a>

                                        </option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-8">
                    <c:forEach items="${listExam}" var="examQuestion">
                        <div class="exam-cart row">
                            <div class="col-2" style="margin: auto">
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Hóa'}">
                                    <img src="https://s.tracnghiem.net/assets/images/thpt/hoa-hoc.png" alt="">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Toán'}">
                                    <img src="/icon/toan.png" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Lý'}">
                                    <img src="/icon/ly.jpg" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'IT'}">
                                    <img src="/icon/it.png" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'English'}">
                                    <img src="/icon/logoEnglish.jpg" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Bằng Lái Xe'}">
                                    <img src="/icon/blx.jpg" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Sinh Học'}">
                                    <img src="/icon/sinhhoc.png" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Ngữ Văn'}">
                                    <img src="/icon/nguvan.png" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Lịch Sử'}">
                                    <img src="/icon/lichsu.jpg" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Địa Lý'}">
                                    <img src="/icon/dialy.jpg" alt="" width="84px">
                                </c:if>
                                <c:if test="${examQuestion.exam.getSubject().getSubject_name() eq 'Tin Học'}">
                                    <img src="/icon/IT.jpg" alt="" width="84px">
                                </c:if>
                            </div>
                            <div class="exam-cart__infor col-10">
                                <h4 class="exam__label">${examQuestion.exam.getExamName()}</h4>
                                <div class="exam__description row">
                                    <p class="exam__time">Thời gian: ${examQuestion.exam.getAllowedTime()} Phút</p>
                                    <p class="exam__question-number">Số câu: ${examQuestion.total}</p>
                                    <div class="exam__start-btn">
                                        <form method="post" action="/exam_list">
                                            <input type="hidden" name="action" value="goExam">
                                            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                            <input type="hidden" name="examId" value="${examQuestion.exam.getExamId()}">
                                            <c:if test="${sessionScope.examId != null}">
                                                <c:if test="${examQuestion.exam.getExamId() == sessionScope.examId}">
                                                    <button type="submit" class="btn btn-outline-primary">Bắt đầu thi</button>
                                                </c:if>
                                                <c:if test="${examQuestion.exam.getExamId() != sessionScope.examId}">
                                                    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#modalExams${examQuestion.exam.getExamId()}">Bắt đầu thi</button>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${sessionScope.examId == null}">
                                                <button type="submit" class="btn btn-outline-primary">Bắt đầu thi</button>
                                            </c:if>

                                        </form>
                                        <!-- Modal -->
                                        <div class="modal fade" id="modalExams${examQuestion.exam.getExamId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Vui lòng đưa ra lựa chọn</h5>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Bạn đang trong 1 bài thi khác. Vui lòng bấm</p>
                                                        <p>"Tiếp tục thi" nếu muốn tiếp tục bài thi trước!</p>
                                                        <p>"Thi bài này" để hủy bài thi trước đó bắt đầu bài thi mới.</p>

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>

                                                        <form method="post" action="/exam_list">
                                                            <input type="hidden" name="action" value="goExamNew">
                                                            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                                            <input type="hidden" name="examId" value="${examQuestion.exam.getExamId()}">
                                                            <button type="submit" class="btn btn-warning" >Thi bài này</button>
                                                        </form>

                                                        <form method="post" action="/exam_list">
                                                            <input type="hidden" name="action" value="goExam">
                                                            <input type="hidden" name="userId" value="${sessionScope.user.userId}">
                                                            <input type="hidden" name="examId" value="${examQuestion.exam.getExamId()}">
                                                            <button type="submit" class="btn btn-primary">Tiếp tục thi</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
                                <c:forEach items="${list5Exam}" var="exam">
                                    <li class="common-exam__item">
                                        <div class="common-exam__cart">
                                            <form action="/exam_list" method="get">
                                                <input type="hidden" name="action" value="sa">
                                                <input type="hidden" name="search" value="${exam.exam.examName}">
                                                <button type="submit" class="ce__link" style="border: none ;background-color: white">
                                                    <h6 class="ce_label">${exam.exam.examName}</h6>
                                                </button>
                                            </form>

                                            <div class="ce__description row">
                                                <p class="ce__time">Thời gian: ${exam.exam.allowedTime}</p>
                                                <p class="ce__question-number">Số câu: ${exam.total} - Lượt thi: ${exam.timesExam}</p>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/view/footer.jsp"/>
<script>
    function submitForm() {
       document.getElementById("formSJ").submit()
    }


</script>
</body>
</html>