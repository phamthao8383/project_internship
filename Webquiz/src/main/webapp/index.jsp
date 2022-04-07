<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
    <script src="/static/js/bootstrap.bundle.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/static/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="/static/css/Trangchu.css">


</head>
<body>
<div class="header">
    <div class="banner">
        <img src="static/img/logoQuizgym.PNG" height="200px">
    </div>
    <ul class="navbar__item-list">
        <li class="navbar__item-sectors">
            <a href="#">
                <img src="../static/img/home-icon.png" height="25px" width="25px"/>
                Home
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <img src="../static/img/Books-2-icon.png" height="25px" width="25px"/>
                Khối A
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <img src="../static/img/Books-2-icon.png" height="25px" width="25px"/>
                Khối B
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <img src="../static/img/Books-2-icon.png" height="25px" width="25px"/>
                Khối C
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <img src="../static/img/Books-2-icon.png" height="25px" width="25px"/>
                Bài TEST
            </a>
            <c:if test="${sessionScope.account.idRole == 1}">
                <a href="/admin/index.jsp">
                    <img src="../static/img/Network-Globe-Disconnected-icon.png" height="25px" width="25px"/>
                    Manage
                </a>
            </c:if>
        </li>
        <li class="navbar__item-sectors">
            <c:if test="${sessionScope.account.idRole == 1}">
                <a href="/admin/index.jsp">
                    <img src="../static/img/Network-Globe-Disconnected-icon.png" height="25px" width="25px"/>
                    Manage
                </a>
            </c:if>
        </li>
    </ul>
