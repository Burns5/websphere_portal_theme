<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<c:if test="${fn:length(wp.selectionModel.selectionPath) > (param.startLevel+1)}">
<ul class="${param.rootClass} breadcrumb">
	<c:forEach var="node" items="${wp.selectionModel.selectionPath}" begin="${param.startLevel}">
		<c:set var="nodeID" value="${wp.identification[node]}"/>
		<c:set var="separator" value="/" />
		<c:if test="${!node.metadata['com.ibm.portal.Hidden']}">
			<c:choose>
				<c:when test="${wp.identification[wp.selectionModel.selected] == nodeID}">
					<li class="active" lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
				</c:when>
				<c:when test="${node.contentNode.contentNodeType == 'LABEL'}">
					<li lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
				</c:when>
				<c:otherwise>
					<li><a href="?uri=nm:oid:${nodeID}" lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></a> <span class="divider">${separator}</span></li>
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
</ul>
</c:if>