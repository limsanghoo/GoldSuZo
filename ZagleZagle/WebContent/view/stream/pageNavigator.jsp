
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

	 
	<div class="container">

		<nav>
		  <ul class="pagination">
		    
		    <!--  사용불가 인경우 : disabled -->
		    <li class="disabled">
		    <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }"> 
				 <a href="#" aria-label="Previous">
		       	 <span aria-hidden="true">&laquo;</span></a>
			</c:if>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				 <a href="javascript:fncGetRefundList('${ resultPage.currentPage-1}')" aria-label="Previous">
		       	 <span aria-hidden="true">&laquo;</span></a>
			</c:if>
		    </li> 
		    <!--  현재 page 가르킬경우 : active -->
		    <li class="active">
		    	<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
			   		<li><a href="javascript:fncGetRefundList('${ i }');">${ i }</a></li>
				</c:forEach>
		 	 		   <a href="#"><span class="sr-only">(current)</span></a>
		     </li>
		    
		     <li class="active">
		   		 <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
					<a href="#" aria-label="Next">
		       			 <span aria-hidden="true">&raquo;</span> </a>
				</c:if>
		 	   <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
					<a href="javascript:fncGetRefundList('${resultPage.endUnitPage+1}')" aria-label="Next">
		     		   <span aria-hidden="true">&raquo;</span> </a>
				</c:if>
		    </li>
		  
		  </ul>
		 </nav> 	
		 </div>
		
