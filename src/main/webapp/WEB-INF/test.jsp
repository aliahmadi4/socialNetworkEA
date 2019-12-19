<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout/head.jsp"/>
</head>


<body>

<div class="wrapper">

    <jsp:include page="layout/navbar.jsp"/>




        <form:form method="post" action="/profile" modelAttribute="profile">


        <div class="cp-field">
            <h5>First Name</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="firstName" id="firstName" value="${profile.firstName}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>Last Name</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="lastName" id="lastName" value="${profile.lastName}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>Occupation</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="occupation" id="occupation" value="${profile.occupation}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>Email</h5>
            <div class="cpp-fiel">
                <form:input type="email" path="email" id="email" value="${profile.email}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>Country</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="address.country" id="country" value="${profile.address.country}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>State</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="address.state" id="state" value="${profile.address.state}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>
        <div class="cp-field">
            <h5>City</h5>
            <div class="cpp-fiel">
                <form:input type="text" path="address.city" id="city" value="${profile.address.city}" />
                <i class="fa fa-lock"></i>
            </div>
        </div>

        <div class="save-stngs pd2">
            <ul>
                <li>
                    <button type="submit" id="saveInfo"><spring:message code="editProfile.save" text="Save" />  </button>
                </li>

            </ul>
        </div><!--save-stngs end-->

        </form:form>




<jsp:include page="layout/footerScript.jsp"/>

</body>

</html>