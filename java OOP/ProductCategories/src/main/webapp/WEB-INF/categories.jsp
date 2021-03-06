<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
	<h1>${category.name}</h1>
	 <div>
        <h3>Categories:</h3>
        <ul>
            <c:forEach var = "product" items= "${ category.products }">
                <li>${ product.name }</li>
            </c:forEach>
        </ul>
    </div>
    <div id="choice">
        <form action="/category/${category.id}/add" method="POST">
            <select name="product" id="product">
                <c:forEach var = "product" items= "${ products }">
                    <c:if test="${!category.getProducts().contains(product)}">
                        <option value="${product.id}">${ product.name }</option>        
                    </c:if>
                </c:forEach>
            </select>
            <input type="submit" value="Add">
        </form>
        <a href="/category/new">Add a new Category</a>
        <a href="/product/new">Add a new Product</a>
    </div>
</body>
</html>