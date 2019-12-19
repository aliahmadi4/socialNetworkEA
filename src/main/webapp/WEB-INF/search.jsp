<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<security:csrfMetaTags />
<html>

<head>
    <jsp:include page="layout/head.jsp"/>
<%--    <script type="text/javascript" src="<c:url value='/js/scroll.js' />"></script>--%>
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


</style>
</head>

<body>

<div class="wrapper">

    <jsp:include page="layout/navbar.jsp"/>

    <main>
        <div class="main-section">
            <div class="container">
                <div class="main-section-data">
                    <div class="row">


                        <%--Left Sidebar--%>
                        <div class="col-lg-3 col-md-4 pd-left-none no-pd">
                            <div class="main-left-sidebar no-margin">
                                <div class="user-data full-width">
                                    <div class="user-profile">
                                        <div class="username-dt">
                                            <div class="usr-pic">
                                                <c:choose>
                                                    <c:when test="${currentUser.profilePhoto.length()>4}">
                                                        <img src="/media/profile/${currentUser.profilePhoto}" alt=""  height="120px" width="120px">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="<c:url value='/images/user.jpg'/>" alt=""  height="120px" width="120px">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div><!--username-dt end-->
                                        <div class="user-specs">
                                            <h3>${currentUser.firstName} ${currentUser.lastName}</h3>
                                            <span>${currentUser.occupation}</span>
                                        </div>
                                    </div><!--user-profile end-->
                                    <ul class="user-fw-status">
                                        <%--<li>
                                            <h4>Following</h4>
                                            <span>34</span>
                                        </li>
                                        <li>
                                            <h4>Followers</h4>
                                            <span>155</span>
                                        </li>--%>
                                        <li>
                                            <a href="<c:url value='/profile/myProfile' />" title="">
                                                <spring:message code="profileList.viewProfile" text="View Profile" />
                                            </a>
                                        </li>
                                    </ul>
                                </div><!--user-data end-->

                                <div class="suggestions full-width">
                                    <div class="sd-title">
                                        <h3><spring:message code="profileList.suggestion" text="Suggestion"/> </h3>
                                        <%--                                        <i class="la la-ellipsis-v"></i>--%>
                                    </div><!--sd-title end-->
                                    <div id="follow" class="suggestions-list">

<%--                                        <c:forEach var="u" items="${userList}">--%>
<%--                                            <div class="suggestion-usd">--%>
<%--                                                <img src="<c:url value='/images/profile/${u.profilePic.length()>4 ? u.profilePic : "user.jpg"}'/>"--%>
<%--                                                     alt=""--%>
<%--                                                     width="45px" height="45px">--%>
<%--                                                <div class="sgt-text">--%>
<%--                                                    <h4>${u.firstName}</h4>--%>
<%--                                                    <span>${u.lastName}</span>--%>
<%--                                                </div>--%>
<%--                                                <span data-id="${u.userId}"><i class="la la-plus"></i></span>--%>

<%--                                            </div>--%>
<%--                                        </c:forEach>--%>

                                    </div><!--suggestions-list end-->
                                </div><!--suggestions end-->

                            </div><!--main-left-sidebar end-->
                        </div>


                        <%--Middle Area--%>


                        <div class="col-lg-6 col-md-8 no-pd">
                            <div class="main-ws-sec">
                                <div class="post-topbar">
                                    <h1><spring:message code="profileList.searchResult" text="Search Result"/> </h1>
                                </div><!--post-topbar end-->
                                <div class="posts-section">

                                    <c:forEach var="post" items="${allPost}">
                                        <div class="post-bar">

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
                                                        <a href="javascript:;" class="addlike ${post.id}-likes-wrap ${count == 0 ? 'not-active' : 'active'}" data-likeid="${likeid}" data-id="${post.id}" data-post="${post}"><i class="fas fa-heart"></i><span class="${post.id}-likes">${post.likeCount}</span>
                                                            <spring:message code="index.like" text="Like" />
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:;" class="addcomment " data-id="${post.id}" data-post="${post}"><i class="fas fa-comment-alt"></i><span class="${post.id}-comments">${post.commentCount}</span>
                                                            <spring:message code="index.comment" text="Comments"/>
                                                        </a>
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



