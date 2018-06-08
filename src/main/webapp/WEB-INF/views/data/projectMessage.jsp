<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul>
	<c:forEach items="${messageDataList}" var="messageData">
		<li>
	    	<span class="nn_left" style="width:300px;"><a href="/messageData/dataDetail?id=${messageData.id}" title="${messageData.title }" target="_blank">${messageData.title }</a></span>
	        <span class="nn_right">(${messageData.dateString2 }日)</span>
	        <div class="clear"></div>
	    </li>
    </c:forEach>
</ul>