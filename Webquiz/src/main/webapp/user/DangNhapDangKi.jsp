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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                <form id="loginForm" action="/userServlet" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input id="accountLoginInput" type="text" name="account" placeholder="Nhập tên đăng nhập...">
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input id="passwordLoginInput" type="password" name="password" placeholder="Nhập mật khẩu...">
                        </div>
                        <p id="errorLoginMessage" style="color: red"></p>
                        <c:if test="${sai == 1}">
                            <p style="color: red">Bạn nhập sai tài khoản mật khẩu!</p>
                        </c:if>

                            <%--                 Quên mật khẩu       --%>
                        <div class="text"><a href="/user/forgotPassword.jsp">Quên mật khẩu ?</a></div>


                        <div class="button input-box">
                            <input onclick="onSubmitLoginForm()" type="button" value="Đăng nhập">
                        </div>
                        <div class="text sign-up-text">Bạn chưa có tài khoản? <label for="flip" id="registerLabel">Đăng kí nhanh</label></div>
                    </div>
                </form>
            </div>
<%--            Đăng ký   --%>
            <div class="signup-form">
                <div class="title">Đăng ký</div>
                <form id="form-dangky" action="/userServlet" method="post" name="register">
                    <input type="hidden" name="action" value="createAccount">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="name" id="name" placeholder="Nhập vào tên của bạn">
                        </div>
                        <span style="color: red" id="errorName"></span>
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input  type="text"  name="nameAccount" id="nameAccount" placeholder="Nhập vào tên đăng nhập">
                        </div>
                        <span  style="color: red"  id="errorUsername"></span>
                        <c:if test="${isExist == true}">
                            <span  style="color: red"  id="usernameExist">Tên đăng nhập đã tồn tại.</span>
                        </c:if>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passw" id="pass" placeholder="Nhập mật khẩu">
                        </div>
                        <span style="color: red"   id="errorPass"></span>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="con_passw" id="passw" placeholder="Nhập lại mật khẩu">
                        </div>
                        <span style="color: red"   id="errorConPass"></span>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="email"id="email" placeholder="Nhập email của bạn">
                        </div>
                        <span  style="color: red"  id="errorEmail"></span>
                        <div class="input-box">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" id="address" name="address" placeholder="Nhập địa chỉ">
                        </div>
                        <span style="color: red"  id="errorAddress"></span>
                        <div class="input-box">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="phone" id="phone" placeholder="Nhập vào số điện thoại">
                        </div>
                        <span style="color: red"  id="errorPhone"></span>

                        <div class="button input-box">
                            <input onclick="onSubmit()" type="button" value="Đăng Ký">
                        </div>
                        <div class="text sign-up-text">Bạn đã có tài khoản? <label for="flip">Đăng nhập nhanh</label></div>
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
            <form action="/userServlet" method="post"  onsubmit="return ValidateForgot()">
            <div class="modal-body">
                <div class="form-group row">
                    <label  class="col-sm-3 control-labelform-label">Tên đăng nhập: </label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="inputNameAccount" name="inputNameAccount" placeholder="Nhập tên đăng nhập">
                    </div>
                </div>
                <div class="form-group row">
                    <label  class="col-sm-3 control-labelform-label">Mật email: </label>
                    <div class="col-sm-9">
                        <input type="email" class="form-control"name="inputEmail" id="inputEmail" placeholder="Nhập email...">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 control-labelform-label">Mật khẩu mới: </label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="inputNewPassword" id="inputNewPass" placeholder="Nhập mật khẩu mới">
                    </div>
                </div>
                <div class="form-group row">
                    <label  class="col-sm-3 control-labelform-label">Xác nhận mật khẩu: </label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" name="inputConfirmPassword" id="inputNewPassword" placeholder="Nhập lại mật khẩu">
                    </div>
                </div>
            </div>
                <div>
                    <span style="color: red" id="errName"></span>
                    <span  style="color: red"  id="errEmail"></span>
                    <span style="color: red"   id="errPass"></span>
                    <span  style="color: red"  id="errConPass"></span>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
            </form>
        </div>

    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>

<%--Validate đăng nhập--%>
<script>
    function validateLogin() {
        let username = document.getElementById("accountLoginInput").value;
        let password = document.getElementById('passwordLoginInput').value;
        let errorLoginMessage = document.getElementById("errorLoginMessage");
        if(username == '' || username == null || password == '' || password == null){
            errorLoginMessage.innerHTML = "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.";
            return false;
        }
        else
            errorLoginMessage.innerHTML = "";
        return true;
    }

    function onSubmitLoginForm() {
        if(validateLogin()){
            document.getElementById("loginForm").submit();
        }
    }
