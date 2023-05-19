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
    <title>Add new book</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<p style="float: left">
    <a href="/home">Back to book lists</a>
</p>
<center>
    <h1>Add new book</h1>
</center>
<div align="center">
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <form method="post">
        <fieldset>
            <legend>Book information</legend>
            <table border="1" cellpadding="5">
                <tr>
                    <td><label for="name">Name: </label></td>
                    <td><input type="text" name="name" id="name" size="45" title="letter and number allowed" required></td>
                </tr>
                <tr>
                    <td><label for="type">Type: </label></td>
                    <td><input type="text" name="type" id="type" size="45" pattern="[a-zA-ZÀ-ỹ ]+" title="letter only" required></td>
                </tr>
                <tr>
                    <td><label for="year">Year: </label></td>
<%--                    <td><input type="date" name="year" id="year" size="45"--%>
<%--                               pattern="[\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[12]\d|3[01])]" title="number only"></td>--%>
                    <td><input type="date" name="year" id="year" size="45" required></td>
                </tr>
                <tr>
                    <td><label for="detail">Detail: </label></td>
                    <td><input type="text" name="detail" id="detail" size="45" title="letter and number allowed"></td>
                </tr>
                <tr>
                    <td><label for="price">Price: </label></td>
                    <td><input type="text" name="price" id="price" size="45" pattern="[0-9]+" title="number only" required></td>
                </tr>
                <tr>
                    <td><label for="quantity">Quantity: </label></td>
                    <td><input type="text" name="quantity" id="quantity" size="45" pattern="[0-9]+" title="number only" required></td>
                </tr>
                <tr>
                    <td><label for="img">Img: </label></td>
                    <td><input type="text" name="img" id="img" size="45" title="url of image" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Add new book">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>
