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
    <title>Câu đố thông minh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/exam-view.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<header id="header">
    <div class="header__logo">
        <img src="/static/img/codegym-logo.png" class="header__imglogo" alt="logo">
        <p class="header__logoname">BẢNG ĐIỀU KHIỂN CÂU ĐỐ THÔNG MINH</p>
    </div>
    <div class="header__admin">
        <a href="#" class="header__adminlink dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
            <p class="header__nameadmin">QUẢN TRỊ VIÊN</p>
            <img src="/static/img/admin_profile.svg" alt="admin-profile" class="header__imgadmin" data-bs-toggle="dropdown" aria-expanded="false">
        </a>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <li><a class="dropdown-item" href="#">Hồ sơ</a></li>
            <li><a class="dropdown-item" href="#">Cài đặt</a></li>
            <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
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
                        Quản lý người dùng</a>
                    <a href="/admin/exam-view.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-file-lines"></i>
                        Quản lý đề thi</a>
                    <a href="/questions" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-file-circle-question"></i>
                        Ngân hàng câu hỏi</a>
                    <a href="exam-list.jsp" class="list-group-item list-group-item-action">
                        <i class="fa-solid fa-house"></i>
                        Danh sách đề thi</a>
                </div>
            </div>
            <div class="col-10 content">
                <div class="content__title">
                    <div class="content_titlepath">
                        <a href="/admin/exam-list.jsp" class="content__pathback">Danh sách đề thi</a>
                        <p class="content__examname">
                            <i class="fa-solid fa-angle-right"></i>
                            Đề thi số 1 - Toán
                        </p>
                    </div>
                    <div class="title-actions">
                        <button id="add-question-btn" type="button" class="btn btn-outline-primary btn-sm" >Thêm câu hỏi</button>
                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">
                            Xoá câu hỏi
                        </button>
                    </div>
                </div>
<<<<<<< HEAD
                <div id="exam-question-list" class="user-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Mã câu hỏi</th>
                            <th scope="col">Câu hỏi</th>
                            <th scope="col">Câu trả lời</th>
                            <th scope="col">Chọn</th>
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
=======
                <div class="user-list">
<%--                    <table class="table table-hover">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th scope="col">STT</th>--%>
<%--                            <th scope="col">Mã câu hỏi</th>--%>
<%--                            <th scope="col">Câu hỏi</th>--%>
<%--                            <th scope="col">Câu trả lời</th>--%>
<%--                            <th scope="col">Chọn</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <tr>--%>
<%--                            <th scope="row">1</th>--%>
<%--                            <td>001</td>--%>
<%--                            <td>Chuyển động tăng dần đều là gì?</td>--%>
<%--                            <td>Vận tốc tăng dần với gia tốc không đổi.</td>--%>
<%--                            <td>--%>
<%--                                <div class="form-check">--%>
<%--                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">--%>
<%--                                    <label class="form-check-label" for="flexCheckDefault">--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th scope="row">2</th>--%>
<%--                            <td>002</td>--%>
<%--                            <td>Tính chất chung của kim loại?</td>--%>
<%--                            <td>Dẻo, dẫn nhiệt, dẫn điện, ánh kim.</td>--%>
<%--                            <td>--%>
<%--                                <div class="form-check">--%>
<%--                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">--%>
<%--                                    <label class="form-check-label" for="flexCheckDefault2">--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th scope="row">3</th>--%>
<%--                            <td>003</td>--%>
<%--                            <td>I am interested in (listen)_____ to music.</td>--%>
<%--                            <td>listening</td>--%>
<%--                            <td>--%>
<%--                                <div class="form-check">--%>
<%--                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1">--%>
<%--                                    <label class="form-check-label" for="flexCheckDefault1">--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
>>>>>>> main
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
                            <th scope="col">Chọn</th>
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
                                <input class="form-check-input" type="checkbox" value="" id="">
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
                                <input class="form-check-input" type="checkbox" value="" id="">
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
                                <input class="form-check-input" type="checkbox" value="" id="">
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

</body>
</html>