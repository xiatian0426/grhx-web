<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>中国招投标项目网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="${jsRoot}/jquery-1.11.1.min.js"></script>
	<!-- 日历控件 -->
	<script type="text/javascript" src="${toolRoot }/My97DatePicker/WdatePicker.js"></script>
	<!-- 引入分页 -->
	<script src="${jsRoot}/page.js"></script>
	<link rel="stylesheet" href="${cssRoot}/main.css"/>
	<script type="text/javascript">
		$(function(){
			var province = $("#province").val();
			if(province=="" || province=="0" ||province==null){
				$("#provinceShow").show();
				$("#provinceHide").hide();
			}else{
				$("#provinceShow").hide();
				$("#provinceHide").show();
				$("#cityBox").show();
			}
			$("#provinceShow").click(function(){
				$("#provinceShow").hide();
				$("#provinceHide").show();
				$("#cityBox").show();
			});
			$("#provinceHide").click(function(){
				$("#provinceShow").show();
				$("#provinceHide").hide();
				$("#cityBox").hide();
			});
			$(".cityBox span").click(function(){
				$(".cityBox span").removeClass("on");
				$(this).addClass("on");
				var pro = $(this).attr("id");
				$("#province").val(pro.split("_")[1]);
			});
			//函数来源page.js
			page("searchForm", ${page.pageInfo}, "pageDataList");
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
	    .on{
	    	color:#ffffff;
	    	background-color: #c12121;
	    }
	    .cityBox span{
	    	display: inline-block;
	    	height:20px;
	    	line-height: 20px;
	    	padding: 0 3px;
	    }
	    .pro_span{
	    	padding: 6px 13px;
	    	background-color:#4562ef;
	    	color: #fff;
	    	border-radius:10px;
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
	<form action="/messageData/goSearch" name="searchForm" method="post" target="_self" id="searchForm" onsubmit="return check();">
		<div class="r_box" style="margin-top: 10px;margin-bottom: 10px;">
			<div style="height: 15px; width: 100%;"><span></span></div>
				<input type="hidden" name="title" id="titlee" value="${query.title }"/>
    	    	<input type="hidden" name="content" id="contentt" value="${query.content }"/>
    	    	<input type="hidden" name="province" id="province" value="${query.province }">
				筛选条件：&nbsp;<select class="select-nosearch" name="messagetype" style="width: 130px;height: 28px;">
					<option value="">-----类型-----</option>
					<c:forEach items="${messageTypeList}" var="messageType" varStatus="status">
						<option value='${messageType.id}' <c:if test="${query.messagetype==messageType.id}">selected</c:if>>
							${messageType.messageName} 
						</option>
					</c:forEach>
				</select>&nbsp;
<!-- 				时间：<input style="margin-top: 2px;height:27px;border-radius:5px;" type="text" class="Wdate" -->
<!-- 								onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})" -->
<!-- 								name="date" id="date" value="${query.date}" /> -->
				<select class="" name="date" style="width: 130px;height: 28px;">
					<option value="">----日期----</option>
					<option value='1' <c:if test="${query.date=='1'}">selected</c:if>>近一周</option>
					<option value='2' <c:if test="${query.date=='2'}">selected</c:if>>近一月</option>
					<option value='3' <c:if test="${query.date=='3'}">selected</c:if>>近三月</option>
					<option value='4' <c:if test="${query.date=='4'}">selected</c:if>>近半年</option>
					<option value='5' <c:if test="${query.date=='5'}">selected</c:if>>近一年</option>
				</select>&nbsp;
				<span id="provinceShow" class="pro_span">显示省份</span>
				<span id="provinceHide" class="pro_span">隐藏省份</span>
<!-- 				<select class="select-nosearch" style="width: 130px;height: 28px;" > -->
<!-- 					<option value="">-----省份-----</option> -->
<!-- 					<c:forEach items="${provinceList}" var="province" varStatus="status"> -->
<!-- 						<option value='${province.id}' <c:if test="${query.province==province.id}">selected</c:if>> -->
<!-- 							${province.provinceName}  -->
<!-- 						</option> -->
<!-- 					</c:forEach> -->
				</select>
				<div class="cityBox" id="cityBox" style="width:800px; line-height: 26px;margin-top: 10px;display:none;">
    	    		<span id="province_0" <c:if test="${query.province==0 ||query.province=='' || query.province==null}">class="on"</c:if>>全国</span>
    	    		<c:forEach items="${provinceList}" var="province" varStatus="status">
    	    			<span id="province_${province.id}" <c:if test="${query.province==province.id}">class="on"</c:if>>${province.provinceName}</span>
    	    		</c:forEach>
    	    	</div>
			<button type="submit" class="btn btn-default"
					style="background-color:#4562ef;padding: 6px 13px;border:none;color:#fff;">搜索</button>
			<br />
			<div><span></span></div>
		</div>

<div class="r_box" style="margin-bottom: 10px;">
	<table width="100%" cellpadding="0" cellspacing="0" class="table-bordered" style="border: 2px solid #307DB4;">
		<tr style="height:30px;background-color: #CCE4F7;">
			<td width="76%" align="left" style="padding-left:60px; font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				标题
			</td>
			<td width="8%" align="center" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				地区
			</td>
			<td width="8%" align="center" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				类型
			</td>
			<td width="8%" align="center" style="font-size: 17px;font-weight: bold;border: 1px solid #CCE4F7;">
				日期
			</td>
		</tr>
		<c:forEach items="${page.result}" var="messageData" varStatus="count">
			<tr>
				<td align="left"  title="${messageData.title}" style="border: 1px solid #CCE4F7;">
					<a href="/messageData/dataDetail?id=${messageData.id}" target="_blank" style="font-size:14px;color: black;">
						<%
							String contentQuery2 = "<font color='red'>" +(String)request.getAttribute("contentQuery")+"</font>"; 
							request.setAttribute("contentQuery2",contentQuery2);
						%>
						<c:if test="${fn:length(messageData.title)>=40}">
							${fn:replace(fn:substring(messageData.title,0,40),contentQuery,contentQuery2)}...
						</c:if>
						<c:if test="${fn:length(messageData.title)<40}">
							${fn:replace(messageData.title,contentQuery,contentQuery2)}
						</c:if>	
					</a>
				</td>
				<td align="center"  style="border: 1px solid #CCE4F7;">
					${messageData.provincename}
				</td>
				<td align="center"  style="border: 1px solid #CCE4F7;">
					${messageData.messagename}
				</td>
				<td align="center"  style="border: 1px solid #CCE4F7;">
					${messageData.dateString}
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" height="40"  align="left" class="pageDataList">
			</td>
		</tr>
	</table>
</div>

</form>
</div>
<jsp:include  page="../def/footer.jsp"/>
</body>
</html>