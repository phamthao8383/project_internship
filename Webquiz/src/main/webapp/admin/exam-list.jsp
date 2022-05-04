<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/7/2022
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${sessionScope.account.idRole != 1}">
    <%--    ${pageContext.request.contextPath} --%>
    <jsp:include page="/view/error403.jsp"/>
</c:if>
<c:if test="${sessionScope.account.idRole == 1}">
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/admin/view/head.jsp"/>
    <title>Smart Quiz</title>
    <link rel="stylesheet" href="/static/css/exam-list.css">
</head>
<body>
<jsp:include page="/admin/view/header.jsp"/>
<div class="main">
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="/admin/view/left_navbar.jsp"/>
            <div class="col-10 content">
                <div class="content__title">
                    <p>Danh sách đề thi</p>
                    <div class="title-actions">
                        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">Tạo mới
                        </button>
                    </div>
                </div>
                <div class="user-list">
                    <table border="1" cellpadding="4" class="table table-hover">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col" style="width: 10%">Mã đề thi</th>
                            <th scope="col" style="width: 20%">Môn học</th>
                            <th scope="col" style="width: 35%">Tên đề thi</th>
                            <th scope="col" style="width: 10%">Thời gian</th>
                            <th scope="col">Tác vụ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="exam" items="${listExam}" varStatus="loop">
                            <input type="hidden" name="indexExam${loop.index}" value="${loop.index}">
                            <tr>
                                <td>
                                    <c:set var="examIndexHelper" value="${(currentPage-1)*entryDisplay}" scope="session"/>
                                    <c:out value="${examIndexHelper + loop.index + 1}"/>
                                </td>
                                <td><c:out value="${exam.examId}"/></td>
                                <td><c:out value="${exam.getSubject().getSubject_name()}"/></td>
                                <td><c:out value="${exam.examName}"/></td>
                                <td><c:out value="${exam.allowedTime} phút"/></td>
                                <td>
                                    <div class="d-flex">
                                        <form method="post" action="/admin/examQuestion">
                                            <input type="hidden" name="action" value="getExamQuestion">
                                            <input type="hidden" name="examId" value="${exam.examId}">
                                            <input type="hidden" name="examName" value="${exam.examName}">
                                            <input type="hidden" name="subjectName" value="${exam.getSubject().getSubject_name()}">
                                            <input type="hidden" name="subjectId" value="${exam.getSubject().getSubject_id()}">
                                            <button class="btn btn-outline-primary btn-sm" type="submit">
                                                Xem
                                            </button>
                                        </form>
                                        <button class="btn btn-outline-warning btn-sm" type="button"
                                                data-bs-toggle="modal" data-bs-target="#editExamModal${loop.index}" style="margin: 0 8px">
                                            Sửa
                                        </button>

                                        <button class="btn btn-outline-danger btn-sm" type="button"
                                                data-bs-toggle="modal" data-bs-target="#deleteModal1${loop.index}">
                                            Xóa
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <!-- Edit Exam Modal -->
                            <div class="modal fade" id="editExamModal${loop.index}" tabindex="-1"
                                 aria-labelledby="editExamLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editExamLabel">Chỉnh Sửa đề thi</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="updateExamForm${loop.index}" action="/admin/exams" method="POST">
                                                <input type="hidden" name="action" value="edit">
                                                <div class="mb-3 row">
                                                    <div class="col-sm-9">
                                                        <input type="hidden" class="form-control"
                                                               name="exam_id"
                                                               value="${exam.examId}"/><br>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Môn học</label>
                                                    <div class="col-sm-9">
                                                        <select name="subject_id"  class="form-select">
                                                            <c:forEach var="subject" items="${listSubject}">
                                                                <c:choose>
                                                                    <c:when test="${subject.subject_id == exam.getSubject().getSubject_id()}">
                                                                        <option value="${subject.subject_id}"
                                                                                selected> ${subject.subject_name}</option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${subject.subject_id}">${subject.subject_name}</option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label class="col-sm-3 col-form-label">Thời gian cho
                                                        phép</label>
                                                    <div class="col-sm-9">
                                                        <input id="examTime${loop.index}" type="text" class="form-control"
                                                               name="allowed_time"
                                                               value="${exam.allowedTime}"/><br>
                                                        <span style="color: red" id="errorExamTime${loop.index}"></span>
                                                    </div>
                                                </div>
                                                <div class="mb-3 row">
                                                    <label  class="col-sm-3 col-form-label">Tên đề
                                                        thi</label>
                                                    <div class="col-sm-9">
                                                        <input id="examName${loop.index}" type="text" class="form-control"
                                                               name="exam_name"
                                                               value="${exam.examName}"/><br>
                                                        <span style="color: red" id="errorExamName${loop.index}"></span>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                    <button type="button" onclick="onSubmitUpdateExam(${loop.index})" class="btn btn-primary">Sửa</button>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <%--Delete Exam Modal--%>
                            <div class="modal fade" id="deleteModal1${loop.index}" tabindex="-1" ria-labelledby="deleteModalLabel1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form onsubmit="onDeleteExam()" action="/admin/exams" method="post"
                                              class="modal-content">
                                            <input type="hidden" name="idExa" value="${exam.examId}">
                                            <input type="hidden" name="action" value="delete">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Xác nhận xóa Đề ${exam.examId}</h5>

                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Xác nhận xóa đề ${exam.examName}?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                                <button type="submit" class="btn btn-primary">Xác nhận</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>


                        </c:forEach>
                        </tbody>
                    </table>
