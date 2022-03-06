<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<!-- 불러오는 곳 지정 -->
	<div id="readEditor">
	${uploadFile.test_content }
	</div>
	
	
	
	
<script>
// 불러오는 자바스크립트(툴바삭제, 읽기만 가능)
ClassicEditor
.create( document.querySelector( '#readEditor' ))

.then( editor => {
	window.editor = editor;
	editor.isReadOnly = true;
	const toolbarElement = editor.ui.view.toolbar.element;
	toolbarElement.style.display = 'none';
} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	console.warn( 'Build id: g64ljk55ssvc-goqlohse75uw' );
	console.error( error );
} );
</script>
</body>
</html>