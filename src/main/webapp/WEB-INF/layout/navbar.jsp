    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <header>
            <div id="language" style="margin-top: 25px; margin-left: 20px; float: left">
                <a href="?lang=en_US" style="color: white;"><spring:message code="login.lang.en" text="English" /></a> |
                <a href="?lang=spa" style="color: white"><spring:message code="login.lang.spa" text="Spanish" /></a>
            </div>
        <div class="container">
        <div class="header-data">
        <div class="logo">
        <a href="<c:url value='/'/>" ><img src="<c:url value='/images/logo.png'/>" alt=""></a>
        </div><!--logo end-->
        <div class="search-bar">
        <form method="get" action="/post/search">
            <spring:message code="navebar.search" text="Search" var="search"/>
        <input type="text" name="search" placeholder="${search}">
        <button type="submit"><i class="la la-search"></i></button>
        </form>
        </div><!--search-bar end-->

        <nav>
        <ul>

        <li>
        <a href="<c:url value='/'/>" title="">
        <span><img src="<c:url value='/images'/>/icon1.png" alt=""></span>
        <spring:message code="navebar.home" text="Home"/>
        </a>
        </li>

        <li>
        <a href="<c:url value='/profileList'/>" title="">
        <span><img src="<c:url value='/images'/>/icon4.png" alt=""></span>
        <spring:message code="navebar.users" text="Users"/>
        </a>
        </li>
        <c:if test="${notifications.size() > 0}">
        <li>
        <a class="not-box-open" href="javascript:;" title="">
        <span><img src="<c:url value='/images'/>/icon7.png" alt=""></span>
        <spring:message code="navebar.notification" text="Notification"/>
        </a>

        <div class="notification-box noti" id="notification" style="border-bottom: 4px solid #e44d3a">
            <c:forEach items="${notifications}" var="item">
            <div class="nott-list">
                <div class="notfication-details">
                    <div class="notification-info">
                        <h3 style="width: 100%;"><a href="/profile/${item.post.user.id}?scrollTo=${item.post.id}" title="" style="text-transform: capitalize;">${item.post.user.profile.firstName} ${item.post.user.profile.lastName}</a> has a new post submitted just now. <br><br></h3>
                        <span style="left: 10px;">${item.creationDate}</span>
                    </div>
                <!--notification-info -->
                </div>
            </div>
            </c:forEach>
            <!--nott-list end-->
        </div>

        <!--notification-box end-->
        </li>
        </c:if>

        <li>
        <a href="<c:url value='/profile/${currentUser.id}'/>" title="">
        <span><img src="<c:url value='/images'/>/icon4.png" alt=""></span>
        <spring:message code="navebar.profile" text="Profile"/>
        </a>

        </li>

        <security:authorize access="hasRole('ADMIN')">
            <li>
            <a href ="<c:url value='/admin/deactivatedUsers'/>">
            <spring:message code="navbar.deactivatedUsers"/>
            </a>
            </li>

            <li>
            <a href="<c:url value='/admin/manageUserRoles'/>">
            <spring:message code="navbar.manageRoles"/>
            </a>
            </li>
        </security:authorize>
        <security:authorize access="hasAnyRole('ADMIN','CONTENT_MANAGER')">
            <li>
            <a href="<c:url value='/admin/unhealthyPosts'/>">
            <spring:message code="navbar.unhealthyPosts"/>
            </a>
            </li>
            <li>
            <a href="<c:url value='/unhealthyWords/'/>">
            <spring:message code="navbar.unhealthyWords"/>
            </a>
            </li>
        </security:authorize>

        <%--        <c:if test="${loginedUser.role.equals('ROLE_ADMIN')}">--%>
        <%--            <li>--%>
        <%--            <a href="<c:url value='/admin'/>" title="">--%>
        <%--            <span><img src="<c:url value='/images'/>/icon4.png" alt=""></span>--%>
        <%--            Manage--%>
        <%--            </a>--%>
        <%--            </li>--%>
        <%--        </c:if>--%>


        </ul>
        </nav><!--nav end-->


        <div class="menu-btn">
            <a href="#" title="">
                <i class="fa fa-bars"></i>
            </a>
        </div><!--menu-btn end-->

        <div class="user-account">
        <div class="user-info" style="width: 150px">
        <c:choose>
            <c:when test="${currentUser.profilePhoto.length()>4}">
                <img src="<c:url value='/media/profile/${currentUser.profilePhoto}'/>" alt="ss" height="40px"
                width="40px">
            </c:when>

            <c:otherwise>
                <img src="<c:url value='/images/user.jpg'/>" alt="ss" height="40px" width="40px">
            </c:otherwise>
        </c:choose>
        <a href="#" title=""><security:authentication property="principal.username"/></a>
        <i class="la la-sort-down"></i>

        </div>
        <div class="user-account-settingss">


        <h3><spring:message code="navebar.setting" text="Setting"/> </h3>
        <ul class="us-links">
        <li><a href="<c:url value="/profile/editProfile"/>" title=""><spring:message code="navebar.editProfile" text="Edit Profile"/> </a></li>
        </ul>
        <h3 class="tc"><a href="<c:url value="/logout"/>" title=""><spring:message code="navebar.logout" text="Logout"/> </a></h3>
        </div><!--user-account-settingss end-->
        </div>

        </div><!--header-data end-->
        </div>
        </header><!--header end-->