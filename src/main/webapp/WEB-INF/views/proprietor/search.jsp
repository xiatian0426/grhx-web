<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>中项招标网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="${jsRoot}/jquery-1.11.1.min.js"></script>
	<!-- 引入分页 -->
	<script src="${jsRoot}/page.js"></script>
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
	<script type="text/javascript">
		$(function(){
			//函数来源page.js
			page("searchForm", ${page.pageInfo}, "pageProprietorList");
		});
		function check(){
			var selected = $("#selected").text();
			var contentQuery = $("#contentQuery").val();
			if(selected=='标题'){
				$("#titlee").val(contentQuery);
				$("#contentt").val("");
			}else{
				$("#contentt").val(contentQuery);
				$("#titlee").val("");
			}
		}
	</script>
	<style>
		.active{
			background-color:#A0E0F7;
			border-radius:4px;
			border:1px solid transparent;
			font-weight:bold;
		}
	    .r_box table tr{
	       height:40px;
	        }
	    .r_box table td{
	       font-size:14px;
	    }
	    .tit-td{
	       text-align: left;
           text-indent: 20px;
	    }
	    .pagination li{float:left; padding:2px 10px;font-size:10px;font-weight:bold;}
	    
	    .inputSearch{
	    	width: 210px;
		    border: 1px solid #aaa;
		    height: 26px;
		    border-radius: 4px;
		    margin-right: 31px;
		    text-indent: 10px;
	    }
	</style>
</head>
<body>
			
<jsp:include  page="../def/top.jsp"/>
<!-- 引入 select2 -->
<link href="${toolRoot}/select/select2.min.css" rel="stylesheet">
<script src="${toolRoot}/select/select2.full.min.js"></script>
<script src="${toolRoot}/select/select2-self.js"></script>
<div class="content" style="width: 1000px;margin: 0 auto;">
	<form action="/messageData/goSearchProprietor" name="searchForm" method="post" target="_self" id="searchForm" onsubmit="return check();">
		<div class="r_box" style="margin-top: 10px;margin-bottom: 10px;">
			<div style="height: 15px; width: 100%;"><span></span></div>
				筛选条件：<span class="infoLable">公司名称：</span>
				<input name="company" type="text" class="inputSearch" value="${query.company }"/ >
				<span class="infoLable">类别：</span>
				<select class="select-nosearch" name="type" style="width: 120px;height: 28px;">
					<option value="" selected="selected">---请选择---</option>
					<option value="1" <c:if test="${query.type=='1' }">selected="selected"</c:if>>业主库</option>
					<option value="2" <c:if test="${query.type=='2' }">selected="selected"</c:if>>设计院库</option>
					<option value="3" <c:if test="${query.type=='3' }">selected="selected"</c:if>>代理机构库</option>
				</select>
			<button type="submit" class="btn btn-default"
					style="background-color:#4562ef;padding: 6px 13px;border:none;color:#fff;">搜索</button>
			<br />
			<div><span></span></div>
		</div>

<div class="r_box" style="margin-bottom: 10px;">
	<table width="100%" cellpadding="0" cellspacing="0" class="table-bordered" style="border: 2px solid #307DB4;">
		<tr style="height:30px;background-color: #CCE4F7;" >
			<td width="10%" align="center" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				序号
			</td>
			<td width="60%" align="left" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				名称
			</td>
			<td width="30%" align="left" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;border-right: 2px solid #307DB4;">
				类型
			</td>
		</tr>
		<c:forEach items="${page.result}" var="proprietor" varStatus="count">
			<tr>
				<td align="center"  style="border: 1px solid #CCE4F7;">
					${count.count}
				</td>
				<td align="left"  style="border: 1px solid #CCE4F7;">
					<a href="/messageData/proprietorDetail?id=${proprietor.id}'">&nbsp;${proprietor.company}</a>
				</td>
				<td align="left"  style="border: 1px solid #CCE4F7;border-right: 2px solid #307DB4;">
					<c:if test="${proprietor.type=='1' }">&nbsp;业主库</c:if>
					<c:if test="${proprietor.type=='2' }">&nbsp;设计院库</c:if>
					<c:if test="${proprietor.type=='3' }">&nbsp;代理机构库</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" height="40"  align="left" class="pageProprietorList">
			</td>
		</tr>
	</table>
</div>

</form>
</div>
<jsp:include  page="../def/footer.jsp"/>
</body>
</html>