<%--                        Phân trang --%>
                    <div class="row">
                        <div class="col-4">
                            <c:set var="indexExamEnd" scope="session" value="${indexExamStart + entryDisplay - 1}"/>
                            <c:if test="${indexExamEnd > totalExam}">
                                <c:set var="indexExamEnd" scope="session" value="${totalExam}"/>
                            </c:if>
                            <span>Hiển thị ${indexExamStart} - <c:out value="${indexExamEnd}"/> trong tổng số ${totalExam} mục.</span>
                        </div>
                        <div class="col-8">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-sm justify-content-center">
                                    <li class="page-item ${currentPage <= 1?"disabled":""}">
                                        <c:url value="/admin/exams" var="prevUrl">
                                            <c:param name="index" value="${currentPage - 1}"/>
                                        </c:url>
                                        <a href="<c:out value="${prevUrl}"/>" class="page-link" aria-label="Previous">
                                            Trang trước
                                        </a>
                                    </li>
                                    <c:forEach var="i" begin="1" end="${maxPages}">
                                        <li class="page-item ${currentPage == i?"active":""}">
                                            <a class="page-link" href="/admin/exams?index=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${currentPage >= maxPages?"disabled":""}">
                                        <c:url value="/admin/exams" var="nextUrl">
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
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Create New Exam Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo mới đề thi</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createExamForm" action="/admin/exams" method="post">
                    <input type="hidden" name="action" value="create">
                    <div class="mb-3 row">
                        <div class="col-sm-9">
                            <input type="hidden" class="form-control" name="exam_id"/><br>
                        </div>
                    </div>
<%--                        <div class="mb-3 row">--%>
<%--                            <div class="col-sm-9">--%>
<%--                                <label class="form-label col-sm-3">Nhập tên đề thi</label>--%>
<%--                                <input class="form-control" name="exam_name"/><br>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Tên đề thi</label>
                        <div class="col-sm-9">
                            <input id="examName" type="text" class="form-control" name="exam_name"/><br>
                            <span style="color: red" id="errorExamName"></span>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Thời gian cho phép (phút)</label>
                        <div class="col-sm-9">
                            <input id="examTime" type="text" class="form-control" name="allowed_time"/><br>
                            <span style="color: red" id="errorExamTime"></span>
                        </div>
                    </div>
                    <div class="mb-3 row">