</div>
<div class="row">
    <div class="left_main col-3 col-md-3">
        <div class="gold_pound">
            <img src="../static/img/like-2-icon.png" height="20px" width="20px"/>
            Vinh danh bảng vàng
        </div>
        <div class="div_group">
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Cras justo odio
                    <span class="badge badge-primary badge-pill">14</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Dapibus ac facilisis in
                    <span class="badge badge-primary badge-pill">2</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Morbi leo risus
                    <span class="badge badge-primary badge-pill">1</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Morbi leo risus
                    <span class="badge badge-primary badge-pill">1</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Morbi leo risus
                    <span class="badge badge-primary badge-pill">1</span>
                </li>
            </ul>
        </div>
        <div class="call_sp">
            Hỗ trợ trực tuyến
            <div class="div_group_call">
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        ONLINE
                        <span class="badge badge-primary badge-pill">Slack</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        HOTLINE
                        <span class="badge badge-primary badge-pill">112221122</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        MESSENGER
                        <span class="badge badge-primary badge-pill"></span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row col-6 col-md-6">
        <div class="col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/Thiết-kế-không-tên-1-1.png" style="height: 180px" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Toán Học</h5>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/vai-tro-cua-hoa-hoc-lop-8_3.png" style="height: 180px"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Hóa Học</h5>
                </div>
            </div>
        </div>

        <div class=" col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/sach-hay-ve-vat-ly-cover-780x470.png" style="height: 180px" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Vật Lý</h5>

                </div>
            </div>
        </div>
        <div class=" col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/500-mau-cau-tieng-anh-giao-tiep-hay-dung-nhat-phan-1.png"
                     style="height: 180px" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Tiếng Anh</h5>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/quy-dinh-thi-bang-lai-xe-may.png" style="height: 180px"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Thi Bằng Lái Xe</h5>

                </div>
            </div>
        </div>
        <div class=" col-6">
            <div class="card card_mg">
                <img class="card-img-top" src="../static/img/post-thumb-ngon-ngu-lap-trinh.png" style="height: 180px"
                     alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Ngôn Ngữ Lập Trình</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="right_main col-3 col-md-3">
        <div class="customer">
            <img src="../static/img/like-2-icon.png" height="20px" width="20px"/>
            <c:set var="role" scope="session" value="${sessionScope.account.idRole}"/>
            <c:choose>
                <c:when test="${role == 1}">
                    <b>ADMIN</b>
                </c:when>
                <c:when test="${role == 2}">
                    <b>Customers</b>
                </c:when>
                <c:otherwise>
                    <b>Khách </b>
                </c:otherwise>
            </c:choose>
            <div class="div_cus">
                <c:if test="${sessionScope.account == null}">
                    <a href="/DangNhapDangKi.jsp" style="text-decoration: none; color: black">
                        <img src="../static/img/User-Interface-Login-icon.png" height="20px" width="20px"/>
                        Login
                    </a>
                </c:if>
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <c:if test="${sessionScope.account != null}">
                            <span> Chào bạn ${sessionScope.account.username}</span>
                        </c:if>
                        <c:if test="${sessionScope.account == null}">
                            <span>Chào khách</span>
                        </c:if>
                        <span class="badge badge-primary badge-pill"></span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Dapibus ac facilisis in
                        <span class="badge badge-primary badge-pill"></span>

                    </li>
                    <li class="btn_logout">
                        <c:if test="${sessionScope.account != null}">
                            <button type="submit" class="btn-warning">
                                <a href="/userServlet?action=logout">Logout</a>
                            </button>
                        </c:if>
                    </li>
                </ul>
            </div>
            <div class="div_thongke">
                <img src="../static/img/user-icon.png" height="20px" width="20px"/>
                THỐNG KÊ THÀNH VIÊN
                <ul class="list-group">
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Tổng Thành Viên
                        <span class="badge badge-primary badge-pill"> 5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        Mới Nhất
                        <span class="badge badge-primary badge-pill">Cypher</span>
                    </li>
                </ul>
            </div>
            <div class="div_timkiem">
                <div class="icon_search">
                    <img src="../static/img/zoom-search-2-icon.png" height="20px" width="20px"/>
                    <label class="s"> Search</label>
                </div>
                <div class="search_b">
                    <input class="b_block" type="text" placeholder="Search">
                    <button class="b_block" onclick="show()" type="submit" class="btn-success"> Search</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <!-- Footer -->
    <footer class="bg-dark text-center text-white">
        <!-- Grid container -->
        <div class="container p-4">
            <!-- Section: Social media -->
            <section class="mb-4">
                <!-- Facebook -->
                <a class="btn btn-outline-light btn-floating m-1" href="" role="button"
                ><i class="fab fa-facebook-f"></i
                ></a>

                <!-- Twitter -->
                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                ><i class="fab fa-twitter"></i
                ></a>

                <!-- Google -->
                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                ><i class="fab fa-google"></i
                ></a>

                <!-- Instagram -->
                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                ><i class="fab fa-instagram"></i
                ></a>

                <!-- Linkedin -->
                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                ><i class="fab fa-linkedin-in"></i
                ></a>

                <!-- Github -->
                <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button"
                ><i class="fab fa-github"></i
                ></a>
            </section>
            <!-- Section: Social media -->

            <!-- Section: Form -->
            <section class="">
                <form action="">
                    <!--Grid row-->
                    <div class="row d-flex justify-content-center">
                        <!--Grid column-->
                        <div class="col-auto">
                            <p class="pt-2">
                                <strong>Sign up for our newsletter</strong>
                            </p>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-5 col-12">
                            <!-- Email input -->
                            <div class="form-outline form-white mb-4">
                                <input type="email" id="form5Example21" class="form-control"/>
                                <label class="form-label" for="form5Example21">Email address</label>
                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-auto">
                            <!-- Submit button -->
                            <button type="submit" class="btn btn-outline-light mb-4">
                                Subscribe
                            </button>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </form>
            </section>
            <!-- Section: Form -->

            <!-- Section: Text -->
            <section class="mb-4">
                <p>
                    TRẮC NGHIỆM THÔNG MINH
                </p>
            </section>
            <!-- Section: Text -->

            <!-- Section: Links -->
            <section class="">
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">THI THPT QG</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-white">TOÁN-VĂN-ANH</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">LÝ-HÓA-SINH</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">SỬ-ĐỊA-CÔNG DÂN</a>
                            </li>

                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">ĐỀ KIỂM TRA</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-white">ĐỀ THI HK1,HK2</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">KIỂM TRA 1 TIẾT</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">KIỂM TRA 15 PHÚT</a>
                            </li>

                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">IT TEST</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-white">JAVA</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">C++</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">CƠ SỞ DỮ LIỆU</a>
                            </li>

                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">HƯỚNG NGHIỆP</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-white">BẰNG LÁI XE MÁY</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">BÀI LÁI Ô TÔ</a>
                            </li>
                            <li>
                                <a href="#!" class="text-white">THI CÔNG VIÊN CHỨC</a>
                            </li>

                        </ul>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </section>
            <!-- Section: Links -->
        </div>
        <!-- Grid container -->
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2022 Copyright:
            <a class="text-white" href="https://mdbootstrap.com/">Nhóm 2</a>
        </div>
    </footer>
</div>

<script>
    function show() {
        document.getElementById("footer").style.display = "block";
    }
</script>
</body>
</html>
