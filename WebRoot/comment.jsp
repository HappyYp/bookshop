<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html>
<head>
<title><bean:message key="website.title" />
</title>
<link href="CSS/stylesheet.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="JS/jsonrpc.js"></script>
</head>
<body class="body">
	<table width="780" border="0" align="center" cellpadding="0"
		cellspacing="0" bgcolor="#FFFFFF"
		style="border:1px; border-style:solid; border-color:#888888">
		<tr>
			<td width="20">&nbsp;</td>
			<TD height="50" align="right" valign="bottom"><IMG
				src="images/icon_login.gif" align=absMiddle> <INPUT id="qKey"
				name="qKey" value="商品关键字" onClick="this.value=''"> <select
				id="category">
					<option value="0">所有商品</option>
					<logic:present name="cateList">
						<logic:iterate id="cate" name="cateList"
							type="com.bookshop.domain.Category">
							<option value="${cate.id}">${cate.cateName}</option>
						</logic:iterate>
					</logic:present>
			</select> <A href="javascript:QuickSearch()"><IMG
					src="images/icon_search.gif" align="absMiddle" border="0">
			</A></TD>
			<td width="20">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					<TR align="center">
						<TD valign="top" width="9"><IMG src="images/icon02.gif">
						</TD>
						<TD class="header_menu" align="middle"><A
							href="merAction.do?method=browseIndexMer"><span
								class="whiteTitle"><bean:message key="menu.item1" />
							</span>
						</A></TD>
						<TD background="images/Bule_06.gif" width="2"></TD>
						<TD class="header_menu" align="middle"><A
							href="manageCartAction.do?method=browseCart"><span
								class="whiteTitle"><bean:message key="menu.item2" />
							</span>
						</A></TD>
						<TD background="images/Bule_06.gif" width="2"></TD>
						<TD class="header_menu" align="middle"><A
							href="orderAction.do?method=browseOrders"><span
								class="whiteTitle"><bean:message key="menu.item3" />
							</span>
						</A></TD>
						<TD background="images/Bule_06.gif" width="2"></TD>
						<TD class="header_menu" align="middle"><A
							href="leavewordAction.do?method=browseLeavewords&pageNo=1"><span
								class="whiteTitle"><bean:message key="menu.item4" />
							</span>
						</A></TD>
						<TD background="images/Bule_06.gif" width="2"></TD>
						<TD class="header_menu" align="middle"><A
							href="updateMemberAction.do?method=browseMember"><span
								class="whiteTitle"><bean:message key="menu.item5" />
							</span>
						</A></TD>
						<TD vAlign=top width=7><IMG src="images/icon07.gif">
						</TD>
					</TR>
				</TABLE>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<table width="94%" border="0" align="center" cellpadding="0"
					cellspacing="1" bgcolor="#FFFFFF">
					<tr>
						<td height="80" colspan="2"><IMG src="images/icon_goods.gif"
							width="150" height="29">
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td height="40" colspan="2" align="left" class="text"><logic:present
								name="mer" property="picture">
								<img src="${mer.picture}" border="0" align="left">
							</logic:present> &nbsp;<bean:message key="mer.category" />：${mer.category.cateName}<br>
							&nbsp;<bean:message key="mer.name" />：${mer.merName}<br>
							&nbsp;<bean:message key="mer.model" />：${mer.merModel}<br>
							&nbsp;<bean:message key="mer.price" />：￥${mer.price}<br> <logic:equal
								name="mer" property="special" value="1">
					&nbsp;<bean:message key="mer.sprice" />：￥${mer.sprice}<br>
							</logic:equal> &nbsp;<bean:message key="mer.manufacturer" />：${mer.manufacturer}<br>
							&nbsp;<bean:message key="mer.leaveFactoryDate" />：${mer.leaveFactoryDate}<br>
							&nbsp;<bean:message key="mer.desc" />：${mer.merDesc}<br></td>
						
					</tr>
				</table>
			</td>
			<td>&nbsp;</td>
		</tr>
					<!-- comment region  -->
		<tr>
			<td>&nbsp;</td>
			<td><html:form
					action="/commentAction.do?method=submitComment&merId=${mer.id}">
					<table width="600" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr height="30">
							<td width="100" align="right">评分：</td>
							<td>好评:<html:radio property="commentLevel" value="好评"  />  
								中评:<html:radio property="commentLevel" value="中评" />
								差评:<html:radio property="commentLevel" value="差评" />
							</td>									  
						</tr>
						<tr height="30">
							<td valign="top" align="right">内容：</td>
							<td><html:textarea property="commentContent" cols="40"
									rows="10" styleClass="textBox" value="" /></td>
						</tr>
						<tr height="30">
							<td colspan="2" align="center"><html:reset>
									<bean:message key="reset.text" />
								</html:reset> <html:submit>
									<bean:message key="submit.text" />
								</html:submit>
							</td>
						</tr>
						<%-- 								<tr>
									<td height="30" align="center" colspan="2" class="redText">
										<html:errors property="addCateStatus" /></td>
								</tr> --%>
					</table>
				</html:form></td>
			<td>&nbsp;</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<td height="30">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td height="30" bgcolor="#4282CE" class="whiteText" align="center">
				<bean:message key="website.foot" />
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td height="20">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	<script language="javascript">
		//搜索商品
		function QuickSearch() {
			var url = "merAction.do?method=searchMerByKeyAndCate&cateId="
					+ document.all.category.value + "&pageNo=1"
			var key = document.all.qKey.value;
			if (key != null && key != "商品关键字" && key.length > 0)
				url = url + "&key=" + key;
			window.location = url;
		}
	</script>
</body>
</html>