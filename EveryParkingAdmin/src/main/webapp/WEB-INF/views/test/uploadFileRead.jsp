<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script src="/resources/js/ckeditor/build/ckeditor.js"></script>
	<style>
		.ck-editor__editable {
			min-height: 300px;
		}
	</style>
	<!-- 불러오는 곳 지정 -->
	<div id="readEditor">
		${uploadFile.test_content }
	</div>
	<button onclick="confirmTest()">컨펌테스트</button>
	<table id="testGrid"></table>

	<script type="text/javascript" src="/resources/js/common/editor.js"></script>
	<script type="text/javascript" src="/resources/js/test/uploadFileRead.js"></script>