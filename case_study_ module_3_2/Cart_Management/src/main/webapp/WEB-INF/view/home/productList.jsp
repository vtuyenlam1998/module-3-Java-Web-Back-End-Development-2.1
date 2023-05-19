<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 5/4/2023
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
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
</head>
<body>
<main class="d-incline-flex">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:if test="${sessionScope['productList'] != null}">
            <c:forEach items="${sessionScope['productList']}" var="product">
                <form action="/cart" method="post">
                    <div class="col">
                        <div class="card mt-5" style="height: 90vh;background-color: #F0E0CA">
                            <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
                                <img src="${product.getImage_url()}" class="img-fluid card-img-top" alt="Skyscrapers"/>
                                <input type="hidden" name="id" value="${product.getId()}">
                                <button>
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                </button>
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><c:out value="${product.getName()}"/></h5>
                                <p class="card-text">
                                    This is a wider card with supporting text below as a natural lead-in to
                                    additional content. This content is a little bit longer.
                                </p>
                                <button class="btn btn-primary">Buy Now</button>
                            </div>
                            <div class="card-footer">
                                <big class="text-muted price fw-bold" style="float: right">
                                    <fmt:formatNumber value="${product.getPrice()}" type="currency"/>
                                </big>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </c:if>
    </div>
</main>
</body>
</html>
