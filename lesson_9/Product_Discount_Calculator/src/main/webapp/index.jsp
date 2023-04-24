<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>Product Discount Calculator</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<h2><%= "Product Discount Calculator" %>
</h2>
<form action="/display-discount" method="post">
    <label>Product Description: <br><input type="text" placeholder="Mô tả của sản phẩm" name="detail" value="quần xì"></label><br/>
    <label>List Price: <br><input type="text" placeholder="Giá niêm yết của sản phẩm" name="price" value="20000"></label><br/>
    <label>Discount Percent(%): <br><input type="text" placeholder="Tỷ lệ chiết khấu (phần trăm)" name="discount" value="15"></label><br/>
    <input type="submit" value="Calculate Discount" id="submit"><br/>
</form>
</body>
</html>