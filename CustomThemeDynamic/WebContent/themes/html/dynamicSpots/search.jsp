<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ taglib uri="/WEB-INF/tld/SearchMenuControl.tld" prefix="searchmenu" %>
<portal-core:constants/><portal-core:defineObjects/>
<portal-navigation:urlGeneration allowRelativeURL="true" contentNode="ibm.portal.Search Center" layoutNode="ibm.portal.Search Center Portlet Window" portletParameterType="action">
<portal-navigation:urlParam name="javax.portlet.action" value="newQuery" type="action"/>
<!-- <div class="wpthemeSearch" role="search"> -->
	<form class="navbar-search pull-right" name="searchQueryForm" method="get" action="<%wpsURL.write(out);%>">
		<input type="hidden" value="<searchmenu:currentContentNode/>" name="sourceContentNode">
		<input class="search-query" type="text" id="wpthemeSearchBoxInput" name="query" placeholder="Search">
	</form>		
<!-- </div> -->
</portal-navigation:urlGeneration>
