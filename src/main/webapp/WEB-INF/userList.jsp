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
    <div class="container">
        <div class="pb-2 mt-4 mb-2 border-bottom">
            <h1><spring:message code="UserList.header"/>
        </div>
    </div>
    <div>
        <div class="row column-header">
            <div class="col-lg-2 no-pdd">
                <spring:message code="UserList.username"/>
            </div>
            <div class="col-lg-1 no-pdd">
                <spring:message code="UserList.Enabled"/>
            </div>
            <div class="col-lg-2 no-pdd">
                <spring:message code="UserList.Role"/>
            </div>
            <div class="col-lg-7 no-pdd">
                <spring:message code="UserList.newRole"/>
            </div>
        </div>
        <form:form modelAttribute="userList" action="post" method="post">
            <c:forEach var="user" items="${userList}" varStatus="userIndex">
                <div class="row" id="${userIndex.index}">
                    <div class="col-lg-2 no-pdd">
                            ${user.username} (${user.profile.firstName} ${user.profile.lastName})
                    </div>
                    <div class="col-lg-1 no-pdd">
                        <c:choose>
                            <c:when test="${user.enabled==true}">
                                <c:out value="Yes"/> | <a href="javascript:;" class="toggleUser" data-id="${user.id}"
                                                          id="${user.id}-CurrentEnabled">
                                <spring:message code="UserList.Disable"/>
                            </a>
                            </c:when>
                            <c:otherwise>
                                <c:out value="No"/> | <a href="javascript:;" class="toggleUser" data-id="${user.id}"
                                                         id="${user.id}-CurrentEnabled">
                                <spring:message code="UserList.Enable"/>
                            </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-lg-2 no-pdd" id="${user.id}-CurrentRole">
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
                    <div class="col-lg-1 no-pdd">
                        <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                           data-role="ROLE_ADMIN">
                            <spring:message code="UserList.SetAdmin"/>
                        </a>
                    </div>
                    <div class="col-lg-2 no-pdd">
                        <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                           data-role="ROLE_CONTENT_MANAGER">
                            <spring:message code="UserList.SetContentManager"/>
                        </a>
                    </div>
                    <div class="col-lg-2 no-pdd">
                        <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                           data-role="ROLE_MARKETING_MANAGER">
                            <spring:message code="UserList.SetMarketingManager"/>
                        </a>
                    </div>
                    <div class="col-lg-1 no-pdd">
                        <a href="javascript:;" class="setUserRole" data-id="${user.id}"
                           data-role="ROLE_USER">
                            <spring:message code="UserList.SetUser"/>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </form:form>
    </div>
</div><!--theme-layout end-->


<jsp:include page="layout/footerScript.jsp"/>
<script type="text/javascript" src="/js/postAndUserManagement_Aser.js"/>
</body>

<!-- Mirrored from gambolthemes.net/workwise-new/editProfile.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:26 GMT -->
</html>