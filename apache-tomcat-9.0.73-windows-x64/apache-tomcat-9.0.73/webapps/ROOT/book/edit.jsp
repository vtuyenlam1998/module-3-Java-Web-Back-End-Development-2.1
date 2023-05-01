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
    <title>Edit book</title>
</head>
<body>
<p>
    <a href="/home">Back to book list</a>
</p>
<center>
    <h1>Book Management</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
</center>
<div align="center">
    <form method="post">
        <fieldset>
            <legend>Book information</legend>
            <table border="1" cellpadding="5">
                <caption>
                    <h2>Edit book</h2>
                </caption>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" id="name" value="${requestScope["book"].getName()}"></td>
                </tr>
                <tr>
                    <td>Type: </td>
                    <td><input type="text" name="type" id="type" value="${requestScope["book"].getType()}"></td>
                </tr>
                <tr>
                    <td>Year: </td>
                    <td><input type="date" name="year" id="year" value="${requestScope["book"].getYear()}"></td>
                </tr>
                <tr>
                    <td>Detail: </td>
                    <td><input type="text" name="detail" id="detail" value="${requestScope["book"].getDetail()}"></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" id="price" value="${requestScope["book"].getPrice()}"></td>
                </tr>
                <tr>
                    <td>Quantity: </td>
                    <td><input type="text" name="quantity" id="quantity" value="${requestScope["book"].getQuantity()}"></td>
                </tr>
                <tr>
                    <td>Img: </td>
                    <td><input type="text" name="img" id="img" value="${requestScope["book"].getImg()}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Update book" name="submit">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<div></div>
</body>
</html>
