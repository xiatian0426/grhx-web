<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>中项招投网</title>
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
</head>

<body>
<jsp:include  page="../def/top.jsp"/>
	<div style="float: inherit;width:800px;margin: 0 auto;margin-top: 50px;margin-bottom: 50px;font-size: 20px;font-weight: bold;color: #333333;">
		<ul>
			<li style="height:30px;">公司名称：${proprietor.company}</li>
			<li style="height:30px;">联 系 人：${proprietor.linkman}</li>
			<li style="height:30px;">电&nbsp;&nbsp;话：${proprietor.tel}</li>
			<li style="height:30px;">地&nbsp;&nbsp;址：${proprietor.address}</li>
			<li style="height:30px;">
				
				<c:if test="${proprietor.type=='1' }">类&nbsp;&nbsp;型：业主库</c:if>
				<c:if test="${proprietor.type=='2' }">类&nbsp;&nbsp;型：设计院库</c:if>
				<c:if test="${proprietor.type=='3' }">类&nbsp;&nbsp;型：代理机构库</c:if>
			</li>
		</ul>
    </div>
<jsp:include  page="../def/footer.jsp"/>
</body>
</html>