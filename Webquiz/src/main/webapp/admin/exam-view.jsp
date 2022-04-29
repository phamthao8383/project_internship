<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${sessionScope.account.idRole != 1}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error403.jsp"/>
</c:if>
<c:if test="${sessionScope.account.idRole == 1}">

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/admin/view/head.jsp"/>
    <title>Câu đố thông minh</title>
    <link rel="stylesheet" href="/static/css/exam-view.css">
</head>
<body>
<jsp:include page="/admin/view/header.jsp"/>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/view/left_navbar.jsp"/>
            <div class="col-10 content">
                <div class="content__title">
                    <div class="content_titlepath">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item fs-4"><a href="/admin/exams">Danh sách đề thi</a></li>
                                <li class="breadcrumb-item active fs-4" aria-current="page">${examName} (${subjectName})</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="title-actions">
                        <button id="add-question-btn" type="button" class="btn btn-outline-primary btn-sm" >Thêm câu hỏi</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                            Xoá câu hỏi
                        </button>
                    </div>
                </div>
                <div id="exam-question-list" class="user-list">
                    <form action="/admin/examQuestion" method="post">
                        <input type="hidden" name="action" value="deleteQuestion">
                        <input type="hidden" name="examId" value="${examId}">
                        <input type="hidden" name="examName" value="${examName}">
                        <input type="hidden" name="subjectName" value="${subjectName}">
                        <input type="hidden" name="subjectId" value="${subjectId}">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã câu hỏi</th>
                                <th scope="col" style="width: 35%">Câu hỏi</th>
                                <th scope="col" style="width: 30%">Đáp án đúng</th>
                                <th scope="col">
                                    Chọn
                                </th>
                            </tr>
                                <%--Delete modal--%>
                            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Xoá câu hỏi khỏi đề</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Xác nhận xoá những câu hỏi đã chọn ra khỏi đề?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </thead>
                            <tbody>
                            <c:forEach items="${listExamQuestion}" var="question" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td >${question.question_id}</td>
                                    <td><span class="limit-text">${question.description}</span></td>
                                    <td><span class="limit-text">${question.correct_answer}</span></td>
                                    <td>
                                        <input class="form-check-input" name="questionDel" type="checkbox" value="${question.question_id}" >
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
<%--                    Phân trang (CHƯA HOẠT ĐỘNG!) --%>
                    <div class="row">
                        <div class="col-4">
                            <c:set var="indexExamQuestionEnd" scope="session" value="${indexExamQuestionStart + entryDisplay - 1}"/>
                            <c:if test="${indexExamQuestionEnd > totalExamQuestion}">
                                <c:set var="indexExamQuestionEnd" scope="session" value="${totalExamQuestion}"/>
                            </c:if>
                            <span>Hiển thị ${indexExamQuestionStart} - <c:out value="${indexExamQuestionEnd}"/> trong tổng số ${totalExamQuestion} mục.</span>
                        </div>
                        <div class="col-8">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-sm justify-content-center">
                                        <li class="page-item ${currentPage <= 1?"disabled":""}">
                                            <c:url var="prevUrl" value="/admin/examQuestion">
                                                <c:param name="index" value="${currentPage - 1}"/>
                                            </c:url>
                                            <a href="<c:out value="${prevUrl}"/>" class="page-link" aria-label="Previous" id="prevSubmit">
                                                Trang trước
                                            </a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${maxPages}">
                                            <li class="page-item ${currentPage == i?"active":""}">
                                                <form method="post" action="/admin/examQuestion" id="pagingForm">
                                                    <input type="hidden" name="examId" value="${examId}">
                                                    <input type="hidden" name="examName" value="${examName}">
                                                    <input type="hidden" name="subjectName" value="${subjectName}">
                                                    <input type="hidden" name="subjectId" value="${subjectId}">
                                                    <input type="hidden" name="index" value="${i}">
                                                <button class="page-link" type="submit">${i}</button>
                                                </form>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${currentPage >= maxPages?"disabled":""}">
                                            <c:url value="/admin/examQuestion" var="nextUrl">
                                                <c:param name="index" value="${currentPage + 1}"/>
                                            </c:url>
                                            <a href="<c:out value="${nextUrl}"/>" class="page-link" aria-label="Next" id="nextSubmit">
                                                Trang sau
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </form>
                        </div>
                    </div>
                </div>

                <div id="add-question" class="d-none">
                    <form action="/admin/examQuestion" method="post">
                        <input type="hidden" name="action" value="addQuestion">
                        <input type="hidden" name="examId" value="${examId}">
                        <input type="hidden" name="examName" value="${examName}">
                        <input type="hidden" name="subjectName" value="${subjectName}">
                        <input type="hidden" name="subjectId" value="${subjectId}">
                        <table class="table table-hover">
                            <colgroup>
                                <col width=auto span="1">
                                <col width="100px" span="1">
                                <col width=auto span="4">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã câu hỏi</th>
                                <th scope="col" style="width: 30%">Câu hỏi</th>
                                <th scope="col" style="width: 30%">Phương án</th>
                                <th scope="col" style="width: 20%">Đáp án</th>
                                <th scope="col">
                                    <button type="submit" class="btn btn-primary btn-sm" >
                                        Thêm
                                    </button>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listQuestion}" var="qs" varStatus="loop">

                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${qs.question_id}</td>
                                    <td> <span class="limit-text">${qs.description}</span></td>
                                    <td>
                                        <ul class="list-group">
                                            <li class="list-group-item list-group-item-primary">${qs.answer1}</li>
                                            <li class="list-group-item list-group-item-success">${qs.answer2}</li>
                                            <li class="list-group-item list-group-item-danger">${qs.answer3}</li>
                                            <li class="list-group-item list-group-item-warning">${qs.answer4}</li>
                                        </ul>
                                    </td>
                                    <td>${qs.correct_answer}</td>
                                    <td>
                                        <input class="form-check-input" name="question" type="checkbox" value="${qs.question_id}" >
                                    </td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </form>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-sm justify-content-center">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</body>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#add-question-btn').click(function () {
            $('#exam-question-list').toggleClass('d-none');
            $('#add-question').toggleClass('d-none');
            let str = document.getElementById("add-question-btn").innerText;
            if(str === "Câu hỏi đã thêm") {
                document.getElementById("add-question-btn").innerText = "Thêm câu hỏi";
            } else {
                document.getElementById("add-question-btn").innerText = "Câu hỏi đã thêm";
            }
        })

        $('#prevSubmit, #pageSubmit, #nextSubmit').each(function () {
            $(this).click(function () {
                $('#pagingForm').submit();
            })
        })
    })
</script>
</html>
</c:if>