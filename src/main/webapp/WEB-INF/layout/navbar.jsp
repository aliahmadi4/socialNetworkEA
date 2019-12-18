    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <header>
        <div class="container">
        <div class="header-data">
        <div class="logo">
        <a href="<c:url value='/'/>" ><img src="<c:url value='/images/logo.png'/>" alt=""></a>
        </div><!--logo end-->
        <div class="search-bar">
        <form method="get" action="/post/search">
        <input type="text" name="search" placeholder="Search...">
        <button type="submit"><i class="la la-search"></i></button>
        </form>
        </div><!--search-bar end-->

        <nav>
        <ul>

        <li>
        <a href="<c:url value='/'/>" title="">
        <span><img src="<c:url value='/images'/>/icon1.png" alt=""></span>
        Home
        </a>
        </li>

        <li>
        <a href="<c:url value='/profileList'/>" title="">
        <span><img src="<c:url value='/images'/>/icon4.png" alt=""></span>
        Users
        </a>
        </li>

        <li>
        <a href="<c:url value='/profile/${currentUser.id}'/>" title="">
        <span><img src="<c:url value='/images'/>/icon7.png" alt=""></span>
        Profile
        </a>
        </li>

        <security:authorize access="hasRole('ADMIN')">
            <li>
            <a href ="<c:url value='/admin/deactivatedUsers'/>">
            <spring:message code="Navbar.deactivatedUsers"/>
            </a>
            </li>

            <li>
            <a href="<c:url value='/admin/manageUserRoles'/>">
            <spring:message code="Navbar.manageRoles"/>
            </a>
            </li>
        </security:authorize>
        <security:authorize access="hasAnyRole('ADMIN','CONTENT_MANAGER')">
            <li>
            <a href="<c:url value='/admin/unhealthyPosts'/>">
            <spring:message code="Navbar.unhealthyPosts"/>
            </a>
            </li>
            <li>
            <a href="<c:url value='/unhealthyWords/'/>">
            <spring:message code="Navbar.unhealthyWords"/>
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
        <a href="#" title=""><i class="fa fa-bars"></i></a>
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


        <h3>Setting</h3>
        <ul class="us-links">
        <li><a href="<c:url value="/profile/editProfile"/>" title="">Edit Profile</a></li>
        </ul>
        <h3 class="tc"><a href="<c:url value="/logout"/>" title="">Logout</a></h3>
        </div><!--user-account-settingss end-->
        </div>

        </div><!--header-data end-->
        </div>
        </header><!--header end-->