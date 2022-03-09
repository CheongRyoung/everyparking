<%--
  Created by IntelliJ IDEA.
  User: Yong
  Date: 2022-03-09
  Time: 오후 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="/test/uploadFileSubmit" method="post" enctype="multipart/form-data">
    <button type="button" onclick="testLogin()">로그인부터 하자</button>

    <div> 로그인된 ID :: ${sessionScope.member.member_no}</div>
    <div>
        <label>파일테스트</label>
        <input type="file" name="files" id="files" multiple>
        <button type="submit">SUBMIT</button>
    </div>
</form>
<script type="text/javascript">
    function testLogin(){
        ajaxCall("/test/testlogin", {}, function(data){
            console.log(data);
        })
    }
</script>