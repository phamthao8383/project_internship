<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 4/12/2022
  Time: 8:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="banner">
        <div class="sologan">
            <h1>TRẮC NGHIỆM ONLINE</h1>
            <h4>ĐA DẠNG - THÔNG MINH - CHÍNH XÁC</h4>
        </div>
    </div>
    <ul class="navbar__item-list">
        <li class="navbar__item-sectors">
            <a href="/index.jsp">
                <i class="fa-solid fa-house"></i>
                Trang chủ
            </a>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối A
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list">
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Toán</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Vật Lý</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Hóa Học</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối B
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list">
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Toán</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Sinh Học</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Hóa Học</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối D
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list">
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Ngữ Văn</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Toán</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Tiếng Anh</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book-open"></i>
                Tin Học
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list">
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Tin Học Văn Phòng</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">Tin Đại Cương</a></li>
                    <li class="sector-detail__item"><a href="" class="sector-detail__item-link">IT</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <c:if test="${sessionScope.account.idRole == 1}">
                <a href="/admin/index.jsp">
                    <i class="fa-solid fa-link"></i>
                    Tới trang quản lý
                </a>
            </c:if>
        </li>
    </ul>
</div>
