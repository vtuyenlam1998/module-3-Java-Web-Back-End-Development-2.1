<%--
  Created by IntelliJ IDEA.
  User: defaultuser0
  Date: 4/25/2023
  Time: 11:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notify</title>
    <style>
      .notify{
        position: fixed;
        text-align: center;
      }
      button {
        position: absolute;
        font-size: 3rem;
      }
    </style>
</head>
<body>
<div class="notify">
  <p>Tạo tài khoản thành công,xin xác nhận qua email</p>
  <a href="/home"><input type="button" value="Quay về trang chủ" name="notify"></a>
</div>
</body>
</html>
