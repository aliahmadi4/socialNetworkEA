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


    <section class="profile-account-setting">
        <div class="container">
            <div class="account-tabs-setting">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="acc-leftbar">
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-privcy-tab" data-toggle="tab" href="#privcy"
                                   role="tab" aria-controls="privacy" aria-selected="true">
                                    <i class="fa fa-info-circle"> </i>
                                    <spring:message code="editProfile.changeInfo" text="Change Info"/> </a>

                                <a class="nav-item nav-link" id="nav-notification-tab" data-toggle="tab"
                                   href="#nav-notification" role="tab" aria-controls="nav-notification"
                                   aria-selected="false"><i class="fa fa-image"></i>
                                    <spring:message code="editProfile.profilePic" text="Profile Picture" /> </a>

                                <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab"
                                   href="#nav-password" role="tab" aria-controls="nav-password" aria-selected="false"><i
                                        class="fa fa-lock"></i>
                                    <spring:message code="editProfile.changePass" text="Change Password"/> </a>


                            </div>
                        </div><!--acc-leftbar end-->
                    </div>
                    <div class="col-lg-9">
                        <div class="tab-content" id="nav-tabContent">


                            <div class="tab-pane fade show active" id="privcy" role="tabpanel" aria-labelledby="nav-privcy-tab">
                                <div class="acc-setting">
                                    <h3 style="margin-left: 10px"><spring:message code="editProfile.changeInfo" text="Change Info"/> </h3>
                                    <h4 style="margin: 10px; color: red" id="errorMsg"></h4>

                                    <form:form method="post" action="/profile" modelAttribute="profile">
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.firstName" text="First Name" /></h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="firstName" id="firstName"
                                                            value="${currentUser.firstName}"/>
                                                <form:errors path="firstName" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.lastName" text="Last Name"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="lastName" id="lastName"
                                                            value="${currentUser.lastName}"/>
                                                <form:errors path="lastName" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.occupation" text="Occupation"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="occupation" id="occupation"
                                                            value="${currentUser.occupation}"/>
                                                <form:errors path="occupation" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.email" text="Email"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="email" path="email" id="email"
                                                            value="${currentUser.email}"/>
                                                <form:errors path="email" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.country" text="Country"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="address.country" id="country"
                                                            value="${currentUser.address.country}"/>
                                                <form:errors path="address.country" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.state" text="State"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="address.state" id="state"
                                                            value="${currentUser.address.state}"/>
                                                <form:errors path="address.state" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.city" text="City"/> </h5>
                                            <div class="cpp-fiel">
                                                <form:input type="text" path="address.city" id="city"
                                                            value="${currentUser.address.city}"/>
                                                <form:errors path="address.city" cssStyle="color : red;"/>
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>

                                        <form:input type="hidden" path="id" id="id" value="${currentUser.id}"/>
                                        <form:errors path="id" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="dateOfBirth" id="dateOfBirth"
                                                    value="${currentUser.dateOfBirth}"/>
                                        <form:errors path="dateOfBirth" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="joinDate" id="joinDate"
                                                    value="${currentUser.joinDate}"/>
                                        <form:errors path="joinDate" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="gender" id="gender"
                                                    value="${currentUser.gender}" readonly="true"/>
                                        <form:errors path="gender" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="noOfDisapprovedPosts" id="noOfUnhealthyPosts"
                                                    value="${currentUser.noOfDisapprovedPosts}"/>
                                        <form:errors path="noOfDisapprovedPosts" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="profilePhoto" id="profilePhoto"
                                                    value="${currentUser.profilePhoto}"/>
                                        <form:errors path="profilePhoto" cssStyle="color : red;"/>

                                        <form:input type="hidden" path="address.id" id="profilePhoto"
                                                    value="${currentUser.address.id}"/>
                                        <form:errors path="address.id" cssStyle="color : red;"/>


                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li>
                                                    <button type="submit">
                                                        <spring:message code="editProfile.save" text="Save" />
                                                    </button>
                                                </li>
                                            </ul>
                                        </div>
                                        <!--save-stngs end-->
                                    </form:form>
                                </div><!--acc-setting end-->
                            </div>
                            <div class="tab-pane fade" id="nav-password" role="tabpanel"
                                 aria-labelledby="nav-password-tab">
                                <div class="acc-setting">
                                    <h3 style="margin-left: 10px"><spring:message code="editProfile.accountSetting" text="Account Setting"/> </h3>
                                    <h4 style="margin: 10px; color: red" id="errorMsg"></h4>
                                    <form method="POST" action="<c:url value='/profile/changePassword' />">
                                        <%--                                        <div class="cp-field">--%>
                                        <%--                                            <h5>Old Password</h5>--%>
                                        <%--                                            <div class="cpp-fiel">--%>
                                        <%--                                                <input type="text" name="old-password" id="old-password"--%>
                                        <%--                                                       placeholder="Old Password" required>--%>
                                        <%--                                                <i class="fa fa-lock"></i>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.newPass" text="New Password" var="newPass"/> </h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="new-password" id="new-password"
                                                       placeholder="${newPass}">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5><spring:message code="editProfile.repeatPass" text="Repeat Password" var="repeatPass"/> </h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="repeat-password" id="repeat-password"
                                                       placeholder="${repeatPass}">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        ${passwordError}

                                        <div class="save-stngs pd2">
                                            <ul>
                                                <li>
                                                    <button type="submit"><spring:message code="editProfile.changePass" text="Change Password"/>
                                                    </button>
                                                </li>

                                            </ul>
                                        </div><!--save-stngs end-->

                                    </form>
                                </div><!--acc-setting end-->
                            </div>
                            <div class="tab-pane fade" id="nav-notification" role="tabpanel"
                                 aria-labelledby="nav-notification-tab">
                                <div class="acc-setting">
                                    <h3><spring:message code="editProfile.changeProfilePic" text="Change Profile Picture"/> </h3>
                                    <div class="notifications-list">
                                        <div class="notfication-details">
                                            <form action="<c:url value='/profile/profilePhotoUpload'/>" method="post"
                                                  enctype="multipart/form-data">
                                                <input type="file" id="changeProfilePic" name="file">
                                                <div class="save-stngs pd2">
                                                    <ul>
                                                        <li>
                                                            <button type="submit"><spring:message code="editProfile.upload" text="Upload"/> </button>
                                                        </li>
                                                        <li>
                                                            <button type="#"><spring:message code="editProfile.cancel" text="Cancel"/> </button>
                                                        </li>
                                                    </ul>
                                                </div><!--save-stngs end-->
                                            </form>
                                        </div>
                                    </div><!--notifications-list end-->

                                </div><!--acc-setting end-->
                            </div>


                            <%--<div class="tab-pane fade" id="security-login" role="tabpanel" aria-labelledby="security">
                                <div class="privacy security">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3>Security and Login</h3>
                                            <hr>
                                            <h3>Two - Step Verification</h3>
                                            <p>Help protect your account by enabling extra layers of security.</p>
                                            <hr>
                                            <h3>Security question</h3><i class="la la-edit"></i>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                <label class="custom-control-label" for="customCheck1">Conform your
                                                    identity with a question only you know the answer to</label>
                                            </div>
                                            <hr>
                                            <h3>Security question</h3>
                                            <p>Before can you set a new security question,</p>
                                            <hr>
                                            <h3>Current Question</h3>
                                            <p>Q: Your favorite actor?</p>
                                            <br>
                                            <h3>New Question</h3>
                                            <form>
                                                <div class="form-group">
                                                    <select class="form-control" id="exampleFormControlSelect1"
                                                            style="-webkit-appearance: menulist-button;">
                                                        <option>Please Select New Question</option>
                                                        <option>Select Second Queston</option>
                                                    </select>
                                                </div>
                                            </form>
                                            <h3>Answer</h3>
                                            <form>

                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="exampleInputPassword1"
                                                           placeholder=" Answer here">
                                                </div>
                                            </form>
                                            <div class="checkbox">
                                                <div class="form-check">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadio1" name="customRadio"
                                                               class="custom-control-input">
                                                        <label class="custom-control-label" for="customRadio1">I
                                                            understand my account will be locked if I am unable to
                                                            answer this question</label>
                                                    </div>
                                                </div>
                                                <div class="form-check">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="customRadio2" name="customRadio"
                                                               class="custom-control-input">
                                                        <label class="custom-control-label" for="customRadio2">Remember
                                                            this device</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                        </div>
                                    </div>
                                    <div class="btns">
                                        <a href="#">Save</a>
                                        <a href="#">Cancel</a>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="tab-pane fade" id="blockking" role="tabpanel"
                                 aria-labelledby="nav-blockking-tab">
                                <div class="helpforum">
                                    <div class="row">
                                        <div class="col-12 security">
                                            <h3>Blocking</h3>
                                            <hr>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <h4>Blocking</h4>
                                                <p>See your list,and make changes if you'd like</p>
                                                <div class="bloktext">
                                                    <p>You are not bloking anyone</p>
                                                    <p>Need to blok or report someone? Go to the profile of the person
                                                        you want to blok and select "Blok or Report" from the drowp-down
                                                        menu at the top of the profile summery</p>
                                                    <p>Note: After you have blocked the person, Any previous profile
                                                        views of yours and of the other person will disappear from each
                                                        of your "Who's viewed your profile" sections. </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="privciy" role="tabpanel" aria-labelledby="nav-privcy-tab">
                                <div class="acc-setting">
                                    <h3>Requests</h3>
                                    <div class="requests-list">
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img1.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>Jessica William</h3>
                                                <span>Graphic Designer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img2.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>John Doe</h3>
                                                <span>PHP Developer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img3.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>Poonam</h3>
                                                <span>Wordpress Developer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img4.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>Bill Gates</h3>
                                                <span>C & C++ Developer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img5.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>Jessica William</h3>
                                                <span>Graphic Designer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                        <div class="request-details">
                                            <div class="noty-user-img">
                                                <img src="images/resources/r-img6.png" alt="">
                                            </div>
                                            <div class="request-info">
                                                <h3>John Doe</h3>
                                                <span>PHP Developer</span>
                                            </div>
                                            <div class="accept-feat">
                                                <ul>
                                                    <li>
                                                        <button type="submit" class="accept-req">Accept</button>
                                                    </li>
                                                    <li>
                                                        <button type="submit" class="close-req"><i
                                                                class="la la-close"></i></button>
                                                    </li>
                                                </ul>
                                            </div><!--accept-feat end-->
                                        </div><!--request-detailse end-->
                                    </div><!--requests-list end-->
                                </div><!--acc-setting end-->
                            </div>
                            <div class="tab-pane fade" id="privacy" role="tabpanel" aria-labelledby="nav-privacy-tab">
                                <div class="privac">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3>Privacy</h3>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="dropdown privacydropd">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Who can see
                                                    your email address</a>
                                                <div class="dropdown-menu">
                                                    <p>Choose who can see your email address on your profile</p>
                                                    <div class="row">
                                                        <div class="col-md-9 col-sm-12">
                                                            <form class="radio-form">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck1">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck1">Everyone</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck2">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck2">Friends</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck3">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck3">Only Me</label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-3 col-sm-12">
                                                            <p style="float: right;">Everyone</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="dropdown privacydropd">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Who can see
                                                    your Friends</a>
                                                <div class="dropdown-menu">
                                                    <p>Choose who can see your list of connections</p>
                                                    <div class="row">
                                                        <div class="col-md-9 col-sm-12">
                                                            <form class="radio-form">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck4">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck4">Everyone</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck5">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck5">Friends</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck6">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck6">Only Me</label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-3 col-sm-12">
                                                            <p style="float: right;">Everyone</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="dropdown privacydropd">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Manage who
                                                    can discover your profile from your email address</a>
                                                <div class="dropdown-menu">
                                                    <p>Choose who can discover your profile if they are not connected to
                                                        you but have your email address</p>
                                                    <div class="row">
                                                        <div class="col-md-9 col-sm-12">
                                                            <form class="radio-form">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck7">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck7">Everyone</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck8">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck8">Friends</label>
                                                                </div>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck9">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck9">Only Me</label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-3 col-sm-12">
                                                            <p style="float: right;">Everyone</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="dropdown privacydropd">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search
                                                    history</a>
                                                <div class="dropdown-menu">
                                                    <p>Clear all previous searches performed on LinkedIn</p>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <form class="radio-form">
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input"
                                                                           id="customCheck10">
                                                                    <label class="custom-control-label"
                                                                           for="customCheck10">Clear All History</label>
                                                                </div>
                                                            </form>
                                                            <div class="privabtns">
                                                                <a href="#">Clear All History</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="dropdown privacydropd">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sharing your
                                                    profile when you click apply</a>
                                                <div class="dropdown-menu">
                                                    <p>Chose if you want to share your full profile with the job poster
                                                        when you're taken off linkedin after clicking apply </p>
                                                    <div class="row">
                                                        <div class="col-md-9 col-sm-12">
                                                            <form class="radio-form">
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" id="customRadio5"
                                                                           name="customRadio"
                                                                           class="custom-control-input">
                                                                    <label class="custom-control-label"
                                                                           for="customRadio5">Yes</label>
                                                                </div>
                                                                <div class="custom-control custom-radio">
                                                                    <input type="radio" id="customRadio6"
                                                                           name="customRadio"
                                                                           class="custom-control-input">
                                                                    <label class="custom-control-label"
                                                                           for="customRadio6">Yes</label>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="col-md-3 col-sm-12">
                                                            <p style="float: right;">Yes</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="privabtns">
                                                <a href="#">Save</a>
                                                <a href="#">Cancel</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="nav-deactivate" role="tabpanel"
                                 aria-labelledby="nav-deactivate-tab">
                                <div class="acc-setting">
                                    <h3>Deactivate Account</h3>
                                    <form>
                                        <div class="cp-field">
                                            <h5>Email</h5>
                                            <div class="cpp-fiel">
                                                <input type="text" name="email" placeholder="Email">
                                                <i class="fa fa-envelope"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Password</h5>
                                            <div class="cpp-fiel">
                                                <input type="password" name="password" placeholder="Password">
                                                <i class="fa fa-lock"></i>
                                            </div>
                                        </div>
                                        <div class="cp-field">
                                            <h5>Please Explain Further</h5>
                                            <textarea></textarea>
                                        </div>
                                        <div class="cp-field">
                                            <div class="fgt-sec">
                                                <input type="checkbox" name="cc" id="c4">
                                                <label for="c4">
                                                    <span></span>
                                                </label>
                                                <small>Email option out</small>
                                            </div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pretium
                                                nulla quis erat dapibus, varius hendrerit neque suscipit. Integer in ex
                                                euismod, posuere lectus id,</p>
                                        </div>
                                        <div class="save-stngs pd3">
                                            <ul>
                                                <li>
                                                    <button type="submit">Save Setting</button>
                                                </li>
                                                <li>
                                                    <button type="submit">Restore Setting</button>
                                                </li>
                                            </ul>
                                        </div><!--save-stngs end-->
                                    </form>
                                </div><!--acc-setting end-->
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--account-tabs-setting end-->
        </div>
    </section>
    <footer>
        <div class="footy-sec mn no-margin">
            <div class="container">
                <ul>
                    <li><a href="help-center.html" title=""><spring:message code="editProfile.helpCenter" text="Help Center"/> </a></li>
                    <li><a href="about.html" title=""><spring:message code="editProfile.about" text="About" /> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.privacy" text="Privacy Policy" /> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.community" text="Community Guidelines"/> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.cookies" text="Cookies Policy"/> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.career" text="Career" /> </a></li>
                    <li><a href="forum.html" title=""><spring:message code="editProfile.forum" text="Forum"/> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.language" text="Language"/> </a></li>
                    <li><a href="#" title=""><spring:message code="editProfile.copyright" text="Copyright Policy" /> </a></li>
                </ul>
                <p><img src="images/copy-icon2.png" alt=""><spring:message code="editProfile.copy" text="Copyright 2019"/> </p>
                <img class="fl-rgt" src="images/logo2.png" alt="">
            </div>
        </div>
    </footer>

</div><!--theme-layout end-->


<jsp:include page="layout/footerScript.jsp"/>

</body>

<!-- Mirrored from gambolthemes.net/workwise-new/editProfile.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:26 GMT -->
</html>