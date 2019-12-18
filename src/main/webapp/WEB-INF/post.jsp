<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags />
<html>
<head>
    <jsp:include page="layout/head.jsp"/>
</head>
<!-- Mirrored from gambolthemes.net/workwise-new/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:26 GMT -->
<head>
    <meta charset="UTF-8">
    <title>Post</title>
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

    <style type="text/css">
        ul.comments-list{
            list-style: none;
            margin: 0; padding: 0;
            width: 100%;
            clear: both;;
            overflow-y: scroll;
        }

        ul.comments-list li {
            padding: 10px; margin: 0; list-style: none;
            border-bottom: 1px dashed #ccc;
            font-size: 14px;
            display: block;
            background: #f7f7f7;
            color: #696868;

        }

        ul.comments-list li:nth-child( even ) {
            background: #eeeeee;
        }

        ul.comments-list li:last-child {
            border: none;
            padding-bottom: 0;
        }

        .comment-text{
            width: calc(100% - 80px);
            height: 23px;
            border: 1px solid #bfbfbf;
            font-size: 13px;
            padding-left: 10px;
            padding-right: 10px;
            color: #4e555b;
        }

        .comment-submit{
            width: 81px;
            float: right;
            padding: 3px;
            height: 23px;
            margin-left: -1px;
            border: 1px solid #bfbfbf;
            position: relative;}

        .addlike {
            margin-right: 10px;
            color: #4e555b;
        }

        .addlike.active {
            color: rgb(0, 123, 255);
        }

        /*.addlike.not-active {*/
        /*    color: #4e555b;*/
        /*}*/
        /*.addcomment {*/
        /*    margin-right: 10px;*/
        /*}*/
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

                        </div><!--cmp-info end-->
                    </div>
                    <div class="col-lg-6">

                        <form:form modelAttribute="addPost" action="post" enctype="multipart/form-data" method="post" >
                            <div class="row" style="border: 1px solid #ccc; background: #f9f9f9; padding: 10px; margin-top: 15px;">
                                <h1><spring:message code="post.addText" text="Add text"/> </h1>
                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        <form:input path="text" style="width: 100%" required="true" />
                                    </div><!--sn-field end-->
                                </div>


                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        <spring:message code="post.uploadImg" text="Image Upload:"/>
                                        <input type="file" name="imageFile" />
                                    </div><!--sn-field end-->
                                </div>

                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        <spring:message code="post.videoUpload" text="Video Upload:"/>
                                        <input type="file" name="videoFile" />
                                    </div><!--sn-field end-->
                                </div>

                                <input type="checkbox" name="notifyAllFollowers" checked="true" />
                                <spring:message code="post.notify" text="Notify all users" /><br><br>

                                <div class="col-lg-12 no-pdd">
                                    <button type="submit" value="submit" style="padding: 10px; background: #4267b2; color: #fff">
                                        <spring:message code="post.addPost" text="Add Post"/>
                                    </button>
                                </div>
                            </div>
                        </form:form>
                            <spring:message code="post.userId" text="User Id:"/>

                        <c:forEach items="${allPost}" var="post">
                            <div style="clear: both; border-bottom: 1px dashed #ccc; background: #f5f4f4; padding: 10px; margin-top: 10px;" class="${post.id}-wrap">

                            <c:if test="${post.text.length() > 0}">
                                <p style="padding-bottom: 8px;"><c:out value="${post.text}"/> </p>
                            </c:if>
                            <c:if test="${post.photo.length() > 0}">
                                <img src="/media/post/${post.photo}" />
                            </c:if>
                            <c:if test="${post.video.length() > 0}">
                                <video width="100%" controls>
                                    <source src="/media/post/${post.video}" type="video/mp4">
                                    <spring:message code="index.video" text="Your browser does not support HTML5 video."/>
                                </video>
                            </c:if>
                                <input type="hidden" value="${post}" class="post-data">


                            <p style="font-size: 10px; overflow: hidden; clear: both;">
                                <span style="float: left">
                                    <c:set var="count" value="${0}" />
                                    <c:set var="likeid" value="${0}" />
                                    <c:forEach items="${post.likes}" var="like">
                                        <c:if test = "${like.user.id == userId}">
                                            <c:set var="count" value="${count+1}" />
                                            <c:set var="likeid" value="${like.id}" />
                                        </c:if>
                                    </c:forEach>
                                    <a href="javascript:;" class="addlike ${post.id}-likes-wrap  ${count == 0 ? 'not-active' : 'active'}" data-likeid="${likeid}" data-id="${post.id}" data-post="${post}"><span class="${post.id}-likes">${post.likeCount}</span> <spring:message code="index.like" text="Like"/></a>
                                    <a href="javascript:;" class="addcomment " data-id="${post.id}" data-post="${post}"><span class="${post.id}-comments">${post.commentCount}</span> <spring:message code="index.comment" text="Comments" /></a>
                                </span>
                                <span style="float: right"><spring:message code="post.createAt" text="Created at:"/>
                                <fmt:formatDate dateStyle="long" value="${post.creationDate}"  />

                                </span></p>
                                <div class="comments">
                                    <div class="col-lg-12 no-pdd">
                                        <div class="sn-field no-margin">
                                            <form class="post-comment" data-id="${post.id}" data-post="${post}">
                                                <input type="text" name="text" class="comment-text ${post.id}-text" required   />
                                                <input type="submit" class="comment-submit" value="Submit" >
                                            </form>
                                        </div><!--sn-field end-->
                                    </div>
                                    <ul class="comments-list ${post.id}-commentlist">
                                        <c:forEach items="${post.comments}" var="comment">
                                            <li> ${comment.text}</li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </c:forEach>
                    </div>
                </div>
            </div><!--signin-pop end-->
        </div><!--signin-popup end-->
    </div><!--sign-in-page end-->


</div><!--theme-layout end-->



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/slick/slick.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
    $(function(){

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
<jsp:include page="layout/footerScript.jsp"/>
</body>

<!-- Mirrored from gambolthemes.net/workwise-new/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:27 GMT -->
</html>