</script>

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
            errConPass.innerHTML = "Xác nhận mật khẩu không trùng khớp!";
        } else {
            errConPass.innerHTML = "";
        }
        if (name &&  email && inputNewPassword  &&inputNewPass && inputNewPassword==inputNewPass ) {
            Swal.fire({
                position: 'center-center',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
            })
        } else {
        }
        return false;
    }
</script>

<%--Validate đăng kí--%>
<script>
    function validate() {
        let name = document.getElementById('name').value.toLowerCase();
        let errorName = document.getElementById('errorName');
        let regexName = /^(([a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ']+)\s*)+$/;
        if (name == '' || name == null) {
            errorName.innerHTML = "Họ tên không được để trống.";
            return false;
        } else if (!regexName.test(name)) {
            errorName.innerHTML = "Họ tên không hợp lệ.";
            return false;
        } else {
            errorName.innerHTML = "";
        }

        let username = document.getElementById("nameAccount").value;
        let errorUsername = document.getElementById("errorUsername");
        if(username == '' || username == null){
            errorUsername.innerHTML = "Tên đăng nhập không được để trống.";
            return false;
        }
        else
            errorUsername.innerHTML = "";

        let password = document.getElementById('pass').value;
        let errorPass = document.getElementById('errorPass');
        if (password == '' || password == null) {
            errorPass.innerHTML = "Mật khẩu không được để trống.";
            return false;
        } else
            errorPass.innerHTML = "";


        let rePassword = document.getElementById('passw').value;
        let errorRePassword = document.getElementById('errorConPass');
        if (rePassword == '' || rePassword == null) {
            errorRePassword.innerHTML = "Xác nhận mật khẩu không được để trống.";
            return false;
        } else if (rePassword != password) {
            errorRePassword.innerHTML = "Xác nhận mật khẩu và mật khẩu không trùng khớp.";
            return false;
        } else
            errorRePassword.innerHTML = "";


        let email = document.getElementById('email').value;
        let errorEmail = document.getElementById('errorEmail');
        let reGexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;
        if (email == '' || email == null) {
            errorEmail.innerHTML = "Email không được để trống.";
            return false;
        } else if (!reGexEmail.test(email)) {
            errorEmail.innerHTML = "Email không hợp lệ.";
            return false;
        } else {
            errorEmail.innerHTML = "";
        }

        let address = document.getElementById('address').value;
        let errorAddress = document.getElementById('errorAddress');
        if(address == '' || address == null){
            errorAddress.innerHTML = "Địa chỉ không được để trống.";
            return false;
        }
        else
            errorAddress.innerHTML = "";

        let phone = document.getElementById('phone').value;
        let errorPhone = document.getElementById('errorPhone');
        let regexPhone = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        if (phone == '' || phone == null) {
            errorPhone.innerHTML = "Số điện thoại không được để trống.";
            return false;
        } else if (!regexPhone.test(phone)) {
            errorPhone.innerHTML = "Số điện thoại không hợp lệ.";
            return false;
        } else {
            errorPhone.innerHTML = "";
        }

        if (name && username && inputNewPassword==inputNewPass &&  email && inputNewPassword  &&inputNewPass ){
            return true;
        }
        return true;
    }
    function onSubmit() {
        let checkValidation = validate();
        console.log(checkValidation);
        if(checkValidation){
            document.getElementById("form-dangky").submit();
            localStorage.setItem('isSubmit', true);
        } else {
            localStorage.setItem('isSubmit', false);
        }
    }
    $( document ).ready(function() {
        if($("#usernameExist").length <= 0 && localStorage.getItem("isSubmit")){
            Swal.fire({
                position: 'center-center',
                icon: 'success',
                title: 'Đăng ký thành công!',
                showConfirmButton: false,
                timer: 1500
            });
        }
        else if($("#usernameExist").length > 0 || localStorage.getItem("isSubmit")){
            Swal.fire({
                icon: 'error',
                title: 'Đăng ký không thành công!',
                // text: 'Tên đăng nhập đã tồn tại.'
            })
            $("#registerLabel").trigger('click');
        }
        localStorage.removeItem("isSubmit");
    });
</script>
</html>
</c:if>
