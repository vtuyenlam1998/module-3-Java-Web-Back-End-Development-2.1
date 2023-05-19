<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 5/4/2023
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Giỏ hàng</title>
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
<h1>Shopping Cart</h1>
<p style="text-decoration: underline">
    <a href="/home">
        < Back to Products
    </a>
</p>
<form>
    <table>
        <tr>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
        </tr>
        <c:if test="${sessionScope['productCart'] != null}">
            <c:forEach items="${sessionScope['productCart']}" var="cart">
                <tr>
<%--                    <td><c:out value="${cart.getName()}"/> }</td>--%>
                    <td></td>
<%--                    <td><c:out value="${cart.getPrice()}"/> }</td>--%>
<%--                    <td><c:out value="${cart.getPrice()*cart.getQuantity()}"/> }</td>--%>
                </tr>
            </c:forEach>
        </c:if>
        <tr>
            <td colspan="3"></td>
            <td>Total: </td>
        </tr>
    </table>
    <button class="btn btn-primary">Update Cart</button>
</form>
</body>
</html>
