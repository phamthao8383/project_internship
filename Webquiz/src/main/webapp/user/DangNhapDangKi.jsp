<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<c:if test="${sessionScope.account != null}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error.jsp"/>
</c:if>
<c:if test="${sessionScope.account == null}">


<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="/icon/logoWeb.png" type="image/x-icon">
    <title>Đăng nhập - Đăng ký</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

                        <c:if test="${sai == 1}">
                            <p style="color: red">Bạn nhập sai tài khoản mật khẩu!</p>
                        </c:if>



                            <%--                 Quên mật khẩu       --%>
                        <div class="text"><a href="/user/forgotPassword.jsp">Quên mật khẩu ?</a></div>


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
                <form id="form-dangky" action="/userServlet" method="post" name="register" onsubmit="return Validate()">
                    <input type="hidden" name="action" value="createAccount">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="name" id="name" placeholder="Nhập vào tên của bạn" required >
                        </div>
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="nameAccount" id="nameAccount" placeholder="Nhập vào tên đăng nhập.." required >
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passw" id="pass" placeholder="Nhập mật khẩu" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="con_passw" id="passw" placeholder="Nhập lại mật khẩu" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="email"id="email" placeholder="Nhập email của bạn" required>
                        </div>
                        <div class="input-box">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" name="address" placeholder="Nhập địa chỉ" required>
                        </div>
                        <div class="input-box">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="phone" id="phone" placeholder="Nhập vào số điện thoại" required>
                        </div>
                        <div>
                            <span style="color: red" id="errorName"></span>
                            <span style="color: red"  id="erorPhone"></span>
                            <span  style="color: red"  id="erorEmail"></span>
                            <span style="color: red"   id="errorPass"></span>
                            <span  style="color: red"  id="errorConPass"></span>
                        </div>
                        <div class="button input-box">
                            <input type="submit" value="Đăng Ký">
                        </div>
                        <div class="text sign-up-text">Bạn đã có tài khoản? <label for="flip">Đăng nhập nhanh</label></div>
                    </div>
                </form>
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
</body>

<%--validate quên mật khẩu--%>
<script>
    function ValidateForgot() {
        var name = document.getElementById('inputNameAccount').value;
        var errName = document.getElementById('errName');
        var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;



        var email = document.getElementById('inputEmail').value;
        var errEmail = document.getElementById('errEmail');
        var reGexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

        if(name==''||name==null){
            errName.innerHTML="̣Tên đăng nhập không được để trống";
        }
        else if(!regexName.test(name)){
            errName.innerHTML="Tên đăng nhập không hợp lệ";
            return false;
        }else{
            errName.innerHTML="";
        }

        if(email==''||email==null){
            errEmail.innerHTML="Email không được để trống";
        }else if(!reGexEmail.test(email)){
            errEmail.innerHTML="Email không hợp lệ";
            return  false;
        }else {
            errEmail.innerHTML='';
        }

        var inputNewPass=document.getElementById('inputNewPass').value;
        var errPass=document.getElementById('errPass');

        if ( inputNewPass == '' || inputNewPass == null) {
            errPass.innerHTML = "Mật khẩu vui lòng không để trống!";
        } else {
            errPass.innerHTML = "";
        }

        var inputNewPassword=document.getElementById('inputNewPassword').value;
        var errConPass=document.getElementById('errConPass');

        if (inputNewPassword == '' || inputNewPassword == null) {
            errConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
        } else if (inputNewPassword != inputNewPass) {
            alert("Xác nhận mật khẩu không trùng khớp!");
        } else {
            errConPass.innerHTML = "";
        }
        if (name &&  email && inputNewPassword  &&inputNewPass && inputNewPassword==inputNewPass ) {
            alert("gửi mã thành công!");
        } else {
        }
        return false;
    }
</script>


<%--Validate đăng kí--%>
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
        } else if (!regexName.test(name)) {
            errorName.innerHTML = "Họ tên không hợp lệ!";
            return false;
        } else {
            errorName.innerHTML = '';
        }

        if (phone == '' || phone == null) {
            erorPhone.innerHTML = "Số điện thoại không được để trống!";
        } else if (!regexPhone.test(phone)) {
            erorPhone.innerHTML = "SĐT không hợp lệ!";
            return false;
        } else {
            erorPhone.innerHTML = '';
        }

        if (email == '' || email == null) {
            errorEmail.innerHTML = "Email không được để trống!";
        } else if (!reGexEmail.test(email)) {
            errorEmail.innerHTML = "Email không hợp lệ!";
            email = '';
        } else {
            errorEmail.innerHTML = '';
        }

        var passW = document.getElementById('pass').value;
        var errorPass = document.getElementById('errorPass');

        if (passW == '' || passW == null) {
            errorPass.innerHTML = "Mật khẩu vui lòng không để trống!";
        } else {
            errorPass.innerHTML = "";
        }

        var ConPass = document.getElementById('passw').value;
        var errorConPass = document.getElementById('errorConPass');

        if (ConPass == '' || ConPass == null) {
            errorConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
        } else if (ConPass != passW) {
            alert("Xác nhận mật khẩu không trùng khớp!");
        } else {
            errorConPass.innerHTML = "";
        }


        if (name && phone && email && ConPass && passW && passW == ConPass) {
            alert("Đăng ký thành công!");
            document.getElementById("form-dangky").submit();
        } else {

        }

        return false;
    }
</script>
</html>
</c:if>
