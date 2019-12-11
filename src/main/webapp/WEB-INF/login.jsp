<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<!-- Mirrored from gambolthemes.net/workwise-new/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:26 GMT -->
<head>
    <meta charset="UTF-8">
    <title>MUMBook</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" href="css/animate.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/line-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/line-awesome-font-awesome.min.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="lib/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="lib/slick/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">

    <style>
        .sn-field{
            margin-top: 10px;
        }
    </style>
</head>


<body>


<div class="wrapper">

    <div class="sign-in-page">
        <div class="signin-popup">
            <div class="signin-pop">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="cmp-info">
                            <div class="cm-logo">
                                <img style="width: 200px; height: 200px" src="images/logo.png" alt="">
                            </div><!--cm-logo end-->
                            <img src="images/cm-main-img.png" alt="">
                        </div><!--cmp-info end-->
                    </div>
                    <div class="col-lg-6">
                        <div class="login-sec">
                            <ul class="sign-control">
                                <li data-tab="tab-1" class="current"><a href="#" title="">Sign in</a></li>
                                <li data-tab="tab-2"><a href="#" title="">Sign up</a></li>
                            </ul>
                            <div class="sign_in_sec current" id="tab-1">

                                <h3>Sign in</h3>
                                <div id="error">
                                    ${errorMessage}
                                </div>
                                <security:authorize access="isAnonymous()">
                                    Anonymous
                                </security:authorize>
                                <security:authorize access="isAuthenticated()">
                                    Authenticated
                                </security:authorize>
<%--                                <form:form method="post" action="login" modelAttribute="login">--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-lg-12 no-pdd">--%>
<%--                                            <c:if test="${param.error!=null}">Error</c:if>--%>

<%--                                            <form:errors path="username" cssStyle="color : red;" />--%>
<%--                                            <div class="sn-field">--%>
<%--                                                <form:input type="text" path="username" placeholder="username" />--%>
<%--                                                <i class="la la-user"></i>--%>
<%--                                            </div><!--sn-field end-->--%>
<%--                                        </div>--%>
<%--                                        <div class="col-lg-12 no-pdd">--%>
<%--                                            <form:errors path="password" cssStyle="color : red;" />--%>
<%--                                            <div class="sn-field">--%>
<%--                                                <form:input type="password" path="password" placeholder="Password" />--%>
<%--                                                <i class="la la-lock"></i>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>


