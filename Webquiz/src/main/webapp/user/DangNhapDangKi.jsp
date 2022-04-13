
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="../static/css/DangNhapDangKi.css">
</head>
<body>
<div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
        <div class="front">
            <img src="../static/img/post-thumb-ngon-ngu-lap-trinh.png" alt="">
            <div class="text">
                <span class="text-1">Online Quiz <br> </span>
                <span class="text-2">Diversity-Clever-Exactly</span>
            </div>
        </div>
        <div class="back">
            <!--<img class="backImg" src="images/backImg.jpg" alt="">-->
            <div class="text">
                <span class="text-1">Complete miles of journey <br> with one step</span>
                <span class="text-2">Let's get started</span>
            </div>
        </div>
    </div>
    <div class="forms">
        <div class="form-content">
            <div class="login-form">
                <div class="title">Đăng nhập</div>
                <form action="/userServlet" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="account" placeholder="Nhập tên đăng nhập..." required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="password" placeholder="Nhập mật khẩu..." required>
                        </div>
                        <div class="text"><a href="#" data-toggle="modal" data-target="#editPassword">Quên mật khẩu ?</a></div>
                        <div class="button input-box">
                            <input type="submit" value="Đăng nhập">
                        </div>
                        <div class="text sign-up-text">Bạn chưa có tài khoản? <label for="flip">Đăng kí nhanh</label></div>
                    </div>
                </form>
            </div>
<%--            Đăng ký   --%>
            <div class="signup-form">
                <div class="title">Đăng ký</div>
<%--                <form action="/userServlet" method="post">--%>
<%--                    <input type="hidden" name="action" value="createAccount">--%>
<%--                    <div class="input-boxes">--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fas fa-user"></i>--%>
<%--                            <input type="text" name="name" placeholder="Họ tên" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fas fa-user"></i>--%>
<%--                            <input type="text" name="nameAccount" placeholder="Tên đăng nhập" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fas fa-lock"></i>--%>
<%--                            <input type="password" name="password1" placeholder="Nhập mật khẩu" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fas fa-lock"></i>--%>
<%--                            <input type="password" name="password2" placeholder="Nhập lại mật khẩu" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fas fa-envelope"></i>--%>
<%--                            <input type="text" name="email" placeholder="Nhập địa chỉ email" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fa-solid fa-location-dot"></i>--%>
<%--                            <input type="text" name="address" placeholder="Nhập địa chỉ" required>--%>
<%--                        </div>--%>
<%--                        <div class="input-box">--%>
<%--                            <i class="fa-solid fa-phone"></i>--%>
<%--                            <input type="text" name="phone" placeholder="Nhập số điện thoại" required>--%>
<%--                        </div>--%>
<%--                        <div class="button input-box">--%>
<%--                            <input type="submit" value="Đăng ký">--%>
<%--                        </div>--%>
<%--                        <div class="text sign-up-text">Bạn đã có tài khoản? <label for="flip">Đăng nhập</label></div>--%>
<%--                    </div>--%>
<%--                </form>--%>
                <form action="/userServlet" method="post" name="register" onsubmit="return Validate()">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="name" id="name" placeholder="Nhập vào tên của bạn" required=""
                                   oninvalid="this.setCustomValidity('Họ tên không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="username" id="username" placeholder="Nhập tài khoản của bạn" required
                                   oninvalid="this.setCustomValidity('Tài khoản không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passw" id="pass" placeholder="Nhập mật khẩu" required
                                   oninvalid="this.setCustomValidity('Mật khẩu không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="con_passw" id="passw" placeholder="Nhập lại mật khẩu" required
                                   oninvalid="this.setCustomValidity('Xác nhận mật khẩu không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="email"id="email" placeholder="Nhập email của bạn" required
                                   oninvalid="this.setCustomValidity('Email không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div class="input-box">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" placeholder="Nhập địa chỉ" required>
                        </div>
                        <div class="input-box">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="phone"id="phone" placeholder="Nhập vào số điện thoại" required
                                   oninvalid="this.setCustomValidity('Số điện thoại không được để trống!')"
                                   oninput="setCustomValidity('')">
                        </div>
                        <div>
                            <span style="color: red" id="errorName"></span>
                            <span style="color: red" id="errorUsername"></span>
                            <span style="color: red"   id="errorPass"></span>
                            <span  style="color: red"  id="errorConPass"></span>
                            <span style="color: red"  id="errorPhone"></span>
                            <span  style="color: red"  id="errorEmail"></span>
                        </div>
                        <div class="button input-box">
                            <input type="submit" value="Đăng ký">
                        </div>
                        <div class="text sign-up-text">Bạn đã có tài khoản? <label for="flip">Đăng nhập nhanh</label></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal quên mật khẩu -->
