<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul>
	<c:forEach items="${messageDataList}" var="messageData">
		<li>
	        <span class="zbgg">[${messageData.province }] <a href="/messageData/dataDetail?id=${messageData.id}" target="_blank" title="${messageData.title }">${messageData.title }</a><em class="new">&nbsp;</em></span>
			<span class="sg"><b class="red">[进行中]</b></span>
	        <span class="zbtime">${messageData.dateString }</span>
	        <div class="clear"></div>
	    </li>
	</c:forEach>
</ul>