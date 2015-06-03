<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="/easyscrumweb/resources/css/CostumeStyle.css">
<c:forEach items="${mailist }" end="6" var="m">
<c:if test="${m.reciever.userId==sessionScope.user.userId }">
	<c:choose>
		<c:when test="${m.mailtype==1 }">
		<a href="#" class="list-group-item">
        <i class="fa fa-tasks fa-fw"></i> New Team Invitation
        <span class="pull-right text-muted small"><em><c:out value="${m.dateenvoi }"></c:out> </em>
        </span>
        </a>
		</c:when>
		<c:when test="${m.mailtype==2 }">
		<a href="#" class="list-group-item">
         <i class="fa fa-envelope fa-fw"></i> New Job App
         <span class="pull-right text-muted small"><em><c:out value="${m.dateenvoi }"></c:out></em>
         </span>
         </a>
		</c:when>
		<c:when test="${m.mailtype==3 }">
		<a href="#" class="list-group-item">
        <i class="fa fa-comment fa-fw"></i> New Message
        <span class="pull-right text-muted small"><em><c:out value="${m.dateenvoi }"></c:out></em>
        </span>
		</a>
		</c:when>	
	</c:choose>
</c:if>
</c:forEach>