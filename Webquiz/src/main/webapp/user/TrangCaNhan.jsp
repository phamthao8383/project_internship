<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/view/head.jsp"/>
    <title>Thông tin $user</title>
    <link rel="stylesheet" href="/static/css/TrangCaNhan.css">
</head>

<body>
<jsp:include page="/view/header.jsp"/>
<div class="container-fluid">
    <div class="form__info">
        <div class="form__info-head">
            <h3 class="form__info-title">Thông tin của $user</h3>
        </div>
        <div class="form__info-body">
            <div class="form__info-image">
                <img class="form__info-img"
                     src="data:image/jpeg;base64,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">
                <input class="input_file" type="file">
            </div>
            <ul class="form__info-list">
                <li class="form__info-item">
                    <span class="form__info-name">Tên đăng nhập:</span>
                    <p class="form__info-value">nhac1</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Họ tên:</span>
                    <p class="form__info-value">Phạm Tấn Nhạc</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Email: </span>
                    <p class="form__info-value">nhacpham34@gmail.com</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Địa chỉ: </span>
                    <p class="form__info-value">Huế, Việt Nam</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Số điện thoại:</span>
                    <p class="form__info-value">0123123123 </p>
                </li>
            </ul>


        </div>

        <div class="form__info-footer">
            <button data-toggle="modal" data-target="#editModal" class="form__info-btn">Chỉnh sửa</button>
            <button data-toggle="modal" data-target="#editPassword" class="form__info-btn">Đổi mật khẩu</button>
            <button id="btn_show" onclick="showhistory()" type="button" class="form__info-btn">Xem lịch sử thi</button>
        </div>
    </div>


    <!-- Lịch xử thi -->
    <div class="history" id="history">
        <h2 class="history__title">Lịch sử thi</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Môn thi</th>
                <th scope="col">Đề thi</th>
                <th scope="col">Điểm</th>
                <th scope="col">Thời gian</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Toán</td>
                <td>Toán nâng cao</td>
                <td>100</td>
                <td>45 phút</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Hóa</td>
                <td>Hóa Đại Cương</td>
                <td>90</td>
                <td>45 phút</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Vật Lý</td>
                <td>Lý 12</td>
                <td>99</td>
                <td>45 phút</td>
            </tr>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination pagination-sm justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true"><i class="fa-solid fa-angles-left"></i></span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true"><i class="fa-solid fa-angles-right"></i> </span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>

<!-- Modal Edit  -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="modalEditInfor"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="form__info-head" id="modalEditInfor">
                <h3 class="form__info-title">Cập nhật thông tin</h3>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Họ tên</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputName"  placeholder="Nhập họ tên">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail" placeholder="Email của bạn">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPhone" class="col-sm-2 col-form-label">SĐT</label>
                    <div class="col-sm-10">
                        <input type="phone" class="form-control" id="inputPhone"
                               placeholder="Số điện thoại của bạn">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAddress" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputAddress" placeholder="Địa chỉ..">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
                <button type="button" class="btn btn-primary">Cập nhật</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal đổi mật khẩu -->
<div class="modal fade" id="editPassword" tabindex="-1" role="dialog" aria-labelledby="modalEditPassword"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="form__info-head" id="modalEditPassword">
                <h3 class="form__info-title">Đổi mật khẩu</h3>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-3 control-labelform-label">Mật khẩu hiện tại: </label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputPassword" placeholder="Nhập mật khẩu hiện tại">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputNewPassword" class="col-sm-3 control-labelform-label">Mật khẩu mới: </label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputNewPassword" placeholder="Nhập mật khẩu mới">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputConfirmPassword" class="col-sm-3 control-labelform-label">Xác nhận mật khẩu: </label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="inputConfirmPassword" placeholder="Nhập lại mật khẩu">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
                <button type="button" class="btn btn-primary">Cập nhật</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/view/footer.jsp"/>
<script>
    function showhistory() {
        document.getElementById("history").classList.toggle("show");

    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>