<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul>    
	<c:forEach items="${frontDataList}" var="frontData">                	
        <li>
            <span class="nn_left" style="width: 220px;"> <a href="${frontData.url }" target="_blank" title="${frontData.name }">${frontData.name }</a></span>
         <div class="clear"></div>
        </li>
    </c:forEach>
</ul>