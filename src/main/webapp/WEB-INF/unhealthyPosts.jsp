<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="layout/head.jsp"/>
    <style type="text/css">
        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
        }

        .tablecell {
            padding: 16px;
            font-size: 16px;
            border: none;
        }

        .tableheadercell {
            padding: 16px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            text-align: center;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            /*min-width: 160px;*/
            border-radius: 5px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #3e8e41;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="layout/navbar.jsp"/>
    <div class="container">
        <div class="tableheadercell">
            <h1><spring:message code="PostList.header"/>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-md-center table-dark tableheadercell">
            <div class="col-lg-10 no-pdd">
                <spring:message code="PostList.postText"/>
            </div>
            <div class="col-lg-1 no-pdd"><spring:message code="PostList.approvePost"/></div>
        </div>
        <form:form modelAttribute="postList" method="post">
            <c:forEach var="post" items="${postList}" varStatus="postIndex">
                <div class="row justify-content-md-center table-bordered" id="PostNo-${post.id}">
                    <div class="col-lg-10 no-pdd tablecell">
                            ${post.text}
                    </div>
                    <div class="dropdown col-lg-1 no-pdd">
                        <button class="dropbtn"><spring:message code="PostList.Decision"/></button>
                        <div class="dropdown-content">
                            <a href="javascript:;" class="approvePost" data-id="${post.id}"
                               data-enable='true'>
                                <spring:message code="Yes"/>
                            </a>
                            <a href="javascript:;" class="disapprovePost" data-id="${post.id}"
                               data-enable='false'>
                                <spring:message code="No"/>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </form:form>
    </div>
</div><!--theme-layout end-->
<jsp:include page="layout/footerScript.jsp"/>
</body>
<script type="text/javascript" src="/js/postAndUserManagement_Aser.js"></script>
</html>