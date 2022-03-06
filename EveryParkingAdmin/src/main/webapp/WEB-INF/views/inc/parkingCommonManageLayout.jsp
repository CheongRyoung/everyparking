<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/ckeditor/build/ckeditor.js"></script>
<style>
	.ck-editor__editable {
	    min-height: 300px;
	}
</style>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- 정의 -->
<link rel="stylesheet" href="../css/adminCss.css">
<link rel="stylesheet" href="../css/modalCss.css">

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
	
<script>
let editor;

ClassicEditor
.create( document.querySelector( '#writeEditor' ) , {
	ckfinder: {
		uploadUrl: 'http://localhost:8123/admin/test/imageUpload'
	}
} )
.then( newEditor => {
        editor = newEditor;
    } )

.then( editor => {
	window.editor = editor;

} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
	console.error( error );
} );

function uploadData() {
	const editorData = editor.getData();
	console.log(typeof(editorData));
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4&&xhr.status==200) {
			
		}
	}
	xhr.open("post", "../test/uploadTest", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	xhr.send("editorData="+editorData);
}
</script>
</body>
<tiles:insertAttribute name="modal"/>
</html>