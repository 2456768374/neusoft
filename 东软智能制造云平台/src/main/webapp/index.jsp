<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h2>Hello World!</h2>
<c:if test="${sessionScope.user!=null}">
    <h1>welcome,${sessionScope.user.createUserid},<a href="/user/logout.do">退出</a></h1>
</c:if>
<c:if test="${sessionScope.user==null}">
    <a href="login.html" class="btn-link"><h1>Login</h1></a>
</c:if>
<c:if test="${sessionScope.user==null}">
    <a href="register.html" class="btn-link"><h1>Register</h1></a>
</c:if>
<a href="test.html">test</a>
</body>
</html>
