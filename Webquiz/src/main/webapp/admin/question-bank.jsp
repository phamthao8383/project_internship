<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:43 AM
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
    <link rel="stylesheet" href="/static/css/question-bank.css">
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
                    <p>Questions List</p>
                    <div class="title-actions">
                        <button type="button" class="btn btn-outline-success btn-sm">Import Question</button>
                        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#createQuestionModal">Add New</button>
                        <!-- <button type="button" class="btn btn-outline-danger btn-sm">Delete Item</button> -->
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
                            <th scope="col">Choices</th>
                            <th scope="col">Answer</th>
                            <th scope="col">Select</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>001</td>
                            <td>Chuyển động tăng dần đều là gì?</td>
                            <td>
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary">Gia tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-success">Vận tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-danger">Quảng đường đi lớn nhất</li>
                                    <li class="list-group-item list-group-item-warning">Vận tốc tăng dần với gia tốc không đổi</li>
                                </ul>
                            </td>
                            <td>Vận tốc tăng dần với gia tốc không đổi</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm mt-3">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm mt-3" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>002</td>
                            <td>Chuyển động tăng dần đều là gì?</td>
                            <td>
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary">Gia tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-success">Vận tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-danger">Quảng đường đi lớn nhất</li>
                                    <li class="list-group-item list-group-item-warning">Vận tốc tăng dần với gia tốc không đổi</li>
                                </ul>
                            </td>
                            <td>Vận tốc tăng dần với gia tốc không đổi</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm mt-3">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm mt-3" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>003</td>
                            <td>Chuyển động tăng dần đều là gì?</td>
                            <td>
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary">Gia tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-success">Vận tốc không thay đổi.</li>
                                    <li class="list-group-item list-group-item-danger">Quảng đường đi lớn nhất</li>
                                    <li class="list-group-item list-group-item-warning">Vận tốc tăng dần với gia tốc không đổi</li>
                                </ul>
                            </td>
                            <td>Vận tốc tăng dần với gia tốc không đổi</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm mt-3">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm mt-3" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
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
<!-- Create New Question Modal -->
<div class="modal fade" id="createQuestionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create New Question</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3 row">
                        <label for="inputQuestionID" class="col-sm-3 col-form-label">Question ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputQuestionID">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputChoices" class="col-sm-3 col-form-label">Choices</label>
                        <div class="col-sm-9">
                            <textarea type="text" class="form-control" id="inputChoices" rows="4"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputAnswer" class="col-sm-3 col-form-label">Answer</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputAnswer">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="inputExamID" class="col-sm-3 col-form-label">Exam ID</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="inputExamID">
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
<!-- Delete Modal -->
<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Delete User Confirmation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                This user will be deleted. Click <b>OK</b> to proceed. Or <b>Close</b> to cancel.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">OK</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</html>