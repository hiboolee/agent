<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						�ļ�Ŀ¼ɾ��
					</div>
				</td>
			</tr>
			<tr> 
			<td width="50%"><div align="center">Ŀ¼��</div></td>
			<td width="50%"><div align="center">ɾ��</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select * from t_catalog where c_sys = 1  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td><div align="center">${row.c_name }</div></td>  		
			<td   valign="middle" align="center"> 		
			<html:form  action="/file" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="catalog_add_delete"/>
			<nested:nest property="file">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden> 			 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="ɾ ��"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
