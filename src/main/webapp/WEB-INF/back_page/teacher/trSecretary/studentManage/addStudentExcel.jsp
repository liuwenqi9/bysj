<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/back_page/tag.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/back_page/common_css.jsp"%>
<%@ include file="/WEB-INF/back_page/common_js.jsp"%>
<title>批量添加学生</title>
<script type="text/javascript">
	function sysusersave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：sysusersave_callback是回调函数，sysusersave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('userform', sysusersave_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function sysusersave_callback(data) {

		//action返回的是json数据
		//如果是成功显示一个对号
		//如果是错误信息
		//提交结果类型
		//data中存放的是action返回Resultinfo，有一个type
		var type = data.resultInfo.type;
		//结果提示信息
		var message = data.resultInfo.message;
		//alert(message);
		if (type == 0) {
			//如果type等于0表示失败，调用 jquery easyui的信息提示组件
			$.messager.alert('提示信息', message, 'error');
		} else if (type == 1) {
			$.messager.alert('提示信息', message, 'success');
		} else if (type == 2) {
			$.messager.alert('提示信息', message, 'warning');
		} else if (type == 3) {
			$.messager.alert('提示信息', message, 'info');
		}

	}
</script>
</head>
<body>


	<form id="userform"
		action="/teacher/trSecretary/studentManage/addStudentByExcel.do"
		method="post" enctype="multipart/form-data">
		<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
			bgColor=#c4d8ed>

			<TBODY>
				<TR>
					<TD class="left">班级名称：</TD>
					<td><select id="" name="classisId" style="width: 250px">
							<option value="">全部</option>
							<c:forEach items="${classes}" var="classe">
								<option value="${classe.classisId}">${classe.className}</option>
							</c:forEach>
					</select></td>
				</TR>
				<TR>
					<TD>
				<TR>
					<TD class="left" >excel文件：</TD>
					<TD class=category>
						<div>
							<input type="file" id="sysuser_userid" name="excel" />
						</div> <!-- sysuser_useridTip用于显示提示信息，提示div的id等于校验input的id+Tip -->
						<div id="sysuser_useridTip"></div>
				</TR>
				<tr>
					<td colspan=4 align=center class=category><a id="submitbtn"
						class="easyui-linkbutton" iconCls="icon-ok" href="#"
						onclick="sysusersave()">上传</a> <a id="closebtn"
						class="easyui-linkbutton" iconCls="icon-cancel" href="#"
						onclick="parent.closemodalwindow()">关闭</a></td>
				</tr>
				</TD>
				</TR>
			</TBODY>
		</TABLE>
	</form>
</body>
</html>