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
                    <div class="title-actions">
                        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#createQuestionModal">Tạo mới
                        </button>
                    </div>
                </div>
                <div class="user-list">
                    <table border="1" cellpadding="5" class="table table-hover">
                        <tr>
                            <th>STT</th>
                            <th>Câu hỏi</th>
                            <th>A</th>
                            <th>B</th>
                            <th>C</th>
                            <th>D</th>
                            <th>Đáp án</th>
                            <th>Môn Học</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach var="question" items="${listQuestion}">
                            <tr>
                                <td>
                                    <span class="limit-text"><c:out value="${question.question_id}"/></span>
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
                                <td>
                                    <button class="btn btn-outline-warning btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#editQuestionModal">
                                        Edit
<%--                                        href="/questions?action=edit&id=${question.question_id}"--%>
                                    </button>
                                </td>
                                <td>
                                    <button  class="btn btn-outline-danger btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                                       Delete
<%--                                        href="/questions?action=delete&id=${question.question_id}"--%>
                                    </button>
                                </td>

                            </tr>
                        </c:forEach>
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
            </div>
        </div>
    </div>
</div>
</body>
<!-- Create New Question Modal -->
<div class="modal fade" id="createQuestionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo mới câu hỏi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3 row">
                        <label for="inputQuestion" class="col-sm-3 col-form-label">Câu hỏi</label>
                        <div class="col-sm-9">
                            <textarea type="text" class="form-control" id="inputQuestion" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer1" class="col-sm-3 col-form-label">Đáp án 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer1">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer2" class="col-sm-3 col-form-label">Đáp án 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer2">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer3" class="col-sm-3 col-form-label">Đáp án 3</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer3">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer4" class="col-sm-3 col-form-label">Đáp án 4</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer4">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer" class="col-sm-3 col-form-label">Câu trả lời</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputSubject" class="col-sm-3 col-form-label">Chọn môn</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputSubject">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Thêm</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit New Question Modal -->
<div class="modal fade" id="editQuestionModal" tabindex="-1" aria-labelledby="editQuestionLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editQuestionLabel">Tạo mới câu hỏi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="mb-3 row">
                        <label for="editQuestion" class="col-sm-3 col-form-label">Câu hỏi</label>
                        <div class="col-sm-9">
                            <textarea type="text" class="form-control" id="editQuestion" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAnswer1" class="col-sm-3 col-form-label">Đáp án 1</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editAnswer1">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAnswer2" class="col-sm-3 col-form-label">Đáp án 2</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editAnswer2">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAnswer3" class="col-sm-3 col-form-label">Đáp án 3</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editAnswer3">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAnswer4" class="col-sm-3 col-form-label">Đáp án 4</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editAnswer4">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editAnswer" class="col-sm-3 col-form-label">Câu trả lời</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editAnswer">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="editSubject" class="col-sm-3 col-form-label">Chọn môn</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="editSubject">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Sửa</button>
            </div>
        </div>
    </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Xóa câu hỏi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Câu hỏi này sẽ bị xóa. Nhấp chuột <b>Xóa</b> nếu bạn muốn xóa. Hoặc <b>Đóng</b> nếu muốn dừng.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-danger">Xóa</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</html>