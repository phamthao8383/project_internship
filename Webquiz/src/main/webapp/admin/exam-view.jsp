<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:44 AM
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
    <link rel="stylesheet" href="/static/css/exam-view.css">
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
                    <div class="content_titlepath">
                        <a href="/admin/exam-list.jsp" class="content__pathback">Exam List</a>
                        <p class="content__examname">
                            <i class="fa-solid fa-angle-right"></i>
                            Đề thi số 1 - Toán
                        </p>
                    </div>
                    <div class="title-actions">
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
                            <th scope="col">Question ID</th>
                            <th scope="col">Question</th>
                            <th scope="col">Answer</th>
                            <th scope="col">Select</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>001</td>
                            <td>Chuyển động tăng dần đều là gì?</td>
                            <td>Vận tốc tăng dần với gia tốc không đổi.</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>002</td>
                            <td>Tính chất chung của kim loại?</td>
                            <td>Dẻo, dẫn nhiệt, dẫn điện, ánh kim.</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                                    <label class="form-check-label" for="flexCheckDefault2">
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>003</td>
                            <td>I am interested in (listen)_____ to music.</td>
                            <td>listening</td>
                            <td>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">
                                    <label class="form-check-label" for="flexCheckDefault1">
                                    </label>
                                </div>
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