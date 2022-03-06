<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>


<title><tiles:getAsString name="title"/></title>


</head>
<body>
<body style="background-color: #e0e0e0;">
	<div style="margin: auto" class="mb-5">
		<div class="container-fluid">
			<div class="row mt-5 bodyBox">
	<!--  aside 부분  -->
	<tiles:insertAttribute name="aside"/>
	<tiles:insertAttribute name="body"/>
	
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
<tiles:insertAttribute name="modal"/>
</html>