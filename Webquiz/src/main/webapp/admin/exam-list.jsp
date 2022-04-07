<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/exam-list.css">
</head>
<body>
<header id="header">
    <div class="header__logo">
        <img src="/static/img/codegym-logo.png" class="header__imglogo" alt="logo">
        <p class="header__logoname">Smart Quiz Dashboard</p>
    </div>
    <div class="header__admin">
        <a href="#" class="header__adminlink dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            <p class="header__nameadmin">Nguyen Van Admin</p>
            <img src="/static/img/admin_profile.svg" alt="admin-profile" class="header__imgadmin" data-bs-toggle="dropdown" aria-expanded="false">
        </a>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Log out</a></li>
        </ul>
    </div>
</header>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 sidebar">
                <div class="list-group">
                    <a href="/admin/manage-user.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-people-group"></i>
                        Manage Users</a>
                    <a href="/admin/exam-view.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-file-lines"></i>
                        Manage Exams</a>
                    <a href="question-bank.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-file-circle-question"></i>
                        Questions Bank</a>
                    <a href="exam-list.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-house"></i>
                        Exam List</a>
                </div>
            </div>
            <div class="col-10 content">
                <div class="content__title">
                    <p>Exams List</p>
                    <div class="title-actions">
                        <button type="button" class="btn btn-outline-success btn-sm">Import Quiz</button>
                        <button type="button" class="btn btn-outline-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#exampleModal">Add New</button>
                        <button type="button" class="btn btn-outline-danger btn-sm">Delete Item</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">Exit</button>
                    </div>
                </div>
                <div class="user-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Exam ID</th>
                            <th scope="col">Exam Name</th>
                            <th scope="col">Subject</th>
                            <th scope="col">Major</th>
                            <th scope="col">Select</th>
                            <th scope="col">View</th>
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
                                <a href="#" class="view-exam">View</a>
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
                                <a href="#" class="view-exam">View</a>
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
                                <a href="#" class="view-exam">View</a>
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
</body>
<!-- Create New Exam Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create New Exam</h5>
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
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>
