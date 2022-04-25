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

                        <div class="text"><a href="#" data-toggle="modal" data-target="#editPassword">Quên mật khẩu ?</a></div>
                        <div class="button input-box">
                            <input type="submit" value="Đăng nhập">
                        </div>
                        <div class="text sign-up-text">Bạn chưa có tài khoản? <label for="flip" id="registerLabel">Đăng kí nhanh</label></div>
                    </div>
                </form>
            </div>
<%--            Đăng ký   --%>
            <div class="signup-form">
                <div class="title">Đăng ký</div>
                <form id="form-dangky" action="/userServlet" method="post" name="register" onsubmit="onSubmit()">
                    <input type="hidden" name="action" value="createAccount">
                    <div class="input-boxes">
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input type="text"  name="name" id="name" placeholder="Nhập vào tên của bạn" required >
                        </div>
                        <span style="color: red" id="errorName"></span>
                        <div class="input-box">
                            <i class="fas fa-user"></i>
                            <input  type="text"  name="nameAccount" id="nameAccount" placeholder="Nhập vào tên đăng nhập" required >
                        </div>
                        <span  style="color: red"  id="errorUsername"></span>
                        <c:if test="${isExist == true}">
                            <span  style="color: red"  id="usernameExist">Tên đăng nhập đã tồn tại.</span>
                        </c:if>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="passw" id="pass" placeholder="Nhập mật khẩu" required>
                        </div>
                        <span style="color: red"   id="errorPass"></span>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="con_passw" id="passw" placeholder="Nhập lại mật khẩu" required>
                        </div>
                        <span style="color: red"   id="errorConPass"></span>
                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="email"id="email" placeholder="Nhập email của bạn" required>
                        </div>
                        <span  style="color: red"  id="errorEmail"></span>
                        <div class="input-box">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" name="address" placeholder="Nhập địa chỉ" required>
                        </div>
                        <div class="input-box">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="phone" id="phone" placeholder="Nhập vào số điện thoại" required>
                        </div>
                        <span style="color: red"  id="erorPhone"></span>

                        <div class="button input-box">
                            <input type="submit" value="Đăng Ký" >
                        </div>
                        <div class="text sign-up-text">Bạn đã có tài khoản? <label for="flip">Đăng nhập nhanh</label></div>
                    </div>
                </form>
