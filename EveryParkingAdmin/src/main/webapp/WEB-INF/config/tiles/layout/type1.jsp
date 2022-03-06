<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <jsp:include page="./commInclude.jsp"></jsp:include>
    <tiles:insertAttribute name="title"/>
</head>
    <body>
        <div class="mb-5">
            <div class="container-fluid">
                <div class="row mt-5 bodyBox">
                    <!-- aside 부분  -->
                    <div class="nav">
                        <tiles:insertAttribute name="menu"/>
                    </div>
                    <div class="content">
                        <tiles:insertAttribute name="body"/>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
