<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/view/head.jsp"/>
    <title>QuizGym</title>
</head>
<body>
<jsp:include page="/view/header.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-3 col-md-3">
            <div class="honour">
                <div class="gold_pound">
                    <i class="fa-solid fa-award"></i>
                    <p>Vinh danh bảng vàng</p>
                </div>
                <div class="div_group">
                    <ul class="list-group">
                        <c:forEach var="member" items="${memberList}">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span><c:out value="${member.name}"></c:out></span>
                                <span class="badge badge-primary badge-pill">
                                        ${member.point}
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="honour">
                <div class="gold_pound">
                    <i class="fa-regular fa-comment-arrow-down"></i>
                    <p>Hỗ trợ trực tuyến</p>
                </div>
                <div class="div_group_call">
                    <ul class="list-group">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            ONLINE
                            <span class="badge badge-primary badge-pill">Skype</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            HOTLINE
                            <span class="badge badge-primary badge-pill">0123456789</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            MESSENGER
                            <span class="badge badge-primary badge-pill"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-6">
            <div class="row">
                <a href="/exam_list?action=list_exam&sj_id=1" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/Thiết-kế-không-tên-1-1.png" style="height: 180px" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Toán Học</h5>
                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=3" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/vai-tro-cua-hoa-hoc-lop-8_3.png" style="height: 180px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Hóa Học</h5>
                        </div>
                    </div>
                </a>

                <a href="/exam_list?action=list_exam&sj_id=2" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/sach-hay-ve-vat-ly-cover-780x470.png" style="height: 180px" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Vật Lý</h5>

                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=10" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/500-mau-cau-tieng-anh-giao-tiep-hay-dung-nhat-phan-1.png"
                             style="height: 180px" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Tiếng Anh</h5>
                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=10" class="col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/quy-dinh-thi-bang-lai-xe-may.png" style="height: 180px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Thi Bằng Lái Xe</h5>

                        </div>
                    </div>
                </a>
                <a href="/exam_list?action=list_exam&sj_id=10" class=" col-6">
                    <div class="card card_mg">
                        <img class="card-img-top" src="../static/img/post-thumb-ngon-ngu-lap-trinh.png" style="height: 180px"
                             alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Ngôn Ngữ Lập Trình</h5>
                        </div>
                    </div>
                </a>
            </div>

        </div>
        <div class="col-3 col-md-3">
            <div class="honour">
                <div class="gold_pound">
                    <c:set var="role" scope="session" value="${sessionScope.account.idRole}"/>
                    <i class="fa-solid fa-user"></i>
                    <c:choose>
                        <c:when test="${role == 1}">
                            <p>Quản lý</p>
                        </c:when>
                        <c:when test="${role == 2}">
                            <p>Thành viên</p>
                        </c:when>
                        <c:otherwise>
                            <p>Khách</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="user_log">
                    <div class="div_cus">
                        <c:if test="${sessionScope.account == null}">
                            <a class="div_cus-link" href="/user/DangNhapDangKi.jsp" style="text-decoration: none; color: black">
                                <i class="fa-solid fa-arrow-right-to-bracket"></i>
                                <p>Đăng nhập</p>
                            </a>
                        </c:if>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <c:if test="${sessionScope.account != null}">
                                    <span> Chào bạn ${sessionScope.user.name}</span>
                                </c:if>
                                <c:if test="${sessionScope.account == null}">
                                    <span>Chào khách</span>
                                </c:if>
                            </li>
                            <c:if test="${sessionScope.account != null}">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <form action="/userServlet" method="post">
                                    <input type="hidden" name="action" value="infoUser">
                                    <input type="hidden" name="index" value="">
                                    <input type="hidden" name="check" value="">
                                    <input type="hidden" name="idUser" value="${sessionScope.user.userId}">

                                        <button class="btn_info" type="submit">
                                            <i class="fa-solid fa-gear"></i>
                                            <span>Cài đặt thông tin</span>
                                        </button>


                                </form>

                            </li>
                            </c:if>
                            <li class="btn_logout">
                                <c:if test="${sessionScope.account != null}">
                                    <button type="submit" class="btn-logout">
                                        <a href="/userServlet?action=logout">Đăng xuất</a>
                                    </button>
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="user_log">
                    <div class="div_thongke">
                        <div class="div_cus-link"  style="text-decoration: none; color: black">
                            <i class="fa-solid fa-user-group"></i>
                            <p>Thống kê thành viên</p>
                        </div>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Tổng Thành Viên
                                <span class="badge badge-primary badge-pill">${memberList2.size()}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Mới Nhất
                                <span class="badge badge-primary badge-pill">${newMember.name}</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="user_log">
                    <div class="div_timkiem">
                        <div class="search_lable">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <p>Tìm kiếm</p>
                        </div>
                        <div class="search_b">
                            <form action="/exam_list" method="get">
                                <input type="hidden" name="action" value="sa">
                            <input class="search_input" type="text" name="search" placeholder="Nhập...">
                            <button class="btn_search"type="submit" class="btn-success">Tìm</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<jsp:include page="/view/footer.jsp"/>
<jsp:include page="/view/messenger.jsp"/>
</body>
</html>
