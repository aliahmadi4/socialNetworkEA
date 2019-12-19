<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<head>
    <jsp:include page="layout/head.jsp"/>
</head>

<style type="text/css">
    ul.comments-list li {
        padding: 10px;
        margin: 0;
        list-style: none;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
        display: block;
        background: white;
        color: #696868;
    }
    .cp-field {
        float: left;
        width: 100%;
        margin-top: 29.4px;
        padding: 0 0px;
    }
    .cp-field input {
        height: 40px;
        padding: 0 10px;
    }

    @-webkit-keyframes change-color {
        0%   { background-color: #d6301b; }
        100% { background-color: #ffffff; }
    }
    @-moz-keyframes change-color {
        0%   { background-color: #d6301b; }
        100% { background-color: #ffffff; }
    }
    @-o-keyframes change-color {
        0%   { background-color: #d6301b; }
        100% { background-color: #ffffff; }
    }
    @keyframes change-color {
        0%   { background-color: #d6301b; }
        100% { background-color: #ffffff; }
    }

    .animated {
        -webkit-animation: change-color 8s forwards; /* Safari 4+ */
        -moz-animation:    change-color 8s forwards; /* Fx 5+ */
        -o-animation:      change-color 8s forwards; /* Opera 12+ */
        animation:         change-color 8s forwards; /* IE 10+ */
    }
</style>
<body>


<div class="wrapper">
    <jsp:include page="layout/navbar.jsp"/>


    <section class="cover-sec">
        <img src="/images/cover-img.jpg" alt="">
        <div class="add-pic-box">
            <div class="container">
                <div class="row no-gutters">
                    <c:if test="${currentUser.id}==${profile.id}">
                        <div class="col-lg-12 col-sm-12">
                            <input type="file" id="file">
                            <label for="file"><spring:message code="profile.changeImg" text="Change Image"/> </label>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>


    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="main-left-sidebar">
                                <div class="user_profile">
                                    <div class="user-pro-img">
                                        <c:choose>
                                            <c:when test="${profile.profilePhoto.length()>4}">
                                                <img src="/media/profile/${profile.profilePhoto}" alt="">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<c:url value='/images/user.jpg'/>" alt="">
                                            </c:otherwise>
                                        </c:choose>
                                        <%--<div class="add-dp" id="OpenImgUpload">
                                            <input type="file" id="profilePic">
                                            <label for="file"><i class="fas fa-camera"></i></label>
                                        </div>--%>
                                    </div><!--user-pro-img end-->
                                    <div class="user_pro_status">
                                        <c:if test="${follow==0}">
                                            <ul class="flw-hr">
                                                <li><a href="javascript:" title="" class="flww follow" id="${profile.id}">Follow</a></li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${follow==1}">
                                            <ul class="flw-hr">

                                                <li><a href="javascript:" title="" class="flww unfollowing" id="${profile.id}">Unfollow</a></li>
                                                    <%--                                                <li><a href="#" title="" class="hre">Hire</a></li>--%>
                                            </ul>
                                        </c:if>
<%--                                        <ul class="flw-status">--%>
<%--                                            <li>--%>
<%--                                                <span>Following</span>--%>
<%--                                                <b>34</b>--%>
<%--                                            </li>--%>
<%--                                            <li>--%>
<%--                                                <span>Followers</span>--%>
<%--                                                <b>155</b>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
                                    </div><!--user_pro_status end-->
                                    <ul class="social_links">
                                        <c:if test="${profile.address.country.length()>2}" >
                                            <li><i class="la la-globe"></i><spring:message code="profile.from" text="From"/>  <b>${profile.address.country}</b></li>
                                            <li><i class="la la-globe"></i> <spring:message code="profile.livesIn" text="Lives in"/> <b>${profile.address.state}, ${profile.address.city}</b></li>
                                        </c:if>
                                        <li><i class="la la-globe"></i> <spring:message code="profile.gender" text="Gender"/> <b>${profile.gender}</b></li>
                                        <li><i class="la la-globe"></i> <spring:message code="profile.email" text="Email"/> <b>${profile.email}</b></li>
                                        <c:if test="${currentUser.id==profile.id}">
                                        <li><a href="/profile/editProfile"><spring:message code="profile.editProfile" text="Edit Profile"/> </a></li>
                                        </c:if>


                                    </ul>
                                </div><!--user_profile end-->
                            </div><!--main-left-sidebar end-->
                        </div>

                        <div class="col-lg-6">
                            <div class="main-ws-sec">
                                <div class="user-tab-sec rewivew">
                                    <h3>${profile.firstName} ${profile.lastName}</h3>
                                    <div class="star-descp">
                                        <span>${profile.occupation}</span>
                                        <ul>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star-half-o"></i></li>
                                        </ul>
<%--                                        <a href="#" title="">Status</a>--%>
                                    </div><!--star-descp end-->

                                </div><!--user-tab-sec end-->
                                <div class="product-feed-tab" id="saved-jobs">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="mange-tab" data-toggle="tab" href="#mange"
                                               role="tab" aria-controls="home" aria-selected="true">Manage Jobs</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="saved-tab" data-toggle="tab" href="#saved"
                                               role="tab" aria-controls="profile" aria-selected="false">Saved Jobs</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#applied"
                                               role="tab" aria-controls="applied" aria-selected="false">Applied Jobs</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="cadidates-tab" data-toggle="tab" href="#cadidates"
                                               role="tab" aria-controls="contact" aria-selected="false">Applied
                                                cadidates</a>
                                        </li>
                                    </ul>

                                </div>
                                <div class="product-feed-tab current" id="feed-dd">
                                    <div class="posts-section">
                                        <c:forEach var="post" items="${posts}">
                                            <div class="post-bar ${post.id}-wrapper">

                                                <div class="post_topbar">
                                                    <div class="usy-dt">
                                                        <c:choose>
                                                            <c:when test="${post.user.profile.profilePhoto.length()>4}">
                                                                <img src="/media/profile/${post.user.profile.profilePhoto}" alt="" width="45px" height="45px">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="<c:url value='/images/user.jpg'/>" alt="" width="45px" height="45px">
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="usy-name">
                                                            <a href="<c:url value='/profile/${post.user.id}' />">
                                                                <h3>${post.user.profile.firstName} ${post.user.profile.lastName}</h3></a>
                                                            <span><img src="../../images/clock.png" alt=""><fmt:formatDate dateStyle="long" value="${post.creationDate}"/></span>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="epi-sec">

                                                    &nbsp
                                                </div>
                                                <div class="job_descp">

                                                    <p>${post.text}</p>

                                                </div>
                                                <c:if test="${post.photo.length() >3}">
                                                    <div class="job_descp">
                                                        <img src="<c:url value='/media/post/${post.photo}' />"/>
                                                    </div>
                                                </c:if>

                                                <c:if test="${post.video.length() >3}">
                                                    <div class="job_descp">
                                                            <%--                                                    <img src="<c:url value='/media/post/${post.video}' />"/>--%>
                                                        <video width="100%" controls>
                                                            <source src="/media/post/${post.video}" type="video/mp4">
                                                            <spring:message code="index.video" text="Your browser does not support HTML5 video."/>
                                                        </video>
                                                    </div>


                                                </c:if>
                                                <div class="job-status-bar">
                                                    <ul class="like-com">
                                                        <li>
                                                            <c:set var="count" value="${0}" />
                                                            <c:set var="likeid" value="${0}" />
                                                            <c:forEach items="${post.likes}" var="like">
                                                                <c:if test = "${like.user.id == currentUser.id}">
                                                                    <c:set var="count" value="${count+1}" />
                                                                    <c:set var="likeid" value="${like.id}" />
                                                                </c:if>
                                                            </c:forEach>
                                                            <a href="javascript:;" class="addlike ${post.id}-likes-wrap ${count == 0 ? 'not-active' : 'active'}" data-likeid="${likeid}" data-id="${post.id}" data-post="${post}"><i class="fas fa-heart"></i><span class="${post.id}-likes">${post.likeCount}</span> <spring:message code="index.like" text="Like"/> </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;" class="addcomment " data-id="${post.id}" data-post="${post}"><i class="fas fa-comment-alt"></i><span class="${post.id}-comments">${post.commentCount}</span> <spring:message code="index.comment" text="Comments"/> </a>

                                                        </li>
                                                    </ul>

                                                </div>
                                                <div>
                                                    <form class="post-comment" data-id="${post.id}" data-post="${post}">
                                                        <div class="cp-field">
                                                            <div class="cpp-fiel">
                                                                <spring:message code="index.commentPlaceholder" text="write your comment here"  var="commentPlaceholder"/>
                                                                <input type="text" name="text" class="comment-text ${post.id}-text" placeholder="${commentPlaceholder}" required   />
                                                            </div>
                                                        </div>
                                                        <input type="submit" class="comment-submit" value="Submit" style="display: none">
                                                    </form>
                                                </div>
                                                <div class="job-status-bar">
                                                    <ul class="comments-list ${post.id}-commentlist">
                                                        <c:forEach items="${post.comments}" var="comment">
                                                            <li> ${comment.text}</li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!--post-bar end-->
                                        </c:forEach>

                                    </div><!--posts-section end-->
                                </div><!--product-feed-tab end-->
                            </div><!--main-ws-sec end-->
                        </div>

                        <div class="col-lg-3">
                            <div class="right-sidebar">
                                <c:if test="${currentUser.id==profile.id}">
                                <div class="message-btn">
                                    <a href="<c:url value='/profile/editProfile'/>" title=""><i class="fas fa-cog"></i>
                                        <spring:message code="profile.editProfile" text="Edit Profile"/> </a>
                                </div>
                                </c:if>
                                <div class="widget widget-portfolio">
                                    <div class="wd-heady">
                                        <h3><spring:message code="editProfile.about" text="About Me"/> </h3>
                                        <img src="/images/photo-icon.png" alt="">
                                    </div>
                                    <div class="pf-gallery">
                                        <div>
                                            <p><spring:message code="profile.myName" text="My name is"/> ${profile.firstName} ${profile.lastName} <spring:message code="profile.msg1" text="but you can call me"/> ${profile.firstName}. <spring:message code="profile.msg2" text="If you want to contact me please dont hesitate to email me by"/> ${profile.email}</p>
                                        </div>

                                    </div><!--pf-gallery end-->
                                </div><!--widget-portfolio end-->
                            </div><!--right-sidebar end-->
                        </div>
                    </div>
                </div><!-- main-section-data end-->
            </div>
        </div>
    </main>

    <footer>

    </footer><!--footer end-->


</div><!--theme-layout end-->

<jsp:include page="layout/footerScript.jsp"/>

<%--//for loading more posts--%>
<script src="/js/loadmore.js" type="text/javascript"></script>
<script src="/js/followUnfollow.js" type="text/javascript"></script>

<script type="text/javascript">

    $(function() {

        $.urlParam = function(name){
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results[1] || 0;
        }

        var scrollTo = $.urlParam('scrollTo');
        console.log(scrollTo);

        $("html, body").delay(0).animate({
            scrollTop: $("."+scrollTo+"-wrapper").offset().top
        }, 1500);

        $("."+scrollTo+"-wrapper").addClass("animated");
        // $(".addlike").click(function(){
        //     var postId = $(this).data("id");
        //     var post = $(this).data("post");
        //     // alert("Like me: " + post);
        //     ajaxSubmitLikes(postId)
        // })
        //
        // function ajaxSubmitLikes(postId) {
        //
        //
        //
        //     $.ajax({
        //         type: "POST",
        //         contentType: "application/json",
        //         url: "/addlike",
        //         data: JSON.stringify(postId),
        //         dataType: 'json',
        //         headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
        //         success: function (data) {
        //             // alert("success");
        //             console.log("SUCCESS : ", data);
        //
        //             var likeIncrement = parseInt($("."+postId+"-likes").html()) + 1;
        //             $("."+postId+"-likes").text(likeIncrement);
        //             console.log("likeIncrement", likeIncrement);
        //
        //         },
        //         error: function (e) {
        //             alert("Really sorry, something went wrong. Please try later")
        //             console.log("ERROR : ", e);
        //         }
        //     });
        //
        // }

        $(".addlike").click(function () {
            var postId = $(this).data("id");
            var post = $(this).data("post");
            // alert("Like me: " + post);
            var isActive = $(this).hasClass("active");
            console.log($(this).hasClass("active"));

            ajaxSubmitLikes(postId, isActive)
        })

        function ajaxSubmitLikes(postId, isActive) {

            var type = isActive ? 'DELETE' : 'POST';
            var finalId = JSON.stringify(postId);
            var contentType = "application/json";
            if (type == "DELETE") {
                var likeId = $("." + postId + "-likes-wrap").data("likeid");
                finalId = {"likeId": likeId, "postId": postId};
                contentType = "application/x-www-form-urlencoded; charset=UTF-8";
            }

            console.log("POST/LIKE ID is: ", postId);

            $.ajax({
                type: type,
                contentType: contentType,
                url: '/like',
                data: finalId,
                dataType: 'json',
                headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
                success: function (data) {
                    // alert("success");
                    console.log("SUCCESS : ", data);
                    console.log("type", type);
                    console.log("isActive", isActive);

                    var type = isActive ? 'DELETE' : 'POST';
                    if (type == "POST") {
                        var likeIncrement = parseInt($("." + postId + "-likes").html()) + 1;
                        $("." + postId + "-likes-wrap").data("likeid", data.id);
                        console.log("likeIncrement value inside POST Condition", likeIncrement);
                    } else {
                        var likeIncrement = parseInt($("." + postId + "-likes").html()) - 1;
                        console.log("likeIncrement value inside DELETE Condition", likeIncrement);
                    }

                    $("." + postId + "-likes").text(likeIncrement);
                    console.log("likeIncrement value", likeIncrement);
                    if (!$("." + postId + "-likes-wrap").hasClass("active")) {
                        $("." + postId + "-likes-wrap").addClass("active");
                    } else {
                        $("." + postId + "-likes-wrap").removeClass("active");
                    }

                },
                error: function (e) {
                    alert("Really sorry, something went wrong. Please try later")
                    console.log("ERROR : ", e);
                }
            });

        }

        $(".post-comment").submit(function (e) {
            e.preventDefault();
            var postId = $(this).data("id");
            var post = $(this).data("post");
            // alert("Like me: " + post);
            ajaxSubmitComments(postId)
        })

        function ajaxSubmitComments(postId) {
            console.log("PostID", postId);
            var text = $("." + postId + "-text").val();
            console.log("text", text);
            var commentData = {"postId": postId, "text": text};
            $.ajax({
                type: "POST",
                // contentType: "application/json",
                url: "/addComment",
                // data: JSON.stringify(commentData),
                data: commentData,
                dataType: 'json',
                headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
                success: function (data) {
                    // alert("success");
                    console.log("SUCCESS : ", data);

                    // To increase comment count
                    var commentIncrement = parseInt($("." + postId + "-comments").html()) + 1;
                    $("." + postId + "-comments").text(commentIncrement);
                    console.log("commentIncrement", commentIncrement);

                    //To prepend comment
                    $("." + postId + "-commentlist").prepend("<li>" + text + "</li>");

                    $("." + postId + "-text").val("");

                },
                error: function (e) {
                    alert("Really sorry, something went wrong. Please try later")
                    console.log("ERROR : ", e);
                }
            });
        }
    });




</script>
</body>

<!-- Mirrored from gambolthemes.net/workwise-new/my-profile-feed.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:23:00 GMT -->
</html>