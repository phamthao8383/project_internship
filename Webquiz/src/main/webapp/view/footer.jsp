<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/12/2022
  Time: 8:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script>
        var header = document.querySelector('.navbar__item-list');
        var origOffsetY = header.offsetTop;
        function onScroll(e) {
            window.scrollY >= origOffsetY ? header.classList.add('sticky') :
                header.classList.remove('sticky');
        }
        document.addEventListener('scroll', onScroll);
    </script>
</div>