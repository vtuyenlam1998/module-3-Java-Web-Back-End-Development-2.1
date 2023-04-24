<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/20/2023
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<form method="get" action="product?action=search">
  <input type="text" name="search" id="search" placeholder="nhập tên sản phẩm">
  <input type="submit" name="submit" value="Tìm kiếm">
</form>
<p>
  <a href="/products?action=add">Add new product</a>
</p>
<table border="1">
  <tr>
    <td>Name</td>
    <td>Price</td>
    <td>Detail</td>
    <td>Producer</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach items='${requestScope["products"]}' var="product">
    <tr>
      <td><a href="products?action=view&id=${product.getId()}">${product.getName()}</a></td>
      <td>${product.getPrice()}</td>
      <td>${product.getDetail()}</td>
      <td>${product.getProducer()}</td>
      <td><a href="products?action=edit&id=${product.getId()}">edit</a></td>
      <td><a href="products?action=delete&id=${product.getId()}">delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
