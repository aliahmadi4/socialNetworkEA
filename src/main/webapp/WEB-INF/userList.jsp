<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout/head.jsp"/>
    <style type="text/css">
        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }

        .tablecell {
            padding: 16px;
            font-size: 16px;
            border: none;
        }

        .tableheadercell {
            padding: 16px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            text-align: center;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            border-radius: 5px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="layout/navbar.jsp"/>
    <div class="container">
        <div class="tableheadercell">
            <h1><spring:message code="UserList.header"/>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-md-center table-dark tableheadercell">
            <div class="col-lg-3 no-pdd">
                <spring:message code="UserList.username"/>
            </div>
            <div class="col-lg-2 no-pdd">
                <spring:message code="UserList.Enabled"/>
            </div>
            <div class="col-lg-2 no-pdd">
                <spring:message code="UserList.Role"/>
            </div>
            <div class="col-lg-2 no-pdd"></div>
        </div>
        <form:form modelAttribute="userList" method="post">
            <c:forEach var="user" items="${userList}" varStatus="userIndex">
                <div class="row justify-content-md-center table-bordered" id="${userIndex.index}">
                    <div class="col-lg-3 no-pdd tablecell">
                            ${user.username} (${user.profile.firstName} ${user.profile.lastName})
                    </div>
                    <div class="col-lg-2 no-pdd tablecell">
                        <c:choose>
                            <c:when test="${user.enabled==true}">
                                <span id="${user.id}-CurrentEnabled">
                                    <c:out value="Yes"/>
                                </span> (<a href="javascript:;" class="toggleUser" data-id="${user.id}"
                                id="${user.id}-Enable">
                                <spring:message code="UserList.Disable"/>
                                </a>)
                            </c:when>
                            <c:otherwise>
                                <span id="${user.id}-CurrentEnabled">
                                    <c:out value="No"/>
                                </span> (<a href="javascript:;" class="toggleUser" data-id="${user.id}"
                                id="${user.id}-Enable">
                                <spring:message code="UserList.Enable"/>
                                </a>)
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-lg-2 no-pdd tablecell" id="${user.id}-CurrentRole">
                        <c:choose>
                            <c:when test="${user.role=='ROLE_ADMIN'}">
                                <spring:message code="UserList.SetAdmin"/>
                            </c:when>
                            <c:when test="${user.role=='ROLE_CONTENT_MANAGER'}">
                                <spring:message code="UserList.SetContentManager"/>
                            </c:when>
                            <c:when test="${user.role=='ROLE_MARKETING_MANAGER'}">
                                <spring:message code="UserList.SetMarketingManager"/>
                            </c:when>
                            <c:otherwise>
                                <spring:message code="UserList.SetUser"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="dropdown col-lg-2 no-pdd">
                        <button class="dropbtn"><spring:message code="UserList.SetRole"/></button>
                        <div class="dropdown-content">
                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                               data-role="ROLE_ADMIN">
                                <spring:message code="UserList.SetAdmin"/>
                            </a>
                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                               data-role="ROLE_CONTENT_MANAGER">
                                <spring:message code="UserList.SetContentManager"/>
                            </a>
                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                               data-role="ROLE_MARKETING_MANAGER">
                                <spring:message code="UserList.SetMarketingManager"/>
                            </a>
                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                               data-role="ROLE_USER">
                                <spring:message code="UserList.SetUser"/>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </form:form>
    </div>
</div><!--theme-layout end-->
<jsp:include page="layout/footerScript.jsp"/>
</body>
<script type="text/javascript" src="/js/postAndUserManagement_Aser.js"></script>
</html>