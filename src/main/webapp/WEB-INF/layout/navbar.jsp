    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
        <header>
            <div class="container">
                <div class="header-data">
                    <div class="logo">
                        <a href="<c:url value='/'/>" ><img src="<c:url value='/images/logo.png'/>" alt=""></a>
                    </div><!--logo end-->
                    <div class="search-bar">
                    <%--<form>
                    <input type="text" name="search" placeholder="Search...">
                    <button type="submit"><i class="la la-search"></i></button>
                    </form>--%>
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
                            <a href="<c:url value='/profile'/>" title="">
                                <span><img src="<c:url value='/images'/>/icon4.png" alt=""></span>
                                Profiles
                            </a>
                        </li>

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
<%--                        <img src=" <c:url value='/media/images/profile/${loginedUser.profilePic.length()>4 ? loginedUser.profilePic : "/media/images/user.jpg"}'/>--%>
<%--                        " alt="" height="40px" width="40px">--%>
        <img src=" <c:url value='/media2/images/profile/ali.jpg"}'/>  " alt="" height="40px" width="40px">
                                <a href="#" title=""><security:authentication property="principal.username"/></a>
                                <i class="la la-sort-down"></i>
                                </div>
                                <div class="user-account-settingss">


                                <h3>Setting</h3>
                                <ul class="us-links">
                                <li><a href="<c:url value="/editProfile"/>" title="">Edit Profile</a></li>
                                </ul>
                                <h3 class="tc"><a href="logout" title="">Logout</a></h3>
                                </div><!--user-account-settingss end-->
                            </div>

                        </div><!--header-data end-->
                    </div>
                </header><!--header end-->


