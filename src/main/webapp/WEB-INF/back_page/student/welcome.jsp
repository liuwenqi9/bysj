<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/back_page/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="styles/SystemStyle.css" rel="stylesheet" type="text/css" />
<title></title>
<style type="text/css">
body {
	margin-top: 180px;
}
</style>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<c:if
				test="${sessionScope.student_session.student.studentState != 0 }">
				<td align="center"><img src="/res/images/welcome.gif"
					width="145" height="46" /></td>
			</c:if>
			<c:if
				test="${sessionScope.student_session.student.studentState == 0 }">
				<td align="center"><img src="/res/images/InfoNot.png"
					width="145" height="46" /></td>
			</c:if>
		</tr>
	</table>
</body>
</html>

