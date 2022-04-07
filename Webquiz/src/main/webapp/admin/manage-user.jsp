<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:42 AM
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
                    <p>Manage Users</p>
                </div>
                <div class="user-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">User Name</th>
                            <th scope="col">Full Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Point/Times</th>
                            <th scope="col">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>longvan19</td>
                            <td>Van Thanh Long</td>
                            <td>Da Nang</td>
                            <td>0243523482</td>
                            <td>89/2</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>mark99</td>
                            <td>Thornton Mark</td>
                            <td>Ha Noi</td>
                            <td>0923809122</td>
                            <td>78/5</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>jacobj123</td>
                            <td>Jacob Jones</td>
                            <td>Hai Duong</td>
                            <td>0924231344</td>
                            <td>64/2</td>
                            <td>
                                <button type="button" class="btn btn-outline-warning btn-sm">Edit</button>
                                <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
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
<!-- Delete Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete User Confirmation</h5>
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