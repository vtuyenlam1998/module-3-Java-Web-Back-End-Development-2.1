<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/20/2023
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>CREAD - Thế giới sách kỳ diệu, có một không hai, xem hoài không chán</title>
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
        img {
            width: 6em;
        }

        body {
            background-color: #DBCDB9;
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
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
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
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
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
            box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5),
            7px 7px 20px 0px rgba(0, 0, 0, .1),
            4px 4px 5px 0px rgba(0, 0, 0, .1);
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

        .ml-2-btn {
            margin-left: 0.5rem;
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
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                       name="search">
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
<nav class="row">
    <div id="carouselExampleCrossfade" class="carousel slide carousel-fade " data-mdb-ride="carousel">
        <div class="carousel-indicators">
            <button
                    type="button"
                    data-mdb-target="#carouselExampleCrossfade"
                    data-mdb-slide-to="0"
                    class="active"
                    aria-current="true"
                    aria-label="Slide 1"
            ></button>
            <button
                    type="button"
                    data-mdb-target="#carouselExampleCrossfade"
                    data-mdb-slide-to="1"
                    aria-label="Slide 2"
            ></button>
            <button
                    type="button"
                    data-mdb-target="#carouselExampleCrossfade"
                    data-mdb-slide-to="2"
                    aria-label="Slide 3"
            ></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-mdb-interval="3000">
                <a href="/home?action=show&id=9">
                    <img src="https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/Review-sach-Bach-Da-Hanh-Higashino-Keigo.png?alt=media&token=6f3d5c91-5f49-4c11-abc4-822a43ee000c"
                         class="d-block w-100" alt="bạch dạ hành"/>
                </a>

            </div>
            <div class="carousel-item" data-mdb-interval="3000">
                <a href="/?action=show&id=14">
                    <img src="https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/e8bc99a8770e4adfe6ad95c870d57ea8%20(2).jpg?alt=media&token=b54f7337-3110-4a9f-85d0-293f32933689"
                         class="d-block w-100" alt="trọn bộ sách tiếng anh "/>
                </a>
            </div>
            <div class="carousel-item" data-mdb-interval="3000">
                <a href="/?action=show&id=10">
                    <img src="https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/sach-cua-stephen-king-cc1.jpg?alt=media&token=17a3b2e5-a39f-48f5-bb91-847e55f3e89d"
                         class="d-block w-100" alt="IT 2"/>
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCrossfade"
                data-mdb-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCrossfade"
                data-mdb-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</nav>
<main class="d-incline-flex">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:if test="${sessionScope['bookList'] != null}">
            <c:forEach items="${sessionScope['bookList']}" var="book">
                <form action="/show" method="get">
                    <div class="col">
                        <div class="card mt-5" style="height: 90vh;background-color: #F0E0CA">
                            <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
                                <img src="${book.getImg()}" class="img-fluid card-img-top" alt="Skyscrapers"/>
                                <input type="hidden" name="id" value="${book.getId()}">
                                <button>
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                </button>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${book.getName()}"/></h5>
                                <p class="card-text">
                                    This is a wider card with supporting text below as a natural lead-in to
                                    additional content. This content is a little bit longer.
                                </p>
                                <button class="btn btn-primary">Đọc thêm</button>
                            </div>
                            <div class="card-footer">
                                <big class="text-muted price fw-bold" style="float: right">
                                    <fmt:formatNumber value="${book.getPrice()}" type="currency"/>
                                </big>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </c:if>
    </div>
</main>
<footer style="background-color: #F0E0CA;" class="text-center p-4 border border-dark">
    <div class="d-flex col-12 justify-content-center fw-bold" style="font-size: 20px">
        <p>
            <c:if test='${requestScope["message"] != null}'>
                <span class="message">${requestScope["message"]}</span>
            </c:if>
        </p>
    </div>
    <div class="d-flex col-12 justify-content-center fw-bold" style="font-size: 20px">
        <form method="get" action="/add">
            <button>Add new book</button>
        </form>
    </div>
</footer>

<%--    </div>--%>
<%--    <div align="center">--%>
<%--        <table border="1" cellpadding="5">--%>
<%--            <caption><h2>List of Books</h2></caption>--%>
<%--            <tr>--%>
<%--                <th>ID</th>--%>
<%--                <th>Name</th>--%>
<%--                <th>Type</th>--%>
<%--                <th>Year</th>--%>
<%--                <th>Detail</th>--%>
<%--                <th>Price</th>--%>
<%--                <th>Quantity</th>--%>
<%--                <th>Img</th>--%>
<%--                <th>Actions</th>--%>
<%--            </tr>--%>
<%--            &lt;%&ndash;        <c:forEach items='${requestScope["bookList"]}' var="book">&ndash;%&gt;--%>
<%--            <c:forEach items='${bookList}' var="book">--%>
<%--                <tr>--%>
<%--                    <td><c:out value="${book.id}"/></td>--%>
<%--                    <td><c:out value="${book.name}"/></td>--%>
<%--                    <td><c:out value="${book.type}"/></td>--%>
<%--                    <td><c:out value="${book.year}"/></td>--%>
<%--                    <td><c:out value="${book.detail}"/></td>--%>
<%--                    <td><c:out value="${book.price}"/></td>--%>
<%--                    <td><c:out value="${book.quantity}"/></td>--%>
<%--                        &lt;%&ndash;                <td><c:out value="${book.img}"/></td>&ndash;%&gt;--%>
<%--                    <td><img src="${book.img}" alt="bìa sách"></td>--%>
<%--                    <td>--%>
<%--                        <a href="/books?action=edit&id=${book.id}">Edit</a>--%>
<%--                        <a href="/books?action=delete&id=${book.id}">Delete</a>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>
<%--    </div>--%>
</body>
</html>