<%--                            <label class="form-label col-sm-3">Chọn môn:</label>--%>
<%--                            <div class="d-flex mt-1 col-sm-9">--%>
<%--                                <c:forEach items="${listSubject}" var="subject">--%>
<%--                                    <div class="form-check col-sm">--%>
<%--                                        <input class="form-check-input" type="radio" name="subject"--%>
<%--                                               id="maleInput${subject.subject_id}" value="${subject.subject_id}">--%>
<%--                                        <label class="form-check-label" for="maleInput${subject.subject_id}">--%>
<%--                                                ${subject.subject_name}--%>
<%--                                        </label>--%>
<%--                                    </div>--%>
<%--                                </c:forEach>--%>

<%--                            </div>--%>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">Môn học</label>
                        <div class="col-sm-9">
                            <select name="subject_id"  class="form-select">
                                <c:forEach var="subject" items="${listSubject}">
                                    <option value="${subject.subject_id}">${subject.subject_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button onclick="onSubmitCreateExam('')" type="button" class="btn btn-primary">Tạo</button>
                    </div>
                </form>
            </div>
                <%--            <div class="modal-footer">--%>
                <%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>--%>
                <%--                <button type="submit" class="btn btn-primary">Gửi</button>--%>
                <%--            </div>--%>
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
    <%--SweatAlert2:--%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.9/dist/sweetalert2.all.min.js"></script>

<script>

    let createExamForm = document.getElementById("createExamForm");
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

    //Hàm validate form tạo đề, sửa đề
    function validateExam(index){
        console.log("validate index: "+index);
        let examName = document.getElementById('examName'+index).value;
        let errorExamName = document.getElementById('errorExamName'+index);
        let examTime = document.getElementById('examTime'+index).value;
        // console.log("examTime: "+examTime);
        // console.log("number examTime: "+Number(examTime));
        // console.log('kiem tra: '+ (!Number.isInteger(Number(examTime)) || Number(examTime)<=0))
        let errorExamTime = document.getElementById('errorExamTime'+index);
        if(examName == '' || examName == null){
            errorExamName.innerHTML = 'Vui lòng nhập tên đề thi.';
            return false;
        } else {
            errorExamName.innerHTML = '';
        }

        if(examTime == '' || examTime == null){
            errorExamTime.innerHTML = 'Vui lòng nhập thời gian cho phép của đề.';
            return false;
        } else if(!Number.isInteger(Number(examTime)) || Number(examTime)<=0){
            errorExamTime.innerHTML = 'Thời gian cho phép được tính bằng phút và phải là số nguyên dương.';
            return false;
        } else {
            errorExamName.innerHTML = '';
        }

        return true;
    }

    function onSubmitUpdateExam(index){
        console.log("hàm index: "+index);
        console.log(validateExam(index));
        let updateExamForm = document.getElementById("updateExamForm"+index);
        console.log("updateExamForm"+index);
        if(validateExam(index)){
            document.getElementById("updateExamForm"+index).submit();
            localStorage.setItem('isUpdate', true);
        }
    }
    function onSubmitCreateExam(index){
        if(validateExam(index)){
            createExamForm.submit();
            localStorage.setItem('isCreate', true);
        }
    }
    function onDeleteExam(){
        localStorage.setItem('isDelete', true);
    }

    $(document).ready(function () {
        if (localStorage.getItem("isUpdate")){
            Toast.fire({
                icon: 'success',
                title: 'Cập nhật đề thi thành công!'
            })
            localStorage.removeItem("isUpdate");
        }

        if (localStorage.getItem("isCreate")){
            Toast.fire({
                icon: 'success',
                title: 'Tạo đề thi thành công!'
            })
            localStorage.removeItem("isCreate");
        }

        if (localStorage.getItem("isDelete")){
            Toast.fire({
                icon: 'success',
                title: 'Xoá đề thi thành công!'
            })
            localStorage.removeItem("isDelete");
        }
    })
</script>
</html>
</c:if>