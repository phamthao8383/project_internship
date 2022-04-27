<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${sessionScope.account.idRole != 1}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error.jsp"/>
</c:if>
<c:if test="${sessionScope.account.idRole == 1}">

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/admin/view/head.jsp"/>
    <title>Smart Quiz</title>
</head>
<body>
<jsp:include page="/admin/view/header.jsp"/>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/view/left_navbar.jsp"/>
            <div class="col-10 content">
                <div class="content__title">
                    <p>Quản lý thành viên</p>
                </div>
                <div class="user-list">
                    <c:if test="${empty memberList}">
                        <h2>Danh sách thành viên trống.</h2>
                    </c:if>
                    <c:if test="${not empty memberList}">
                        <table id="user_table" class="table table-hover">
                            <colgroup>
                                <col width="130" span="1">
                                <col width=auto span="6">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">Mã thành viên</th>
                                <th scope="col">Tài khoản</th>
                                <th scope="col">Họ và Tên</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col" class="text-center">Điểm tích luỹ</th>
                                <th scope="col" class="text-center">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="member" items="${memberList}" varStatus="loop">
                            <tr class="${member.role == 1?"table-success":""}">
                                <th scope="row">${member.userId}</th>
                                <td>${member.account}</td>
                                <td>${member.name}</td>
                                <td>${member.address}</td>
                                <td>${member.phone}</td>
                                <td class="text-center">${member.point}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-outline-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal${loop.index}">Sửa</button>
                                    <button onclick="onDeleteMember(${member.userId})" type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal">Xóa</button>
                                </td>
<%--                                Update Modal --%>
                                <div class="modal fade" id="editModal${loop.index}" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel">Sửa thông tin người dùng</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="/admin/manage-user?action=update" method="post" id="updateMemberForm">
                                                <input type="hidden" name="idUpdate" id="MemberIDUpdate" value="${member.userId}">
                                                <input type="hidden" name="usernameUpdate" id="MemberUsernameUpdate" value="${member.account}">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="">
                                                            <div class="row mb-3">
                                                                <label for="accountInput" class="col-sm-3 col-form-label">Tài khoản</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" name="username" value="${member.account}" disabled id="accountInput">
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="nameInput" class="col-sm-3 col-form-label">Họ và Tên</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" name="name" value="${member.name}" id="nameInput" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="emailInput" class="col-sm-3 col-form-label">Email</label>
                                                                <div class="col-sm-9">
                                                                    <input type="email" class="form-control" name="email" value="${member.email}" id="emailInput" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="phoneInput" class="col-sm-3 col-form-label">Số điện thoại</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" name="phone" value="${member.phone}" id="phoneInput" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="addressInput" class="col-sm-3 col-form-label">Địa chỉ</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" name="address" value="${member.address}" id="addressInput" required>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <label for="pointInput" class="col-sm-3 col-form-label">Điểm tích lũy</label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" class="form-control" name="point" value="${member.point}" id="pointInput" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex justify-content-between mt-3">
                                                                <p class="mb-0">Phân quyền người dùng</p>
                                                                <div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" name="role" value="1" type="radio" ${member.role == 1?"checked":""} id="inlineRadio1" required>
                                                                        <label class="form-check-label" for="inlineRadio1">Quản trị viên</label>
                                                                    </div>
                                                                    <div class="form-check form-check-inline">
                                                                        <input class="form-check-input" name="role" value="2" type="radio" ${member.role == 2?"checked":""} id="inlineRadio2">
                                                                        <label class="form-check-label" for="inlineRadio2">Thành viên</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                    <button type="submit" class="btn btn-primary" onclick="showAlertUpdate()">Lưu</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </tr>

                            </c:forEach>
                            </tbody>
                        </table>
<%--                    Phân trang  --%>
                        <div class="row">
                            <div class="col-4">
                                <c:set var="indexMemberEnd" scope="session" value="${indexMember + entryDisplay -1}"/>
                                <c:if test="${indexMemberEnd > totalMember}">
                                    <c:set var="indexMemberEnd" scope="session" value="${totalMember}"/>
                                </c:if>
                                <span>Hiển thị ${indexMember} - <c:out value="${indexMemberEnd}"/> trong tổng số ${totalMember} mục.</span>
                            </div>
                            <div class="col-8">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-sm justify-content-center">
                                        <li class="page-item ${currentPage <= 1?"disabled":""}">
                                            <c:url value="/admin/manage-user" var="prevUrl">
                                                <c:param name="index" value="${currentPage - 1}"/>
                                            </c:url>
                                            <a href="<c:out value="${prevUrl}"/>" class="page-link" aria-label="Previous">
                                                Trang trước
                                            </a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${maxPages}">
                                            <li class="page-item ${currentPage == i?"active":""}">
                                                <a class="page-link" href="/admin/manage-user?index=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item ${currentPage >= maxPages?"disabled":""}">
                                            <c:url value="/admin/manage-user" var="nextUrl">
                                                <c:param name="index" value="${currentPage + 1}"/>
                                            </c:url>
                                            <a href="<c:out value="${nextUrl}"/>" class="page-link" aria-label="Next">
                                                Trang sau
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Xác nhận xoá thành viên?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/admin/manage-user?action=delete" method="post" id="deleteMemberForm">
                <input type="hidden" name="id" id="MemberIDDelete">
                <div class="modal-body">
                    Hành động này không thể hoàn tác. Bạn xác nhận muốn xóa thành viên?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button onclick="showAlertDelete()" type="submit" class="btn btn-primary">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<%--SweatAlert2:--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.9/dist/sweetalert2.all.min.js"></script>

<script>
    let updateForm = document.getElementById("updateMemberForm");
    let deleteForm = document.getElementById("deleteMemberForm");
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    function onDeleteMember(MemberIDDelete) {
        document.getElementById("MemberIDDelete").value = MemberIDDelete;
    }

    function showAlertDelete() {
        if(deleteForm.checkValidity()){
            localStorage.setItem("isDeleted", true);
        }
    }

    function showAlertUpdate() {
        if(updateForm.checkValidity()){
            localStorage.setItem("isUpdated", true);
        }
    }

    $(document).ready(function () {
        if (localStorage.getItem("isDeleted")){
            Toast.fire({
                icon: 'warning',
                title: 'Xóa thành công!'
            })
            localStorage.removeItem("isDeleted");
        }

        if (localStorage.getItem("isUpdated")){
            Toast.fire({
                icon: 'info',
                title: 'Cập nhật thành công!'
            })
            localStorage.removeItem("isUpdated");
        }
    });
</script>
</html>

</c:if>