<div class="modal fade" id="editPassword" tabindex="-1" role="dialog" aria-labelledby="modalEditPassword" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditPassword">Quên mật khẩu</h5>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputNameAccount" class="col-sm-3 control-labelform-label">Tên đăng nhập: </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputNameAccount" placeholder="Nhập tên đăng nhập">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-3 control-labelform-label">Mật email: </label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control" id="inputEmail" placeholder="Nhập email...">
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script>
    function Validate() {
        var name = document.getElementById('name').value;
        var errorName = document.getElementById('errorName');
        function removeAscent (str) {
            if (str === null || str === undefined) return str;
            str = str.toLowerCase();
            str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
            str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
            str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
            str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
            str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
            str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
            str = str.replace(/đ/g, "d");
            return str;
        }
        var regexName = /^[a-zA-Z!@#\$%\^\&*\)\(+=._-]{2,}$/g;
        // var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;

        var username = document.getElementById('username').value;
        var errorUsername = document.getElementById('errorUsername');
        //username 6-20 kí tự, không có dấu _ hoặc dấu . ở đầu
        //không có __ hoặc _. hoặc ._ hoặc ..
        //cho phép kí tự a-z, A-Z, 0-9
        //không có dấu _ hoặc dấu . ở cuối
        var regexUsername = /^(?=.{6,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;

        var phone = document.getElementById('phone').value;
        var errorPhone = document.getElementById('errorPhone');
        var regexPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;

        var email = document.getElementById('email').value;
        var errorEmail = document.getElementById('errorEmail');
        var reGexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

        if (name == '' || name == null) {
            errorName.innerHTML = "Họ tên không được để trống!";
        } else if (!regexName.test(removeAscent(name))) {
            errorName.innerHTML = "Họ tên không hợp lệ!";
            return false;
        } else {
            errorName.innerHTML = '';
        }

        if (username == '' || username == null) {
            errorUsername.innerHTML = "Tài khoản không được để trống!";
        } else if (!regexUsername.test(username)) {
            errorUsername.innerHTML = "Tài khoản không hợp lệ! (Tài khoản có độ dài 8-20 kí tự, sử dụng kí tự chữ cái hoặc số.)";
            return false;
        } else {
            errorUsername.innerHTML = '';
        }

        var passW = document.getElementById('pass').value;
        var errorPass = document.getElementById('errorPass');

        if (passW == '' || passW == null) {
            errorPass.innerHTML = "Mật khẩu không được để trống!";
        } else {
            errorPass.innerHTML = "";
        }

        var ConPass = document.getElementById('passw').value;
        var errorConPass = document.getElementById('errorConPass');

        if (ConPass == '' || ConPass == null) {
            errorConPass.innerHTML = "Xác nhận mật khẩu không được để trống!";
        } else if (ConPass != passW) {
            errorConPass.innerHTML = "Xác nhận mật khẩu không trùng khớp!";
        } else {
            errorConPass.innerHTML = "";
        }

        if (email == '' || email == null) {
            errorEmail.innerHTML = "Email không được để trống!";
        } else if (!reGexEmail.test(email)) {
            errorEmail.innerHTML = "Email không hợp lệ!";
            email = '';
        } else {
            errorEmail.innerHTML = '';
        }

        if (phone == '' || phone == null) {
            errorPhone.innerHTML = "Số điện thoại không được để trống!";
        } else if (!regexPhone.test(phone)) {
            errorPhone.innerHTML = "SĐT không hợp lệ!";
            return false;
        } else {
            errorPhone.innerHTML = '';
        }

        if (name && phone && email && ConPass && passW && passW == ConPass) {
            alert("Đăng ký thành công!");
        }
        return false;
    }
</script>
</body>
</html>

