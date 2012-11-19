<%@ page session="false" buffer="none"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ibm.com/xmlns/prod/websphere/portal/v8.0/portal-managed-pages-support" prefix="portal-mp"%>
<%@ include file="../includePortalTaglibs.jspf" %>

<%-- show the project menu if managed pages is enabled --%>
<portal-logic:if loggedIn="yes"> 
	<portal-mp:managedPagesEnabled var="managedPagesEnabled"/>
	<c:if test="${managedPagesEnabled}">
		
		<portal-mp:currentProject var="currentProject" />

		<c:set var="selectedMetaData" value="${wp.metadata[wp.selectionModel.selected]}"/>
		<c:set var="isAdminArea" value="${selectedMetaData['theme.disable.edit.mode'] == 'true'}"/>
		<c:set var="displayProjectMenu" value="${!isAdminArea && wp.ac[wp.identification['wps.WCM_REST_SERVICE']].hasPermission['user']}"/><%-- only display the project menu if the user is allowed to access the WCM REST service virtual resource --%>
		
		<%-- project quicklinks --%>
		<c:if test="${displayProjectMenu}">
			<c:set var="themeModuleContextRoot" value="${wp.themeConfig['resources.modules.ibm.contextRoot']}" />
			<c:set var="toolbarMode"><r:dataSource uri="utb:state" mode="download"></r:dataSource></c:set><%-- the current toolbar mode ("closed", "open" or "minimized") --%>
			<c:set var="closed" value="closed"/><c:set var ="open" value="open"/><c:set var ="minimized" value="minimized"/><%-- toolbar mode constants --%>
			<c:set var="inEditMode" value="${toolbarMode eq minimized or toolbarMode eq open}"/><%-- the page is in edit mode if the toolbar is either open or minimized --%>
			<div class="utb-project-quicklink">
				<c:choose>
					<c:when test="${inEditMode}">
						<%-- in edit mode; display link to view mode --%>
						<c:set var="viewModeDesc"><portal-fmt:text key="toolbar.viewModeDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"></portal-fmt:text></c:set>
						<a id="utb-view-mode-quicklink" href="<r:url uri="utb:closed" mode="view" lateBinding="true" />" title="${viewModeDesc}"><portal-fmt:text key="toolbar.viewPage" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></a>
					</c:when>
					<c:otherwise>
						<%-- in view mode; display link to edit mode --%>
						<c:set var="editModeDesc"><portal-fmt:text key="toolbar.editModeDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"></portal-fmt:text></c:set>
						<a id="utb-edit-mode-quicklink" href="<r:url uri="utb:open" mode="view" lateBinding="true" />" title="${editModeDesc}"><portal-fmt:text key="toolbar.editPage" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></a>
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>

		<%-- project info box --%>
		<c:set var="launchProjectMenuLabel"><portal-fmt:text key="toolbar.launchProjectMenu" bundle="com.ibm.wps.toolbar.resources.Toolbar"></portal-fmt:text></c:set>
		<div class="utb-project-info lotusui lotusui30 ${displayProjectMenu ? 'utb-hover-link' : ''}" id="utb-project-info">
			<c:choose>
				<c:when test="${!empty currentProject}">
					<%-- in a project --%>
					<div class="utb-name">
						<div class="utb-project-label utb-ellipsis utb-left"><portal-fmt:text key="toolbar.project" bundle="com.ibm.wps.toolbar.resources.Toolbar"></portal-fmt:text></div>
						<portal-fmt:title varname="${currentProject}" var="currentProjectTitle"><div id="utb-project-name" class="utb-project-name utb-ellipsis" lang="${currentProjectTitle.locale}" dir="${currentProjectTitle.direction}" title="<c:out value="${currentProjectTitle}"></c:out>"><c:out value="${currentProjectTitle}"></c:out></div></portal-fmt:title>
						<c:if test="${displayProjectMenu}">
							<a tabindex="0" role="button" id="utb-project-btn" class="utb-select" title="${launchProjectMenuLabel}">
								<img src="${themeModuleContextRoot}/themes/html/dynamicSpots/icons/blank.gif" alt=""/>
								<portal-fmt:description varname="${currentProject}" var="currentProjectDescription"><span class="lotusOffScreen" lang="${currentProjectDescription.locale}"><c:set var="currentProjectDescriptionLabel">
									<portal-fmt:text key="toolbar.projectDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar">
										<portal-fmt:textParam value="${currentProjectDescription}"/>
									</portal-fmt:text></c:set><c:out value="${currentProjectDescriptionLabel}"></c:out></span>
								</portal-fmt:description>
							</a>
						</c:if>
					</div>
					<%-- container for project menu --%>
					<div class="utb-project-menu-container" id="utb-project-menu-container"></div>
					<%-- in edit mode --%>
					<div class="utb-ellipsis utb-desc utb-edit"><portal-fmt:text key="toolbar.editProjectDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></div>
					<%-- in view mode --%>
					<div class="utb-ellipsis utb-desc utb-view"><portal-fmt:text key="toolbar.viewProjectDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></div>
				</c:when>
				<c:otherwise>
					<%-- not in a project --%>
					<c:set var="curAC" value="${wp.ac[wp.selectionModel.selected]}"/><%-- access control for the currently selected page --%>
					<c:set var="isPrivatePage" value="${curAC.isPrivate}"/>
					<div class="utb-name">
						<div class="utb-ellipsis">
							<span class="utb-project-name utb-published-site"><portal-fmt:text key="toolbar.live" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></span>
							<c:if test="${displayProjectMenu}">
							<a tabindex="0" role="button" id="utb-project-btn" class="utb-select" title="${launchProjectMenuLabel}">
								<img src="${themeModuleContextRoot}/themes/html/dynamicSpots/icons/blank.gif" alt=""/>
								<span class="lotusOffScreen"><portal-fmt:text key="toolbar.liveDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></span>
							</a>
							</c:if>
						</div>
					</div>
					<%-- container for project menu --%>
					<div class="utb-project-menu-container" id="utb-project-menu-container"></div>
					<%-- in edit mode --%>
					<c:choose>
						<c:when test="${isPrivatePage}">
							<div class="utb-ellipsis utb-desc utb-edit"><portal-fmt:text key="toolbar.privateEditDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></div>
						</c:when>
						<c:otherwise>
							<div class="utb-ellipsis utb-desc utb-edit"><portal-fmt:text key="toolbar.liveEditDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></div>
						</c:otherwise>
					</c:choose>
					<%-- in view mode --%>
					<div class="utb-ellipsis utb-desc utb-view"><portal-fmt:text key="toolbar.liveViewDesc" bundle="com.ibm.wps.toolbar.resources.Toolbar"/></div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:if>
</portal-logic:if>