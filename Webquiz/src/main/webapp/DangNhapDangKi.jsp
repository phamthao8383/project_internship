
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/DangNhapDangKi.css">
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
                <div class="title">Login</div>
                <form action="#">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" placeholder="Enter your email" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Enter your password" required>
                        </div>
                        <div class="text"><a href="#">Forgot password?</a></div>
                        <div class="button input-box">
                            <input type="submit" value="Sumbit">
                        </div>
                        <div class="text sign-up-text">Don't have an account? <label for="flip">Sigup now</label></div>
                    </div>
                </form>
            </div>
            <div class="signup-form">
                <div class="title">Signup</div>

                <form action="#" method="" name="register" onsubmit="return Validate()">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>


                            <input type="text"  name="name" id="name" placeholder="Enter your name" required >
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passw" id="pass" placeholder="Enter your password" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="con_passw" id="passw" placeholder="Enter your Re_password" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="email"id="email" placeholder="Enter your email" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" placeholder="Enter your address" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="phone"id="phone" placeholder="Enter your number phone" required>
                        </div>
                        <div>
                            <span style="color: red" id="errorName"></span>
                            <span style="color: red"  id="erorPhone"></span>
                            <span  style="color: red"  id="erorEmail"></span>
                            <span style="color: red"   id="errorPass"></span>
                            <span  style="color: red"  id="errorConPass"></span>


                        </div>
                        <div class="button input-box">
                            <input type="submit" value="Sumbit">
                        </div>
                        <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function Validate() {


        var name = document.getElementById('name').value;
        var errorName = document.getElementById('errorName');
        var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;

        var phone = document.getElementById('phone').value;
        var erorPhone = document.getElementById('erorPhone');
        var regexPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;

        var email = document.getElementById('email').value;
        var errorEmail = document.getElementById('erorEmail');
        var reGexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

        if (name == '' || name == null) {
            errorName.innerHTML = "Họ tên không được để trống!";
        }else if(!regexName.test(name)){
            errorName.innerHTML = "Họ tên không hợp lệ!";
            return false;
        }else{
            errorName.innerHTML = '';
        }

        if (phone == '' || phone == null) {
            erorPhone.innerHTML = "Số điện thoại không được để trống!";
        }else if(!regexPhone.test(phone)){
            erorPhone.innerHTML = "SĐT không hợp lệ!";
            return false;
        }else{
            erorPhone.innerHTML = '';
        }

        if (email == '' || email == null) {
            errorEmail.innerHTML = "Email không được để trống!";
        }else if(!reGexEmail.test(email)){
            errorEmail.innerHTML = "Email không hợp lệ!";
            email = '';
        }else{
            errorEmail.innerHTML = '';
        }

        var passW = document.getElementById('pass').value;
        var errorPass = document.getElementById('errorPass');

        if (passW == '' || passW == null) {
            errorPass.innerHTML = "Mật khẩu vui lòng không để trống!";
        }else{
            errorPass.innerHTML = "";
        }

        var ConPass = document.getElementById('passw').value;
        var errorConPass = document.getElementById('errorConPass');

        if (ConPass == '' || ConPass == null) {
            errorConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
        }else if(ConPass != passW){
            alert("Xác nhận mật khẩu không trùng khớp!");
        }else{
            errorConPass.innerHTML = "";
        }

        if (name && phone && email && ConPass && passW && passW == ConPass) {

            alert("Đăng ký thành công!");

        }else{

        }

        return false;

    }

</script>
</body>
</html>

