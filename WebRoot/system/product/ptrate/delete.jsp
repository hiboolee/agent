<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>���ַ���ɾ��</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>		
<body  >
		<form action="../../../toModule.do?prefix=/system&page=/product/ptrate/delete2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						����ɾ��
				</td>
			</tr>
		</table> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
			  <td align="right" width="50%">���չ�˾</td>
				<td width="57%" align="left">
					 <select name="c_companyid" id="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type =3001"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">
								${row.c_name}
							</option>
						</c:forEach>
					 </select>	
				</td>
			</tr>
			<tr>
				<td align="right">
					��������
				</td>
				<td align="left"> 
					<select name="c_productid" id="c_productid">
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" value="ȷ ��"/>
				</td>
				<td align="left">
					<input type="reset" value="ȡ ��"/>
				</td>
			</tr>		 
		</table>
	</form>	
	</body>
</html:html>
<script type="text/javascript">	
			function set()
			{
				var c_companyid = $("c_companyid").value;	
				Product.get_product(c_companyid, get);
				return false;
			}	
			function get(datas)
			{					
				DWRUtil.removeAllOptions('c_productid');					
				DWRUtil.addOptions('c_productid', datas, 'value', 'label');
			}	
			set()
			</script> 	