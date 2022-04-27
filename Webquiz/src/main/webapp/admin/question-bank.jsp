<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
    <link rel="stylesheet" href="/static/css/question-bank.css">
</head>
<body>
<jsp:include page="/admin/view/header.jsp"/>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/view/left_navbar.jsp"/>
            <div class="col-10 content">
                <div class="content__title">
                    <p>Danh sách câu hỏi</p>
                </div>
                <nav class="navbar justify-content-between">
                    <div class="d-flex">
                        <div class="title-actions" >
                            <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#createQuestionModal">Tạo mới
                            </button>
                        </div>
                        <div class="title-actions" style="margin-left: 8px;margin-right: 8px;">
                            <a class="btn btn-outline-warning" role="button" href="/admin/questions?action=export">Xuất file</a>
                        </div>
                        <div class="title-actions" >
                            <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#createFileModal">
                                Thêm bằng file
                            </button>
                        </div>
                    </div>
                    <form method="get" action="/admin/questions" class="form-inline d-flex">
                        <input type="hidden" name="action" value="search">
                        <input class="form-control mr-sm-2" type="search" name="description" placeholder="Nhập từ khóa..." aria-label="Search">
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Tìm</button>
                    </form>
                </nav>
                <div class="user-list">
                    <table border="1" cellpadding="5" class="table table-hover">
                        <thead>
                            <tr>
                            <th>STT</th>
                            <th>Câu hỏi</th>
                            <th>A</th>
                            <th>B</th>
                            <th>C</th>
                            <th>D</th>
                            <th>Đáp án</th>
                            <th style="width: 10%;">Môn Học</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="question" items="${listQuestion}" varStatus="loop">
                            <input type="hidden" name="indexQuestion${loop.index}" value="${loop.index}">
                            <tr>
                                <td>
                                    <span class="limit-text"><c:out value="${loop.index + 1}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text"><c:out value="${question.description}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text"><c:out value="${question.answer1}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text"><c:out value="${question.answer2}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text"><c:out value="${question.answer3}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text"><c:out value="${question.answer4}"/></span>
                                </td>
                                <td>
                                    <span class="limit-text">
                                    <c:out value="${question.correct_answer}"/>
                                    </span>
                                </td>
                                <td><c:out value="${question.getSubject().getSubject_name()}"/></td>
                                <td >
                                    <div class="d-flex">
                                        <a class="btn btn-outline-warning btn-sm" type="button" data-bs-toggle="modal"
                                           data-bs-target="#editQuestionModal${loop.index}" style="margin-right: 8px">Sửa</a>

                                        <button class="btn btn-outline-danger btn-sm" type="button" data-bs-toggle="modal"
                                                data-bs-target="#confirmDeleteModal${loop.index}">
                                            Xóa
                                        </button>
                                    </div>

                                </td>

                            </tr>
                            <!-- Edit New Question Modal -->
                            <div class="modal fade" id="editQuestionModal${loop.index}" tabindex="-1"
                                 aria-labelledby="editQuestionLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editQuestionLabel">Chỉnh Sửa câu hỏi</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="/admin/questions" method="POST">
                                                <input type="hidden" name="action" value="edit">
                                                <div class="mb-3 row">
                                                    <div class="col-sm-9">
                                                        <input type="hidden" class="form-control" name="question_id"
                                                               value="${question.question_id}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Câu hỏi</label>
                                                    <div class="col-sm-9">
                                                        <textarea  type="text" class="form-control" name="description">${question.description}</textarea><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Đáp án 1</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="answer1"
                                                               value="${question.answer1}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Đáp án 2</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="answer2"
                                                               value="${question.answer2}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Đáp án 3</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="answer3"
                                                               value="${question.answer3}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Đáp án 4</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="answer4"
                                                               value="${question.answer4}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Câu trả lời</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control" name="correct_answer"
                                                               value="${question.correct_answer}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Chọn môn</label>
                                                    <div class="col-sm-9">
                                                        <select name="subject_id" class="form-select">
                                                            <c:forEach var="subject" items="${listSubject}">
                                                                <c:choose>
                                                                    <c:when test="${subject.subject_id == question.getSubject().getSubject_id()}">
                                                                        <option value="${subject.subject_id}"
                                                                                selected> ${subject.subject_name}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${subject.subject_id}">${subject.subject_name}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Đóng
                                                    </button>
                                                    <button type="submit" class="btn btn-primary">Sửa</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- Delete modal--%>
                            <div class="modal fade" id="confirmDeleteModal${loop.index}" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <form action="/admin/questions" method="post" class="modal-content">
                                        <input type="hidden" name="idQues" value="${question.question_id}">
                                        <input type="hidden" name="action" value="delete">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Xóa câu hỏi</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Câu hỏi này sẽ bị xóa. Nhấp chuột <b>Xóa</b> nếu bạn muốn xóa. Hoặc <b>Đóng</b> nếu muốn dừng.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button  type="submit" class="btn btn-danger">Xóa</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-4">
                            <c:set var="indexQuestionEnd" scope="session" value="${indexQuestionStart + entryDisplay - 1}"/>
                            <c:if test="${indexQuestionEnd > totalQuestion}">
                                <c:set var="indexMemberEnd" scope="session" value="${totalQuestion}"/>
                            </c:if>
                            <span>Hiển thị ${indexQuestionStart} - <c:out value="${indexQuestionEnd}"/> trong tổng số ${totalQuestion} mục.</span>
                        </div>
                        <div class="col-8">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-sm justify-content-center">
                                    <li class="page-item ${currentPage <= 1?"disabled":""}">
                                        <c:url value="/admin/questions" var="prevUrl">
                                            <c:param name="index" value="${currentPage - 1}"/>
                                        </c:url>
                                        <a href="<c:out value="${prevUrl}"/>" class="page-link" aria-label="Previous">
                                            Trang trước
                                        </a>
                                    </li>
                                    <c:forEach var="i" begin="1" end="${maxPages}">
                                        <li class="page-item ${currentPage == i?"active":""}">
                                            <a class="page-link" href="/admin/questions?index=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${currentPage >= maxPages?"disabled":""}">
                                        <c:url value="/admin/questions" var="nextUrl">
                                            <c:param name="index" value="${currentPage + 1}"/>
                                        </c:url>
                                        <a href="<c:out value="${nextUrl}"/>" class="page-link" aria-label="Next">
                                            Trang sau
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Create New Question Modal -->
<div class="modal fade" id="createQuestionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo mới câu hỏi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/admin/questions" method="POST">
                    <input type="hidden" name="action" value="create">
                    <div class="mb-3 row">
                        <div class="col-sm-9">
                            <input type="hidden" class="form-control" name="question_id"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Câu hỏi</label>
                        <div class="col-sm-9">
                            <textarea  type="text" class="form-control" name="description"></textarea><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Đáp án 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="answer1"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Đáp án 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="answer2"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Đáp án 3</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="answer3"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Đáp án 4</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="answer4"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Câu trả lời</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="correct_answer"/><br>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Chọn môn</label>
                        <div class="col-sm-9">
                            <select name="subject_id" class="form-select">
                                <c:forEach var="subject" items="${listSubject}">
                                    <option value="${subject.getSubject_id()}">${subject.getSubject_name()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

    <%-- Create File--%>
<div class="modal fade" id="createFileModal" tabindex="-1" aria-labelledby="modalCreateFile" aria-hidden="true">
    <div class="modal-dialog">
        <form  action="/admin/questions" method="post" enctype="multipart/form-data" class="modal-content" >
            <input type="hidden" name="action" value="importfile">
            <div class="modal-header">
                <h5 class="modal-title">Chọn file bạn muốn thêm</h5>
            </div>
            <div class="modal-body">
                <input type="file" id="inputFile" name="inputFile">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button  type="submit" id="btnUpload" class="btn btn-primary">Thêm</button>
            </div>
        </form>
    </div>
</div>
</body>

<!-- Delete Modal -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>

</html>
</c:if>