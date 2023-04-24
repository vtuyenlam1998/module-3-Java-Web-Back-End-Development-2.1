<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/20/2023
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book Management Application</title>
    <style>
        img{
            width: 6em;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1>Book Management</h1>
    <h2>
        <a href="/books?action=add">Add new book</a>
    </h2>
</div>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Books</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Year</th>
            <th>Detail</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Img</th>
            <th>Actions</th>
        </tr>
<%--        <c:forEach items='${requestScope["bookList"]}' var="book">--%>
        <c:forEach items='${bookList}' var="book">
            <tr>
                <td><c:out value="${book.id}"/></td>
                <td><c:out value="${book.name}"/></td>
                <td><c:out value="${book.type}"/></td>
                <td><c:out value="${book.year}"/></td>
                <td><c:out value="${book.detail}"/></td>
                <td><c:out value="${book.price}"/></td>
                <td><c:out value="${book.quantity}"/></td>
<%--                <td><c:out value="${book.img}"/></td>--%>
                <td><img src="${book.img}" alt="bìa sách"></td>
                <td>
                    <a href="/books?action=edit&id=${book.id}">Edit</a>
                    <a href="/books?action=delete&id=${book.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
