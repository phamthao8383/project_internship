<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${sessionScope.account == null}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error.jsp"/>
</c:if>
<c:if test="${sessionScope.account != null}">
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>Thông tin ${sessionScope.user.name}</title>
    <link rel="stylesheet" href="/static/css/TrangCaNhan.css">
</head>

<body>
<jsp:include page="/view/header.jsp"/>
<div class="container-fluid">
    <div class="form__info">
        <div class="form__info-head">
            <h3 class="form__info-title">Thông tin của ${user.name} </h3>
        </div>
        <div class="form__info-body">



            <form method="post" action="#" enctype="multipart/from-data">

                <div class="form__info-image">

                    <img src="${user.image}" class="form__info-img">
                    <input class="input_file" name="image" id="image" type="file">
                    <button type="submit" class="btn btn-primary"> helo</button>
                </div>


            </form>


            <ul class="form__info-list">
                <li class="form__info-item">
                    <span class="form__info-name">Tên đăng nhập:</span>
                    <p class="form__info-value">${user.account}</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Họ tên:</span>
                    <p class="form__info-value">${user.name}</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Email: </span>
                    <p class="form__info-value">${user.email}</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Địa chỉ: </span>
                    <p class="form__info-value">${user.address}</p>
                </li>
                <li class="form__info-item">
                    <span class="form__info-name">Số điện thoại:</span>
                    <p class="form__info-value">${user.phone} </p>
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
            <c:forEach items="${history}" var="exam">
                <tr>
                    <th scope="row">1</th>
                    <td>${exam.getExam().getSubject().subject_name}</td>
                    <td>${exam.getExam().examName}</td>
                    <td>${exam.point}</td>
                    <td>${exam.getExam().allowedTime}</td>
                </tr>
            </c:forEach>
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
            <form id="form-chinhsua"  action="/userServlet" method="post" name="register" onsubmit="return ValidateEdit()">
                <input type="hidden" name="action" value="updateMyInfo">
                <input type="hidden" name="idUser" value="${user.userId}">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputName" class="col-sm-2 col-form-label">Họ tên</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="inputName" value="${user.name}"  placeholder="Nhập họ tên">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" name="email" class="form-control" value="${user.email}" id="inputEmail" placeholder="Email của bạn">
                    </div>
                </div>
                <div class="form-group row">


                    `




                    <label for="inputPhone" class="col-sm-2 col-form-label">SĐT</label>

                    <div class="col-sm-10">
                        <input type="phone" name="phone" value="${user.phone}" class="form-control" id="inputPhone"
                               placeholder="Số điện thoại của bạn">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputAddress" class="col-sm-2 col-form-label">Địa chỉ</label>
                    <div class="col-sm-10">
                        <input type="text" name="address" value="${user.address}" class="form-control" id="inputAddress" placeholder="Địa chỉ..">
                    </div>
                </div>
            </div>
                <div>
                    <span style="color: red" id="errorName"></span>
                    <span style="color: red"  id="erorPhone"></span>
                    <span  style="color: red"  id="erorEmail"></span>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </div>
            </form>
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
            <form id="form-editpass" action="/userServlet" method="post" name="register" onsubmit="return ValidateChangePass()">
                <input type="hidden" name="action" value="updatePassword">
                <input type="hidden" name="idUser" value="${user.userId}">
                <input type="hidden" name="nameAccount" value="${user.account}">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-3 control-labelform-label">Mật khẩu hiện tại: </label>
                    <div class="col-sm-9">
                        <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Nhập mật khẩu hiện tại">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputNewPassword" class="col-sm-3 control-labelform-label">Mật khẩu mới: </label>
                    <div class="col-sm-9">
                        <input type="password" name="newPassword" class="form-control" id="inputNewPassword" placeholder="Nhập mật khẩu mới">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputConfirmPassword" class="col-sm-3 control-labelform-label">Xác nhận mật khẩu: </label>
                    <div class="col-sm-9">
                        <input type="password"  name="confirmPassword" class="form-control" id="inputConfirmPassword" placeholder="Nhập lại mật khẩu">
                    </div>
                </div>
            </div>
                <div>
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
<jsp:include page="/view/footer.jsp"/>
<script>
    function showhistory() {
        document.getElementById("history").classList.toggle("show");

    }
</script>

<%--Validate ChangePassword--%>
<script>
    function ValidateChangePass() {


        const inputNewPassword = document.getElementById('inputNewPassword').value;
        const errPass = document.getElementById('errPass');

        if ( inputNewPassword == '' || inputNewPassword== null) {
        errPass.innerHTML = "Mật khẩu vui lòng không để trống!";
    } else {
        errPass.innerHTML = "";
    }

        const inputConfirmPassword = document.getElementById('inputConfirmPassword').value;
        const errConPass = document.getElementById('errConPass');

        if (inputConfirmPassword == '' || inputConfirmPassword == null) {
        errConPass.innerHTML = "Xác nhận mật khẩu vui lòng không để trống!";
    } else if (inputConfirmPassword != inputNewPassword) {
        alert("Xác nhận mật khẩu không trùng khớp!");
    } else {
        errConPass.innerHTML = "";
    }


    if (inputConfirmPassword && inputNewPassword && inputConfirmPassword==inputNewPassword ) {

        alert("Đổi mật khẩu thành công!");
        document.getElementById("form-editpass").submit();

    } else {

    }

    return false;

    }

</script>

<%--Validate Edit--%>
<script>
    function ValidateEdit(){
        var name = document.getElementById('inputName').value;
        var errName = document.getElementById('errorName');
        var regexName = /^[^\d+]*[\d+]{0}[^\d+]*$/;



        var email = document.getElementById('inputEmail').value;
        var errEmail = document.getElementById('erorEmail');
        var reGexEmail = /^([a-z]{2}).+.[a-zA-Z0-9_.]{1,20}.+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm;

        var phone = document.getElementById('inputPhone').value;
        var erorPhone = document.getElementById('erorPhone');
        var regexPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;


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
        if (phone == '' || phone == null) {
            erorPhone.innerHTML = "Số điện thoại không được để trống!";
        } else if (!regexPhone.test(phone)) {
            erorPhone.innerHTML = "SĐT không hợp lệ!";
            return false;
        } else {
            erorPhone.innerHTML = '';
        }
        if (name && phone && email ) {
            document.getElementById("form-chinhsua").submit();
        } else {

        }

        return false;



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

</c:if>