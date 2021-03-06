<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_ptclass where c_no = ${param.c_no } "></sql:query>
		<html:form  action="/product" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="ptclass"/>
		<nested:nest property="product">	
		<nested:hidden property="c_jobnm" value="update"></nested:hidden>
		<nested:hidden property="c_no" value="${q1.rows[0].c_no}"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						产品分类修改
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">性质</div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_namecode where c_type=30"></sql:query>
					<nested:select property="c_ptnature" value="${q1.rows[0].c_ptnature }">
					<c:forEach items="${q2.rows }" var="row">
					<html:option value="${row.c_code }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>
			</tr>  
			<tr>
				<td width="48%"><div align="right">分类</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="${q1.rows[0].c_name }" styleId="req" title="分类不能为空 "></nested:text>
				</div>
				</td>
			</tr> 
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="确 定"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
