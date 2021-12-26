<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호변경</title>
<style>
	div h2 {
  		margin: 0 auto;
  		text-align: center;
	}
    div#updatePassword-container{
        background: rgba(149, 178, 142, 0.5);
    }
    div#updatePassword-container table {
        margin:0 auto;
        border-spacing: 30px;
    }
    div#updatePassword-container table tr:last-of-type td {
        text-align:center;
    }
    #button input {
		cursor: pointer;
		border: 0;
		width: 100px;
		height: 30px;
		background-color: #A4835F;
		border-radius: 10px;
		color: rgb(245, 234, 234);
	}
</style>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
	<div id="updatePassword-container">
		<form action="${ pageContext.request.contextPath }/updatePwd" name="frm" method="post">
			<table>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="userPwd" id="pass1"  required>
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" id="pass2">
					</td>
				</tr>
				<tr>
					<td colspan="2" id="button">
						<input type="submit" value="변경" onclick="return validate();">
						&nbsp;
						<input type="button" value="닫기" onclick="self.close();">
					</td>
				</tr>
			</table>
			<input	type="hidden" name="userId">	
		</form>
	</div>
	<script>
	
		function validate() {
			
			
			let pass1 = $("#pass1").val();
			let pass2 = $("#pass2").val();
			
			if(pass1.trim() != pass2.trim()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pass1").val("");
				$("#pass2").val("");
				$("#pass1").focus();
				
				return false;
			}
		}
	</script>
</body>
</html>












