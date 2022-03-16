<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
