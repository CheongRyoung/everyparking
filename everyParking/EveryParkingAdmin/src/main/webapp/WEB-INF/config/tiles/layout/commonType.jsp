<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="headPart/commInclude.jsp"></jsp:include>
    <tiles:insertAttribute name="title"/>
</head>
    <body>
    <tiles:insertAttribute name="header"/>
    <div class="container-fluid" style="height: 100%;">
        <div class="row"  style="height: 100%;">
                    <!-- 왼편 사이드바 -->
                        <tiles:insertAttribute name="menu"/>
                    <!-- 본문 -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 bg-light bg-gradient">
                <div class="row  mt-3">
                    <tiles:insertAttribute name="body"/>
                </div>
            </main>
        </div>
    </div>
    </body>
    <jsp:include page="bottomPart/commInclude.jsp"></jsp:include>
</html>
