<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags />
<html>

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
                                <h1>Add text</h1>
                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        <form:input path="text" style="width: 100%" />
                                    </div><!--sn-field end-->
                                </div>


                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        Image Upload: <input type="file" name="imageFile" />
                                    </div><!--sn-field end-->
                                </div>

                                <div class="col-lg-12 no-pdd">
                                    <div class="sn-field">
                                        Video Upload: <input type="file" name="videoFile" />
                                    </div><!--sn-field end-->
                                </div>


                                <div class="col-lg-12 no-pdd">
                                    <button type="submit" value="submit" style="padding: 10px; background: #4267b2; color: #fff">Add Post</button>
                                </div>
                            </div>
                        </form:form>


                        <c:forEach items="${allPost}" var="post">
                            <div style="clear: both; border-bottom: 1px dashed #ccc;">
                            <br><br>
                            <c:if test="${post.text.length() > 0}">
                                <p><c:out value="${post.text}"/> </p>
                            </c:if>
                            <c:if test="${post.photo.length() > 0}">
                                <img src="/media/post/${post.photo}" />
                            </c:if>
                            <c:if test="${post.video.length() > 0}">
                                <video width="100%" controls>
                                    <source src="/media/post/${post.video}" type="video/mp4">
                                    Your browser does not support HTML5 video.
                                </video>
                            </c:if>
                                <input type="hidden" value="${post}" class="post-data">
                            <p style="font-size: 10px; overflow: hidden; clear: both;">
                                <span style="float: left"><a href="javascript:;" class="addlike" data-id="${post.id}" data-post="${post}"><span class="${post.id}-likes">${post.likeCount}</span> Like</a></span>
                                <span style="float: right">Created at:
                                <fmt:formatDate dateStyle="long" value="${post.creationDate}"  />
                                </span></p>
                            </div>
                        </c:forEach>
                        <c:if test="allPost">
                            Access
                        </c:if>
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
            ajaxSubmitLikes(postId)
        })

        function ajaxSubmitLikes(postId) {


            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "/addlike",
                data: JSON.stringify(postId),
                dataType: 'json',
                headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
                success: function (data) {
                    // alert("success");
                    console.log("SUCCESS : ", data);

                    var likeIncrement = parseInt($("."+postId+"-likes").html()) + 1;
                    $("."+postId+"-likes").text(likeIncrement);
                    console.log("likeIncrement", likeIncrement);

                },
                error: function (e) {
                    alert("Really sorry, something went wrong. Please try later")
                    console.log("ERROR : ", e);
                }
            });

        }
    })
</script>
</body>

<!-- Mirrored from gambolthemes.net/workwise-new/sign-in.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 22 Sep 2019 14:25:27 GMT -->
</html>