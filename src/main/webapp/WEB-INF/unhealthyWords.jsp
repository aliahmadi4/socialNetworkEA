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

        .dropbtn a {
            color: white;
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
            <h1><spring:message code="WordList.header"/>
        </div>
    </div>
    <div class="container">
        <form:form modelAttribute="unhealthyWordList" action="unhealthyWords/add" method="post">
            <div class="row justify-content-md-center table-bordered col-lg-12">
                <input id="wordToAdd" type="text" placeholder="Enter a new word and click 'Add new word'"
                       class="table-dark tablecell col-lg-4 no-pdd"/>
                <div id="addUnhealthyWord" class="justify-content-md-center dropbtn col-lg-2">
                    <a href="javascript:;"><spring:message code="WordList.add"/></a>
                </div>
            </div>
            <c:forEach var="i" items="${unhealthyWordList}">
                <div class="row" id="listOfWords-${i.word}">
                    <div class="col-lg-2 no-pdd"></div>
                    <div class="col-lg-6 no-pdd tablecell">
                        <c:out value="${i.word}"/> (<a href="javascript:;" class="deleteUnhealthyWord"
                                                       data-id="${i.word}"><spring:message code="WordList.delete"/></a>)
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