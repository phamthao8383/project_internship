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
    <jsp:include page="/view/error.jsp"/>
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
                        <a href="/admin/exam-list.jsp" class="content__pathback">Danh sách đề thi</a>
                        <p class="content__examname">
                            <i class="fa-solid fa-angle-right"></i>${subjectName} - ${examName}
                        </p>
                    </div>
                    <div class="title-actions">
                        <button id="add-question-btn" type="button" class="btn btn-outline-primary btn-sm" >Thêm câu hỏi</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                            Xoá câu hỏi
                        </button>
                    </div>
                </div>
                <div id="exam-question-list" class="user-list">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã câu hỏi</th>
                                <th scope="col">Câu hỏi</th>
                                <th scope="col">Đáp án đúng</th>
                                <th scope="col">Chọn</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listExamQuestion}" var="question" varStatus="loop">
                            <tr>
                                <th scope="row">${loop.index + 1}</th>
                                <td>${question.question_id}</td>
                                <td>${question.description}</td>
                                <td>${question.correct_answer}</td>
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
                                <th scope="col">Câu hỏi</th>
                                <th scope="col">Phương án</th>
                                <th scope="col">Đáp án</th>
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
                                    <td>${qs.description}</td>
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
                <button type="button" class="btn btn-primary">Xác nhận</button>
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
            $('#exam-question-list').addClass('d-none');
            $('#add-question').removeClass('d-none');
        })
    })
</script>
</html>
</c:if>