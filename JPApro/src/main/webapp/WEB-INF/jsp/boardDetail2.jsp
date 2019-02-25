<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>

<script>

</script>
</head>
<body>
	<h1>글 상세보기</h1>

	<div id="boardArea">

		<table>
			<tr>
				<td>
					<table>
						<form method="POST" id="my_form" action="writeBoardAct">
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input name="subject" size="50" maxlength="100"
									value="${vo.subject }"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">작성자</td>
								<td><input name="writer" size="50" maxlength="50"
									value="${vo.writer }"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<!-- 							<tr> -->
							<!-- 								<td>&nbsp;</td> -->
							<!-- 								<td align="center">비밀번호</td> -->
							<!-- 								<td><input name="password" size="50" maxlength="50"></td> -->
							<!-- 								<td>&nbsp;</td> -->
							<!-- 							</tr> -->
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="content" cols="50" rows="13"">${vo.content }</textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr height="1" bgcolor="#82B5DF">
								<td colspan="4"></td>
							</tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type=submit value="수정"> <input
									type=button value="취소" onclick="javascript:history.go(-1);">
								<td>&nbsp;</td>
								<input type="hidden" id="id" name="id" value="${vo.id }">
							</tr>
						</form>
						<form id="deleteForm" method="POST" action="deleteBoard">
							<input type="hidden" name="id" value="${vo.id }">
							<input type="hidden" name="page" value="0">
							<input type="submit" value="삭제">
						</form>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>