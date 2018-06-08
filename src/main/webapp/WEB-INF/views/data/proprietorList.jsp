<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul>    
	<c:forEach items="${proprietorList}" var="proprietor">                	
	    <ul>
			<li>
                <span class="zbgg"><a href="/messageData/proprietorDetail?id=${proprietor.id}'" title="${proprietor.company }">${proprietor.company }</a><em class="new">&nbsp;</em></span>
                <div class="clear"></div>
            </li>
		</ul> 
    </c:forEach>
</ul>