<%--                <%boolean check = false;%>--%>
<%--                <c:if test="${checkAccount.username != null}">--%>
<%--                    <% check = true; %>--%>
<%--                </c:if>--%>
<%--                <c:if test="${checkAccount.username == null}">--%>
<%--                    <% check = false; %>--%>
<%--                </c:if>--%>
                <div div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Thông báo</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Đăng ký tài khoản thành công.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
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
    function Validate() {
        var name = document.getElementById('name').value;
        var errorName = document.getElementById('errorName');
        var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;

        var phone = document.getElementById('phone').value;
        var erorPhone = document.getElementById('erorPhone');
        var regexPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;

        var email = document.getElementById('email').value;
        var errorEmail = document.getElementById('errorEmail');
        var reGexEmail = /[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

        if (name == '' || name == null) {
            errorName.innerHTML = "Họ tên không được để trống!";
            return false;
        } else if (!regexName.test(name)) {
            errorName.innerHTML = "Họ tên không hợp lệ!";
            return false;
        } else {
            errorName.innerHTML = '';
        }

        if (phone == '' || phone == null) {
            erorPhone.innerHTML = "Số điện thoại không được để trống!";
            return false;
        } else if (!regexPhone.test(phone)) {
            erorPhone.innerHTML = "SĐT không hợp lệ!";
            return false;
        } else {
            erorPhone.innerHTML = '';
        }

        if (email == '' || email == null) {
            errorEmail.innerHTML = "Email không được để trống!";
            return false;
        } else if (!reGexEmail.test(email)) {
            errorEmail.innerHTML = "Email không hợp lệ!";
            email = '';
            return false;
        } else {
            errorEmail.innerHTML = '';
        }

        var passW = document.getElementById('pass').value;
        var errorPass = document.getElementById('errorPass');

        if (passW == '' || passW == null) {
            errorPass.innerHTML = "Mật khẩu vui lòng không để trống!";
            return false;
        } else {
            errorPass.innerHTML = "";
        }

        var ConPass = document.getElementById('passw').value;
        var errorConPass = document.getElementById('errorConPass');

        if (ConPass == '' || ConPass == null) {
            errorConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
            return false;
        } else if (ConPass != passW) {
            errorConPass.innerHTML = "Xác nhận mật khẩu không trùng khớp!";
            return false;
        } else {
            errorConPass.innerHTML = "";
        }
        return true;
    }
    <%--function isAccountExist() {--%>
    <%--    var check = <%= isExist%>--%>
    <%--    var errorUsername = document.getElementById("errorUsername").value;--%>
    <%--    if(check == 1){--%>
    <%--        errorUsername.innerHTML = "Tên đăng nhập đã tồn tại";--%>
    <%--        return false--%>
    <%--    }--%>
    <%--    return true;--%>
    <%--}--%>
    function onSubmit() {
        if(Validate()){
            document.getElementById("form-dangky").submit();
            localStorage.setItem('isSubmit', true);
<%--            <%boolean isExist = false;%>--%>
<%--            <c:if test="${isExist}">--%>
<%--                <%isExist = true;%>--%>
<%--            </c:if>--%>
<%--            var checkAccount = <%= isExist%>;--%>
<%--            console.log(checkAccount);--%>
<%--            if(checkAccount)--%>
<%--                alert("Tên đăng nhập đã tồn tại.");--%>
<%--            else--%>

        }
        return
    }
    $( document ).ready(function() {
        if($("#usernameExist").length <= 0 && localStorage.getItem("isSubmit"))
            alert("Đăng ký thành công.");
        else if($("#usernameExist").length > 0 && localStorage.getItem("isSubmit")){
            $("#registerLabel").trigger('click');
        }
        localStorage.removeItem("isSubmit");
    });

    <%--function checkAccount() {--%>
    <%--    &lt;%&ndash;var accountList = [&ndash;%&gt;--%>
    <%--    &lt;%&ndash;    <c:forEach var="account" items="${accountList}">&ndash;%&gt;--%>
    <%--    &lt;%&ndash;        '<c:out value="${account}"/>',&ndash;%&gt;--%>
    <%--    &lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>
    <%--    &lt;%&ndash;]&ndash;%&gt;--%>
    <%--    var username = document.getElementById("nameAccount").value;--%>
    <%--    var errorUsername = document.getElementById("usernameExist").value;--%>

    <%--    if (username == null){--%>
    <%--        errorUsername.innerHTML = "Tên đăng nhập không được để trống.";--%>
    <%--    }else {--%>
    <%--        for (let account of accountList) {--%>
    <%--            if (username == account)--%>
    <%--                errorUsername.innerHTML = "Tên đăng nhập đã tồn tại.";--%>
    <%--        }--%>
    <%--    }--%>
    <%--}--%>


    <%--function registerAlert() {--%>
    <%--    var check = <%= check%>;--%>
    <%--    if(check == true){--%>
    <%--        alert("Tên đăng nhập đã tồn tại.");--%>
    <%--        // Swal.fire({--%>
    <%--    //     position: 'center-center',--%>
    <%--    //     icon: 'success',--%>
    <%--    //     title: 'Đăng ký thành công!',--%>
    <%--    //     showConfirmButton: false,--%>
    <%--    //     timer: 1500--%>
    <%--    // })--%>
    <%--    } else{--%>
    <%--        alert("Đăng ký thành công!")--%>
    <%--    }--%>
    <%--}--%>
</script>
</html>
</c:if>
