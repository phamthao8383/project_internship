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
            <a href="/">
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
                <ul class="sector-detail__list" style="padding: 0">
                    <li class="sector-detail__item">
                            <a  href="/exam_list?action=list_exam&sj_id=1"  class="sector-detail__item-link">Toán</a>
                    </li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=2"  class="sector-detail__item-link">Vật Lý</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=3"  class="sector-detail__item-link">Hóa Học</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối B
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=1" class="sector-detail__item-link">Toán</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=8" class="sector-detail__item-link">Sinh Học</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=3"  class="sector-detail__item-link">Hóa Học</a></li>
                </ul>
            </div>
        </li>

        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối C
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=9" class="sector-detail__item-link">Ngữ Văn</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=10" class="sector-detail__item-link">Lịch Sử</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=11"  class="sector-detail__item-link">Địa Lý</a></li>
                </ul>
            </div>
        </li>

        <li class="navbar__item-sectors">
            <a href="#">
                <i class="fa-solid fa-book"></i>
                Khối D
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list" style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=9"  class="sector-detail__item-link">Ngữ Văn</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=1"  class="sector-detail__item-link">Toán</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=7" class="sector-detail__item-link">Tiếng Anh</a></li>
                </ul>
            </div>
        </li>
        <li class="navbar__item-sectors">
            <a href="#" >
                <i class="fa-solid fa-book-open"></i>
                Tin Học
            </a>
            <div class="sector-detail">
                <ul class="sector-detail__list"  style="padding: 0">
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link">Tin Học Văn Phòng</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link">Tin Đại Cương</a></li>
                    <li class="sector-detail__item"><a href="/exam_list?action=list_exam&sj_id=6"  class="sector-detail__item-link">IT</a></li>
                </ul>
            </div>
        </li>
        <c:if test="${sessionScope.account.idRole == 1}">
            <li class="navbar__item-sectors">
                    <a href="/admin/index.jsp">
                        <i class="fa-solid fa-link"></i>
                        Tới trang quản lý
                    </a>
            </li>
        </c:if>
    </ul>
</div>