<%--                                        <div class="col-lg-12 no-pdd">--%>
<%--                                            <button type="submit" value="submit">Sign in</button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form:form>--%>

                                <form method="post" action="login">
                                    <div class="row">
                                        <div class="col-lg-12 no-pdd">
                                            <c:if test="${param.error!=null}">Error</c:if>


                                            <div class="sn-field">
                                                <input type="text" name="username" placeholder="username" />
                                                <i class="la la-user"></i>
                                            </div><!--sn-field end-->
                                        </div>
                                        <div class="col-lg-12 no-pdd">

                                            <div class="sn-field">
                                                <input type="password" name="password" placeholder="Password" />
                                                <i class="la la-lock"></i>
                                            </div>
                                        </div>


                                        <div class="col-lg-12 no-pdd">
                                            <button type="submit" value="submit">Sign in</button>
                                        </div>
                                    </div>
                                </form>

                            </div><!--sign_in_sec end-->








                            <div class="sign_in_sec" id="tab-2">
                                <div class="dff-tab current" id="tab-3">
                                    <form:form method="post" action="register" modelAttribute="newUser">
                                        <div class="row">
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="profile.firstName" cssStyle="color : red;" />
                                                <div class="sn-field">
                                                    <form:input type="text" path="profile.firstName"  placeholder="First Name"/>
                                                    <i class="la la-user"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="profile.lastName" cssStyle="color : red;"/>
                                                <div class="sn-field">
                                                    <form:input type="text" path="profile.lastName"  placeholder="Last Name"/>
                                                    <i class="la la-user"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="profile.email" cssStyle="color : red;"/>
                                                <div class="sn-field">
                                                    <form:input type="email" path="profile.email" placeholder="email" />
                                                    <i class="la la-user"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="username" cssStyle="color : red;"/>
                                                <div class="sn-field">
                                                    <form:input type="text" path="username" placeholder="username" />
                                                    <i class="la la-user"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="password" cssStyle="color : red;"/>
                                                <div class="sn-field">
                                                    <form:input type="password" path="password" placeholder="Password" />
                                                    <i class="la la-lock"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="profile.dateOfBirth" cssStyle="color : red;"/>
                                                <div class="sn-field">
                                                    <form:input type="date" path="profile.dateOfBirth" />
                                                    <i class="la la-lock"></i>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 no-pdd">
                                                <form:errors path="profile.gender" cssStyle="color : red;"/>
                                                <div class="custom-radio">
                                                    <form:radiobutton  path="profile.gender" value="Male" style="display: inline;width: 10px"/> Male <br/>
                                                    <form:radiobutton  path="profile.gender" value="Female" style="display: inline;width: 10px"/> Female
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <button type="submit" value="submit">Sign Up</button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div><!--dff-tab end-->
                                <div class="dff-tab" id="tab-4">
                                    <form>
                                        <div class="row">
                                            <div class="col-lg-12 no-pdd">
                                                <div class="sn-field">
                                                    <input type="text" name="company-name" placeholder="Company Name">
                                                    <i class="la la-building"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <div class="sn-field">
                                                    <input type="text" name="country" placeholder="Country">
                                                    <i class="la la-globe"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <div class="sn-field">
                                                    <input type="password" name="password" placeholder="Password">
                                                    <i class="la la-lock"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <div class="sn-field">
                                                    <input type="password" name="repeat-password" placeholder="Repeat Password">
                                                    <i class="la la-lock"></i>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <div class="checky-sec st2">
                                                    <div class="fgt-sec">
                                                        <input type="checkbox" name="cc" id="c3">
                                                        <label for="c3">
                                                            <span></span>
                                                        </label>
                                                        <small>Yes, I understand and agree to the workwise Terms & Conditions.</small>
                                                    </div><!--fgt-sec end-->
                                                </div>
                                            </div>
                                            <div class="col-lg-12 no-pdd">
                                                <button type="submit" value="submit">Get Started</button>
                                            </div>
                                        </div>
                                    </form>
                                </div><!--dff-tab end-->
                            </div>
                        </div><!--login-sec end-->
                    </div>
                </div>
            </div><!--signin-pop end-->
        </div><!--signin-popup end-->
<%--        <div class="footy-sec">--%>
<%--            <div class="container">--%>
<%--                <ul>--%>
<%--                    <li><a href="../../help-center.html" title="">Help Center</a></li>--%>
<%--                    <li><a href="../../about.html" title="">About</a></li>--%>
<%--                    <li><a href="#" title="">Privacy Policy</a></li>--%>
<%--                    <li><a href="#" title="">Community Guidelines</a></li>--%>
<%--                    <li><a href="#" title="">Cookies Policy</a></li>--%>
<%--                    <li><a href="#" title="">Career</a></li>--%>
<%--                    <li><a href="../../forum.html" title="">Forum</a></li>--%>
<%--                    <li><a href="#" title="">Language</a></li>--%>
<%--                    <li><a href="#" title="">Copyright Policy</a></li>--%>
<%--                </ul>--%>
<%--                <p><img src="images/copy-icon.png" alt="">Copyright 2019</p>--%>
<%--            </div>--%>
<%--        </div><!--footy-sec end-->--%>
    </div><!--sign-in-page end-->


</div><!--theme-layout end-->



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/slick/slick.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
</body>

<!-- Mirrored from gambolthemes.net/workwise-new/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:27 GMT -->
</html>