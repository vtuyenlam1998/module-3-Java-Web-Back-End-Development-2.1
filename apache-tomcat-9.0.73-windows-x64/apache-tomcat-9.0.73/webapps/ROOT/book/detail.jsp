<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/26/2023
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Mua sách <c:out value="${book.name}" /></title>
    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css"
            rel="stylesheet"
    />
    <!-- MDB -->
    <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"
    ></script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,200;1,300&display=swap");
        body {
            background-color: #DBCDB9;
        }
        .ml-2-btn {
            margin-left: 0.5rem;
        }
        .profile-pic {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            cursor: pointer;
        }
        .profile-container {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
        .profile-text-container {
            padding-top: 10px;
            margin: 0 10px;
        }
        /*button {*/
        /*    margin: 3px;*/
        /*}*/
        .custom-btn {
            width: 130px;
            height: 40px;
            color: #fff;
            border-radius: 10px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
        }
        .btn-15 {
            background: #7D22CF;
            border: none;
            z-index: 1;
        }
        .btn-15:after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            right: 0;
            z-index: -1;
            background-color: #6B1DB0;
            border-radius: 10px;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            transition: all 0.3s ease;
        }
        .btn-15:hover {
            color: #fff;
        }
        .btn-15:hover:after {
            left: 0;
            width: 100%;
        }
        .btn-15:active {
            top: 2px;
        }

        .btn-16 {
            background: #1089F5;
            border: none;
            z-index: 1;
        }
        .btn-16:after {
            position: absolute;
            content: "";
            width: 0;
            height: 100%;
            top: 0;
            right: 0;
            z-index: -1;
            background-color: #0E79D9;
            border-radius: 10px;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            transition: all 0.3s ease;
        }
        .btn-16:hover {
            color: #fff;
        }
        .btn-16:hover:after {
            left: 0;
            width: 100%;
        }
        .btn-16:active {
            top: 2px;
        }
    </style>
</head>
<body>
<header class="d-flex justify-content-between d-flex border border-dark">
    <div class="d-inline-flex p-2 align-items-center mb-3 pb-1">
            <i class="fas fa-book-open-reader fa-2x me-3" style="color: firebrick;"></i>
        <a href="/home">
            <span class="h1 fw-bold mb-0" style="color: #4E4E54">CREAD</span>
        </a>
    </div>
    <div class="d-inline-flex p-2">
        <nav class="navbar navbar-light">
            <form class="form-inline d-inline-flex p-2" method="post" action="/search">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn my-2 my-sm-0 ml-2-btn text-white" style="background-color: #6254D1" type="submit">
                    Search
                </button>
            </form>
        </nav>
    </div>
    <div class="profile-container">
        <div class="btn-group shadow-0" role="group" aria-label="Basic example">
            <c:choose>
                <c:when test="${sessionScope['user'] == null}">
                <form action="/signup" method="get">
                        <button class="custom-btn btn-15">Đăng ký</button>
                </form>
                <form action="/login" method="get">
                        <button class="custom-btn btn-16">Đăng nhập</button>
                </form>
                </c:when>
                <c:otherwise>
                    <img class="profile-pic"
                         src="${sessionScope["avatar"]}">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="profile-text-container d-flex justify-content-space-between">
            <a href="/cart" style="color: #ff6771">
                <i class="fas fa-cart-shopping"></i>
            </a>
            <form action="/logout" method="post">
                <button style="border: none;display: inline-flex;cursor: pointer">
                    <i class="fas fa-caret-down"></i>
                </button>
            </form>
        </div>
    </div>
</header>
<div class="container-fluid col-md-10 p-0 border border-dark">
    <main class="d-flex border border-dark">
        <aside class="d-inline-flex col-md-6 vh-100 border border-dark">
            <img src="${book.img}" alt="bìa sách" width="100%">
        </aside>
        <div class="d-inline-flex col-md-6 vh-100 border border-dark" style="background-color: white">
            <table class="col-10 table table-hover" style="font-size: 18px">
                <tr>
                    <th>Tên sách:</th>
                    <td><c:out value="${book.getName()}"/></td>
                </tr>
                <tr>
                    <th>Năm xuất bản:</th>
                    <td><c:out value="${book.year}"/></td>
                </tr>
                <tr>
                    <th>Nội dung:</th>
                    <td><c:out value="${book.detail}"/></td>
                </tr>
                <tr>
                    <th>Giá tiền:</th>
                    <td><fmt:formatNumber value="${book.price}" type="currency"/></td>
                </tr>
                <tr>
                    <th>Tình trạng:</th>
                    <td style="padding-top: 33px">
                        <c:choose>
                            <c:when test="${book.quantity != '0'}">
                                <span style="font-size: 18px" class="badge badge-success rounded-pill d-inline">Còn hàng</span>
                            </c:when>
                            <c:otherwise>
                                <span style="font-size: 18px" class="badge badge-danger rounded-pill d-inline">Hết hàng</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
    </main>
    <footer style="background-color: lightcyan;" class="text-center p-2 border border-dark">
        <div class="d-flex col-12 justify-content-center">
            <form method="get" action="/edit">
                <input type="hidden" name="id" value="${book.getId()}">
                <button>Edit book</button>
            </form>
            <form method="get" action="/delete">
                <input type="hidden" name="id" value="${book.getId()}">
                <button>Delete book</button>
            </form>
        </div>
        @Copyright2023
    </footer>
</div>
</body>
</html>
