<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <jsp:include page="headPart/commInclude.jsp"></jsp:include>
    <tiles:insertAttribute name="title"/>
</head>
    <body>
        <div class="mb-5">
            <div class="container-fluid">
                <div class="row mt-5 bodyBox">
                    <!-- 왼편 사이드바 -->
                        <tiles:insertAttribute name="menu"/>
                    <!-- 본문 -->
                        <tiles:insertAttribute name="body"/>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="bottomPart/commInclude.jsp"></jsp:include>
</html>
