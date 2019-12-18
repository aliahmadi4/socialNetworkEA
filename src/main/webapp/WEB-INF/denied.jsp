<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="layout/head.jsp"/>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>


   <h1><spring:message code="denied.title" text="ACCESS DENIED"/> </h1>
</body>
</html>