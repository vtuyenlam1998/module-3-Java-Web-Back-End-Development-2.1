<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/28/2023
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Payment</title>
</head>
<body>
<form method="post" action="/editUser">
    <fieldset  class="d-incline-flex">
        <legend>Kiểm tra lại thông tin cá nhân</legend>
        <table border="1" cellpadding="5">
            <tr>
                <td><label for="name">FullName: </label></td>
                <td><input type="text" name="name" id="name" size="45" pattern="[a-zA-ZÀ-ỹ ]+" value="${user.fullName}"
                           title="letter allowed" required></td>
            </tr>
            <tr>
                <td><label for="phone">Số điện thoại: </label></td>
                <td><input type="text" name="phone" id="phone" size="45" value="${user.phoneNumber}" pattern="[0-9]+"
                           title="number only" required></td>
            </tr>
            <tr>
                <td><label for="address">Address: </label></td>
                <td><input type="text" name="address" id="address" size="45" value="${user.address}" title="letter and number allowed"></td>
            </tr>
            <tr>
                <input type="hidden" name="id" id="id" value="${user.getID()}">
            </tr>
            <tr>
                <td colspan="2">
                    Tôi xin thề trước tòa thông tin trên là đúng sự thật
                    <input type="submit" value="Xin thề">
                    <input type="reset" name="reset" value="Reset">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
<p><c:out value="${message}"/></p>
<p id="show"></p>
<button onclick="showQRCode()" type="button">Thanh toán</button>
<script>
    function showQRCode() {
        document.getElementById("show").innerHTML = `<center style="font-size: 20px"><img src="https://firebasestorage.googleapis.com/v0/b/lam-dep-trai-de1b4.appspot.com/o/qrcode_58038182_662ed4e32aef42f467c9d8616bb72e78.png?alt=media&token=f2be3e84-14a5-42f8-92bd-2c16caad6ea1"
        style="width: 30%"><br>Cám ơn đã sử dụng dịch vụ</center>`;
    }
</script>
</body>
</html>
