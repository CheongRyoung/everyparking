<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <jsp:include page="headPart/commInclude.jsp"></jsp:include>
    <tiles:insertAttribute name="title"/>
</head>
<body>
    <tiles:insertAttribute name="body"/>

    <tiles:insertAttribute name="footer"/>
    <tiles:insertAttribute name="menu"/>
</body>
    <jsp:include page="bottomPart/commInclude.jsp"></jsp:include>
</html>
