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
            <div class="form__info-image">
                <img src="${user.image}" class="form__info-img">
                <button data-toggle="modal" data-target="#editImage" class="form__info-btn-image">Đổi ảnh</button>
            </div>
            <ul class="form__info-list" style="padding-left:20px">
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
            <button id="changePasswordBtn" data-toggle="modal" data-target="#editPassword" class="form__info-btn">Đổi mật khẩu</button>
        </div>
    </div>


    <!-- Lịch xử thi -->
    <div class="history show">
        <h2 class="history__title">Lịch sử thi</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Môn thi</th>
                <th scope="col">Đề thi</th>
                <th scope="col">Bắt đầu</th>
                <th scope="col">Kết thúc</th>
                <th scope="col">Điểm</th>
            </tr>
            </thead>
            <tbody id="content">
            <c:forEach items="${history}" var="exam" varStatus="loop">
                <tr>
                    <th scope="row">${loop.index +1 +  (indexPage-1)*pageSize}</th>
                    <td>${exam.getExam().getSubject().subject_name}</td>
                    <td>${exam.getExam().examName}</td>
                    <td>${exam.startTime}</td>
                    <td>${exam.endTime}</td>
                    <td>${exam.point}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <nav aria-label="Page navigation example">
            <ul class="pagination" style="justify-content: center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${countPage}"  var="p">
                    <c:choose>
                        <c:when test="${p == indexPage}">
                            <li class="page-item active">
                                <form action="/userServlet" method="post">
                                    <input type="hidden" name="action" value="infoUser">
                                    <input type="hidden" name="index" value="${p}">
                                    <input type="hidden" name="idUser" value="${sessionScope.user.userId}">
                                    <input type="hidden" class="check" name="check" value="">

                                    <button  class="page-link" id="page${p}" onclick="activePage(${p})" type="submit">
                                            ${p}
                                    </button>
                                </form>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <form action="/userServlet" method="post">
                                    <input type="hidden" name="action" value="infoUser">
                                    <input type="hidden" name="index" value="${p}">
                                    <input type="hidden" class="check" name="check" value="">
                                    <input type="hidden" name="idUser" value="${sessionScope.user.userId}">
                                    <button  class="page-link" id="page${p}" onclick="activePage(${p})" type="submit">
                                            ${p}
                                    </button>
                                </form>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>

<!-- Modal đổi avatar -->
<div class="modal fade" id="editImage" tabindex="-1" role="dialog" aria-labelledby="modalEditImage"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="form__info-head" id="modalEditImage">
                <h3 class="form__info-title">Đổi ảnh đại diện</h3>
            </div>
            <form id="formImage" action="/userServlet" method="post" enctype="multipart/form-data" >
                <input type="hidden" name="action" value="updateImage">
                <input type="hidden" name="idUser" value="${user.userId}">
                <input type="hidden" name="account" value="${user.account}">
                <input type="hidden" name="index" value="${indexPage}">
                <input type="hidden" class="check" name="check" value="">
                <input type="hidden" id="imageLink" name="imageLink" value="">
                <div class="modal-body">
                    <div class="form-group row">
                        <img src="${user.image}" width="200" height="200" id="imageInput">
                    </div>
                    <div class="form-group row">
                            <input type="file" name="inputFile" id="inputFile" accept="image/gif, image/jpeg, image/png" onchange="chooseFile(this)">

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button"  class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button"  id="btnUpload" class="btn btn-primary">Cập nhật</button>
                </div>

            </form>
        </div>
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
                <input type="hidden" class="check" name="check" value="">
                <input type="hidden" name="index" value="${indexPage}">
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
            <form id="form-editpass" action="/userServlet" method="post" name="register">
                <input type="hidden" name="action" value="updatePassword">
                <input type="hidden" name="idUser" value="${user.userId}">
                <input type="hidden" name="nameAccount" value="${user.account}">
                <input type="hidden" name="index" value="${indexPage}">
                <input type="hidden" class="check" name="check" value="">
            <div class="modal-body">
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-3 control-labelform-label">Mật khẩu hiện tại: </label>
                    <div class="col-sm-9">
                        <input id="currentPassword" type="password" name="password" class="form-control" id="inputPassword" placeholder="Nhập mật khẩu hiện tại">
                        <c:if test="${checkPassword == 0}">
                            <span style="color: red"   id="errorCurrentPassword">Mật khẩu không đúng. Vui lòng nhập lại!</span>
                        </c:if>
                        <span style="color: red"   id="errorCurrentPassword1"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputNewPassword" class="col-sm-3 control-labelform-label">Mật khẩu mới: </label>
                    <div class="col-sm-9">
                        <input type="password" name="newPassword" class="form-control" id="inputNewPassword" placeholder="Nhập mật khẩu mới">
                        <span style="color: red"   id="errPass"></span>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputConfirmPassword" class="col-sm-3 control-labelform-label">Xác nhận mật khẩu: </label>
                    <div class="col-sm-9">
                        <input type="password"  name="confirmPassword" class="form-control" id="inputConfirmPassword" placeholder="Nhập lại mật khẩu">
                        <span  style="color: red"  id="errConPass"></span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ qua</button>
                <button onclick="changePassword()" type="button" class="btn btn-primary">Cập nhật</button>
            </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/view/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

<script src="https://www.gstatic.com/firebasejs/8.2.8/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.8/firebase-storage.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
<script type="module">
    const firebaseConfig = {
        apiKey: "AIzaSyBTvluOVU-z5bsZLJTgrGogrJlTEYzCzJU",
        authDomain: "quizgym-f6283.firebaseapp.com",
        projectId: "quizgym-f6283",
        storageBucket: "quizgym-f6283.appspot.com",
        messagingSenderId: "244734517152",
        appId: "1:244734517152:web:952cf6f50243f7d9fecec5",
        measurementId: "G-8HMY0ZTSRK"
    };

    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);



    // upload anhr filebase
    const btn = document.getElementById("btnUpload");
    btn.onclick = function() {
        const ref = firebase.storage().ref();
        const file = document.querySelector('#inputFile').files[0];
        const metadata = {
            contentType: file.type
        };
        console.log(file);
        const name = "${user.account}"  + file.name;
        const uploadIMG = ref.child(name).put(file, metadata);
        uploadIMG
            .then(snapshot => snapshot.ref.getDownloadURL())
            .then(url => {
                document.getElementById("imageLink").value = url;
                console.log(url);
                document.getElementById("formImage").submit();
            })
            .catch(console.error)

    };
</script>
<script src="/static/js/TrangCaNhan.js"></script>

</body>

</html>

</c:if>