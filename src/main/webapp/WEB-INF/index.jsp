<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags />
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="layout/head.jsp"/>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>

<%--<form action="/follow/2" method="post">--%>
<%--    <input type="submit" name="submit" id="submit" value="submit">--%>
<%--</form>--%>

   <h1>INDEX</h1>
    <p><a href="javascript:" class="following" id="2">Follow</a></p>
    <p><a href="javascript:" class="unfollowing" id="2">Following</a></p>

    <p style="margin: 4%"><a href="/profileList">Profiles</a></p>



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/slick/slick.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
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
</body>
</html>
