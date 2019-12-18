<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfMetaTags />
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="layout/head.jsp"/>

	<style>
		div.company-title{
			background-color: #e44d3a;
		}

		#search_bar{
			margin: 9px;
		}
	</style>
</head>

<body>
	<div class="wrapper">
		<jsp:include page="layout/navbar.jsp"/>
		<section class="companies-info">
			<div class="container">
				<div class="company-title">
					<div id="search_bar" class="search-bar">
						<form>
							<input id="search" type="text" name="search" placeholder="Search User ...">
							<button type="submit"><i class="la la-search"></i></button>
						</form>
					</div>
				</div><!--company-title end-->
				<div class="companies-list">

					<div class="row">
						<div id="result"></div>
						<c:forEach var="i" items="${profiles}"  >
						<div class="col-lg-3 col-md-4 col-sm-6 col-12">
							<div class="company_profile_info">
								<div class="company-up-info">
									<c:choose>
										<c:when test="${i.profilePhoto.length()>4}">
											<img src="/media/profile/${i.profilePhoto}" alt="">
										</c:when>
										<c:otherwise>
											<img src="<c:url value='/images/user.jpg'/>" alt="">
										</c:otherwise>
									</c:choose>
									<h3><c:out value="${i.firstName}  ${i.lastName}" /></h3>
									<h4>${i.occupation}</h4>
									<ul>
										<li><a href="javascript:" class="follow" id="<c:out value="${i.id}" />">
											<spring:message code="profileList.follow" text="Follow"/>
										</a></li>
									</ul>
								</div>
								<a href="<c:url value="/profile/${i.id}" />" title="" class="view-more-pro">
									<spring:message code="profileList.viewProfile" text="View Profile"/>
								</a>
							</div><!--company_profile_info end-->
						</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</section><!--companies-info end-->

	</div><!--theme-layout end-->
	<jsp:include page="layout/footerScript.jsp"/>

	<script>
		//	this function is for following other users
		$(function(){
			$(document).on('click', ".follow", (function(){
				let userId = $(this).attr('id');
				let userClass = $(this).attr('class');
				ajaxSubmitLikes(userId, userClass, name)
			}));

			function ajaxSubmitLikes(userId, userClass, name) {
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

		//this function is for unfollowing the followed users
		$(function() {
			$(document).on('click', ".unfollowing", (function(){
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
			}))
		});

		//this function is for instance searching the users
		$(function () {
			$("#search").keyup(function(e) {
				let username = $(this).val();

				$.ajax({
					type: "POST",
					contentType: "application/json",
					url: "/search",
					data: username,
					dataType: "json",
					headers: {"X-CSRF-TOKEN": $("meta[name='_csrf']").attr("content")},
					success: function (data) {
						let result = [];
						$(data).each(function (index, value) {
							if(value.profilePhoto){
								result.push(
										'<div class="col-lg-3 col-md-4 col-sm-6 col-12">' +
										'<div class="company_profile_info">' +
										'<div class="company-up-info">' +
										'<img src="/media/profile/' + value.profilePhoto + '" alt="profile photo">' +
										'<h3>' + value.firstName + ' ' + value.lastName + '</h3>' +
										'<h4>' + value.occupation + '</h4>' +
										'<ul>' +
										'<li><a href="javascript:" class="follow" id="' + value.id + '">Follow</a></li>' +
										'</ul>' +
										'</div>' +
										'<a href="/profile/' + value.id + '" class="view-more-pro"> View Profile </a>' +
										'</div>' +
										'</div>'
								)
							}else{
								result.push(
										'<div class="col-lg-3 col-md-4 col-sm-6 col-12">' +
										'<div class="company_profile_info">' +
										'<div class="company-up-info">' +
										'<img src="/images/user.jpg" alt="profile photo">' +
										'<h3>' + value.firstName + ' ' + value.lastName + '</h3>' +
										'<h4>' + value.occupation + '</h4>' +
										'<ul>' +
										'<li><a href="javascript:" class="follow" id="' + value.id + '">Follow</a></li>' +
										'</ul>' +
										'</div>' +
										'<a href="/profile/' + value.id + '" class="view-more-pro"> View Profile </a>' +
										'</div>' +
										'</div>'
								)
							}

						});
						$(".row").html(result);
					},
					error: function (e) {
						// alert("search not found");
					}
				})
			})
		})
	</script>
</body>
</html>