<%--                                    <div class="process-comm">--%>
<%--                                        <div class="spinner">--%>
<%--                                            <div class="bounce1"></div>--%>
<%--                                            <div class="bounce2"></div>--%>
<%--                                            <div class="bounce3"></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>


                                </div><!--posts-section end-->
                                <div class="load-area" data-id="${currentUser.id}" ></div>
                                <c:if test="${allPost.size()==0}">
                                <div class="process-comm">
                                    <button class="btn btn-danger"><spring:message code="profileList.noresult" text="No Result Found!"/> </button>
                                </div>
                                </c:if>
                            </div><!--main-ws-sec end-->
                        </div>


                        <%--Right Sidebar--%>


                        <div class="col-lg-3 pd-right-none no-pd">
                            <div class="right-sidebar">

                                <div class="widget widget-ads">
                                    <div>${ads.adsTitle}</div>
                                    <img src="${ads.imageURL}"/>
                                </div><!--widget-jobs end-->
                                <div class="widget widget-weather">
                                    <a style="width: 200px; margin-left: auto; margin-right: auto"
                                       class="weatherwidget-io" href="https://forecast7.com/en/41d01n91d96/fairfield/"
                                       data-label_1="FAIRFIELD"
                                       data-label_2="WEATHER" data-font="Roboto Slab" data-icons="Climacons Animated"
                                       data-theme="clear">FAIRFIELD
                                        WEATHER</a>
                                </div><!--widget-about end-->
                            </div><!--right-sidebar end-->
                        </div>


                    </div>
                </div><!-- main-section-data end-->
            </div>
        </div>
    </main>





</div><!--theme-layout end-->
<script>
    $(function(){
        $(".following").click(function(){
            let userId = $(this).attr('id');
            let userClass = $(this).attr('class');
            ajaxSubmitLikes(userId,userClass)
        });

        function ajaxSubmitLikes(userId,userClass) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/follow",
                data: JSON.stringify(userId),
                dataType: 'json',
                headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
                success: function (data) {
                    console.log("SUCCESS : ", data);
                    $("a#"+userId+"."+userClass).text("Followed");
                },
                error: function (e) {
                    alert("You already follow this user!");
                }
            });
        }
    });

    $(function unfollow() {
        $(".unfollowing").click(function () {
            let userId = $(this).attr('id');
            let userClass = $(this).attr('class');
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/unfollow",
                data: JSON.stringify(userId),
                dataType: "json",
                headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
                success: function (data) {
                    console.log("SUCCESS : ", data);
                    $("a#"+userId+"."+userClass).text("Un-Followed");
                },
                error: function (e) {
                    alert("You are not following this user so you can't un-follow him/her!");
                }
            })
        })
    });
</script>
<jsp:include page="layout/footerScript.jsp"/>

<%--//for loading more posts--%>
<script src="/js/loadmore.js" type="text/javascript"></script>


<script type="text/javascript">
    $(function(){

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

        $(".addlike").click(function(){
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
            if(type == "DELETE"){
                var likeId = $("."+postId+"-likes-wrap").data("likeid");
                finalId = { "likeId": likeId, "postId": postId };
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
                    if(type == "POST"){
                        var likeIncrement = parseInt($("."+postId+"-likes").html()) + 1;
                        $("."+postId+"-likes-wrap").data("likeid", data.id);
                        console.log("likeIncrement value inside POST Condition", likeIncrement);
                    } else {
                        var likeIncrement = parseInt($("."+postId+"-likes").html()) - 1;
                        console.log("likeIncrement value inside DELETE Condition", likeIncrement);
                    }

                    $("."+postId+"-likes").text(likeIncrement);
                    console.log("likeIncrement value", likeIncrement);
                    if(!$("."+postId+"-likes-wrap").hasClass("active")){
                        $("."+postId+"-likes-wrap").addClass("active");
                    }else {
                        $("."+postId+"-likes-wrap").removeClass("active");
                    }

                },
                error: function (e) {
                    alert("Really sorry, something went wrong. Please try later")
                    console.log("ERROR : ", e);
                }
            });

        }

        $(".post-comment").submit(function(e){
            e.preventDefault();
            var postId = $(this).data("id");
            var post = $(this).data("post");
            // alert("Like me: " + post);
            ajaxSubmitComments(postId)
        })

        function ajaxSubmitComments(postId) {
            console.log("PostID", postId);
            var text = $("."+postId + "-text").val();
            console.log("text", text);
            var commentData = { "postId": postId, "text": text };
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
                    var commentIncrement = parseInt($("."+postId+"-comments").html()) + 1;
                    $("."+postId+"-comments").text(commentIncrement);
                    console.log("commentIncrement", commentIncrement);

                    //To prepend comment
                    $("."+postId+"-commentlist").prepend("<li>"+ text +"</li>");

                    $("."+postId+"-text").val("");

                },
                error: function (e) {
                    alert("Really sorry, something went wrong. Please try later")
                    console.log("ERROR : ", e);
                }
            });

        }


    })
</script>


<script>
    // !function (d, s, id) {
    //     var js, fjs = d.getElementsByTagName(s)[0];
    //     if (!d.getElementById(id)) {
    //         js = d.createElement(s);
    //         js.id = id;
    //         js.src = 'https://weatherwidget.io/js/widget.min.js';
    //         fjs.parentNode.insertBefore(js, fjs);
    //     }
    // }(document, 'script', 'weatherwidget-io-js');
</script>

</body>

</html>
