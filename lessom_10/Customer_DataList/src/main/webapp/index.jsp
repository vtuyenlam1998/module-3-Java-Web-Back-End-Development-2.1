<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Datalist</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
          integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
    <style>
        img {
            width: 6em;
            background-repeat: no-repeat;
        }

        table {
            border-collapse: separate;
            width: 80%;
            border: 10px solid aqua;
        }

        th {
            font-size: 2em;
            background-color: #4CAF50;
            color: white;
        }

        td, th {
            padding: 1em 0.5em 1em 0.5em;
        }

        td {
            font-size: 1em;
        }

        table, td, th {
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }
    </style>
</head>
<body>
<table class="table table-hover">
    <tr>
        <th colspan="4" style="text-align: center;font-size: 3em"><%= "Danh sách khách hàng" %>
        </th>
    </tr>
    <tr>
        <th><c:out value="${'Tên'}"/><i class="bi bi-bell-slash-fill text-danger"></i></th>
        <th><c:out value="${'Ngày sinh'}"/></th>
        <th><c:out value="${'Địa chỉ'}"/></th>
        <th><c:out value="${'Ảnh'}"/></th>
    </tr>
    <tr>
        <td><c:set var="name" scope="request" value="Mai Văn Hoàn"/><c:out value="${name}"/></td>
        <td>20-08-1983</td>
        <td>Hà Nội</td>
        <td><img src="https://flxt.tmsimg.com/assets/p20044162_i_v13_aa.jpg" alt="brunhilde"></td>
    </tr>
    <tr>
        <td><c:set var="name" scope="request" value="Nguyễn Văn Nam"/><c:out value="${name}"/></td>
        <td>21-08-1983</td>

        <c:choose>
            <c:when test="${param.color=='red'}">
                <td style="color:red;">Bắc Giang</td>
            </c:when>
            <c:when test="${param.color=='blue'}">
                <td style="color:blue;">Bắc Giang</td>
            </c:when>
            <c:when test="${param.color=='yellow'}">
                <td style="color:yellow;"></td>
            </c:when>
            <c:otherwise>
                <td style="color: #4CAF50">Bắc Giang</td>
            </c:otherwise>
        </c:choose>

        <td><img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg1td74qgh_xB6tGN996qX4L-7e2L45R9tZA&usqp=CAU"
                alt="buddha"></td>
    </tr>
    <tr>
        <td><c:set var="name" scope="request" value="Nguyễn Thái Hòa"/><c:out value="${name}"/></td>
        <td>22-08-1983</td>
        <td><c:forEach var="i" begin="1" end="3"><c:out value="${'Nam Định '}${i}${' , '}"/></c:forEach></td>
        <td><img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPQ3butUN6K9uCE9wz5EnzAu1R4Ltjf0G9tA&usqp=CAU"
                alt="raiden"></td>
    </tr>
    <tr>
        <td><c:set var="name" scope="request" value="Trần Đăng Khoa"/><c:out value="${name}"/></td>
        <td>23-08-1983</td>
        <td><c:forTokens items="Hà,Tây,Hoa,Sơn,Luận,Kiếm" delims="," var="name"><c:out
                value="${name}"/></c:forTokens></td>
        <td><img
                src="https://hosonhanvat.vn/wp-content/uploads/2021/12/shuumatsu-no-valkyrie-tan-thuy-hoang-2_YINP.jpg"
                alt="Qin Shi Huang"></td>
    </tr>
</table>
</body>
</html>