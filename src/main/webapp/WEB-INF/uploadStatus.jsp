<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="layout/head.jsp"/>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>

<h1><spring:message code="upload.title" text="Spring Boot - Upload Status" /> </h1>

<div th:if="${message}">
    <h2 th:text="${message}"/>
</div>


</body>
</html>