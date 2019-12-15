<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags/>
<html>
<head>

    <jsp:include page="layout/head.jsp"/>

<%--    <script type="text/javascript" src="js/postAndUserManagement_Aser.js"/>--%>
</head>
<body>
<div class="wrapper">
    <jsp:include page="layout/navbar.jsp"/>
    <div class="row">
        <div class="col-lg-6">
            <div class="cmp-info">
                <div class="cm-logo">
                    <img style="width: 200px; height: 200px" src="/images/logo.png" alt=""/>
                </div><!--cm-logo end-->

            </div><!--cmp-info end-->
        </div>
<%--        <div class="col-lg-12">--%>
            sdlfk
<%--            <form:form modelAttribute="userList" action="post" method="post">--%>
<%--                <h1><spring:message code="UserList.header"/></h1>--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-1 no-pdd"></div>--%>
<%--                    <div class="col-lg-2 no-pdd">--%>
<%--                        <spring:message code="UserList.username"/>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-1 no-pdd">--%>
<%--                        <spring:message code="UserList.Enabled"/>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-1 no-pdd"></div>--%>
<%--                    <div class="col-lg-1 no-pdd">--%>
<%--                        <spring:message code="UserList.Role"/>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-4 no-pdd">--%>
<%--                        <spring:message code="UserList.newRole"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                --%>
<%--                <c:forEach var="user" items="${userList}" varStatus="userIndex">--%>
<%--                    <div class="row" id="${userIndex.index}">--%>
<%--                        <div class="col-lg-1 no-pdd"></div>--%>
<%--                        <div class="col-lg-2 no-pdd">--%>
<%--                            Welcome, ${user.username} (${user.profile.firstName} ${user.profile.lastName})--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${user.enabled==true}">--%>
<%--                                    <c:out value="Yes"/>--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <c:out value="No"/>--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <a href="javascript:;" class="toggleUser" data-id="${user.id}"--%>
<%--                               id="${user.id}-CurrentEnabled">--%>
<%--                                <c:if test="${user.enabled==true}">--%>
<%--                                    <spring:message code="UserList.Disable"/>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${user.enabled==false}">--%>
<%--                                    <spring:message code="UserList.Enable"/>--%>
<%--                                </c:if>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd" id="${user.id}-CurrentRole">--%>
<%--                            <c:out value="${user.role}"/>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"--%>
<%--                               data-role="ROLE_ADMIN">--%>
<%--                                <spring:message code="UserList.SetAdmin"/>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"--%>
<%--                               data-role="ROLE_CONTENT_MANAGER">--%>
<%--                                <spring:message code="UserList.SetContentManager"/>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"--%>
<%--                               data-role="ROLE_MARKETING_MANAGER">--%>
<%--                                <spring:message code="UserList.SetMarketingManager"/>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-1 no-pdd">--%>
<%--                            <a href="javascript:;" class="setUserRole" data-id="${user.id}"--%>
<%--                               data-role="ROLE_USER">--%>
<%--                                <spring:message code="UserList.SetUser"/>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </form:form>--%>


<%--        </div>--%>
    </div>
</div><!--theme-layout end-->
<jsp:include page="layout/footerScript.jsp"/>
</body>
</html>
