<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/admin/view/head.jsp"/>
    <title>Smart Quiz</title>
    <link rel="stylesheet" href="/static/css/exam-list.css">
</head>
<body>
<jsp:include page="/admin/view/header.jsp"/>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/view/left_navbar.jsp"/>
            <div class="col-10 content">
                <div class="content__title">
                    <p>Danh sách đề thi</p>
                    <div class="title-actions">
                        <button type="button" class="btn btn-outline-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#exampleModal">Tạo mới</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" >Xóa danh mục</button>
                    </div>
                </div>
                <div class="user-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã đề thi</th>
                            <th scope="col">Tên đề thi</th>
                            <th scope="col">Bộ môn</th>
                            <th scope="col">Khối</th>
                            <th scope="col">Chọn</th>
                            <th scope="col">Xem </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>001</td>
                            <td>Đề số 1</td>
                            <td>Vật lý</td>
                            <td>A</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                    </label>
                                </div>
                            </td>
                            <td>
                                <a href="#" class="view-exam">Xem</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>002</td>
                            <td>Đề số 5</td>
                            <td>Hóa học</td>
                            <td>B</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                    <label class="form-check-label" for="flexCheckDefault1">
                                    </label>
                                </div>
                            </td>
                            <td>
                                <a href="#" class="view-exam">Xem</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>003</td>
                            <td>Đề số 2</td>
                            <td>Tiếng Anh</td>
                            <td>D</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="">
                                    <label class="form-check-label" for="flexCheckDefault">
                                    </label>
                                </div>
                            </td>
                            <td>
                                <a href="#" class="view-exam">Xem</a>
                            </td>
                        </tr>
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
            </div>
        </div>
    </div>
</div>
<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa Đề $1</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Xác nhận xóa!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary">Xác nhận</button>
            </div>
        </div>
    </div>
</div>
</body>
<!-- Create New Exam Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo mới đề thi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form >
                    <div class="mb-3 row">
                        <label for="inputExamTitle" class="col-sm-3 col-form-label">Nhập tên đề thi</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputExamTitle">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="form-label col-sm-3">Chọn môn:</label>
                        <div class="d-flex mt-1 col-sm-9">
                            <div class="form-check col-sm">
                                <input class="form-check-input" type="radio" name="gender" id="maleInput" value="false">
                                <label class="form-check-label" for="maleInput">
                                    Toán học
                                </label>
                            </div>
                            <div class="form-check ms-4 col-sm">
                                <input class="form-check-input" type="radio" name="gender" id="femaleInput1" value="true">
                                <label class="form-check-label" for="femaleInput1">
                                    Hóa học
                                </label>
                            </div>
                            <div class="form-check ms-4 col-sm">
                                <input class="form-check-input" type="radio" name="gender" id="femaleInput2" value="true">
                                <label class="form-check-label" for="femaleInput2">
                                    Vật lý
                                </label>
                            </div>
                            <div class="form-check ms-4 col-sm">
                                <input class="form-check-input" type="radio" name="gender" id="femaleInput" value="true">
                                <label class="form-check-label" for="femaleInput">
                                    Tiếng Anh
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-primary">Gửi</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>
