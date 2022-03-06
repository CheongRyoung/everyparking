<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <jsp:include page="./commInclude.jsp"></jsp:include>
</head>
    <body>
        <div class="mainWrapper">
            <tiles:insertAttribute name="body"/>
        </div>
    </body>
</html>
