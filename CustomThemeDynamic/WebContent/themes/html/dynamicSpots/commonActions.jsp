<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/portal-internal.tld" prefix="portal-internal" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ include file="../helper.jspf" %>
<portal-core:constants/><portal-core:defineObjects/>
<%-- Renders links for Login/Logout and Help that are shown in the banner --%>
	<div>
	<!-- <ul class="nav"> -->
	<!-- <ul class="wpthemeCommonActions wpthemeRight"> -->
		<portal-logic:if loggedIn="yes">
		<%-- Username is used as a link to 'Edit My Profile' --%>
		<!-- <li class="wpthemeFirst"> -->
		<portal-internal:adminlinkinfo name="SELFCARE">
		<portal-navigation:urlGeneration contentNode="<%=wpsContentNode%>" layoutNode="<%= wpsCompositionNode %>" portletWindowState="Normal" themeTemplate="" portletParameterType="render">
		<portal-navigation:urlParam type="render" name="ao" value="thm"/>
		<portal-navigation:urlParam type="render" name="OCN" value="<%= wpsNavigationNodeID %>" />
			<i class="icon-user"></i> Welcome, <a href="<%wpsURL.write(escapeXmlWriter);%>"><c:out value="${wp.user[themeConfig['user.displaynameattribute']]}" /></a>&nbsp;&nbsp;|&nbsp;&nbsp;
	    </portal-navigation:urlGeneration>
	    </portal-internal:adminlinkinfo>
		<!-- </li> -->
		<div class="dropdown" style="display:none;">
		<%--
		This creates the Actions context menu for page actions.  We use the
		&#36; HTML entity to encode the $ character so that it won't be interpreted
		as a JSP expression here and will show up as literals.
		--%>
            <c:if test="${!wpthemeWAI}" >
            <span tabindex="0" aria-labelledby="wpContextMenu" role="button" aria-haspopup="true" class="dropdown-toggle wpthemeMenuAnchor wpthemeActionDisabled"
                onclick="javascript:if (typeof wptheme != 'undefined') wptheme.contextMenu.init(this, 'pageAction', {'navID':ibmCfg.portalConfig.currentPageOID});"
                onmousemove="javascript:if (typeof i$ != 'undefined' && typeof wptheme != 'undefined') { i$.removeClass(this,'wpthemeActionDisabled'); this.onmousemove = null; }"
                onkeydown="javascript:if (typeof i$ != 'undefined' && typeof wptheme != 'undefined') {if (event.keyCode ==13) {wptheme.contextMenu.init(this, 'pageAction', {'navID':ibmCfg.portalConfig.currentPageOID});}}">
                <a href="#" class="" id="wpContextMenu"><portal-fmt:text key='theme_actions' bundle='nls8.Theme'/> <b class="caret"></b></a>
                <span class="wpthemeMenuRight">
                    <div class="wpthemeMenuBorder">
                        <div class="wpthemeMenuNotchBorder"></div>
                        <!-- define the menu item template inside the "ul" element.  only "css-class", "description", and "title" are handled by the theme's sample javascript. -->
                        <ul class="wpthemeMenuDropDown wpthemeTemplateMenu" role="menu">
                            <li class="&#36;{css-class}" role="menuitem" tabindex="-1"  ><span class="wpthemeMenuText" >&#36;{title}</span></li>
                        </ul>
                    </div>
                    <!-- Template for loading -->
                    <div class="wpthemeMenuLoading wpthemeTemplateLoading"><portal-fmt:text key='shelf_loading' bundle='nls8.Shelf'/></div>
                    <!-- Template for submenu -->
                    <div class="wpthemeAnchorSubmenu wpthemeTemplateSubmenu">
                        <div class="wpthemeMenuBorder wpthemeMenuSubmenu">
                            <ul id="&#36;{submenu-id}" class="wpthemeMenuDropDown" role="menu"><li role="menuitem" tabindex="-1"></li></ul>
                        </div>
                    </div>
                </span>
            </span> 
            </c:if>
		</div>
		<%-- My eSchedule --%>
		<a id="schedulelink" href="eSchedule">My eSchedule</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<%-- Logout Link --%>
		<!-- <li> -->
			<a id="logoutlink" href="<portal-navigation:url command='LogoutUser' keepNavigationalState='false'/>"><portal-fmt:text key="link.logout" bundle="nls.engine"/></a>
		<!-- </li> -->
		</portal-logic:if>
		<portal-logic:if loggedIn="no">
		<%-- Sign up Link --%>
		<li class="wpthemeFirst">
			<portal-internal:adminlinkinfo name="SELFCARE">
			<portal-navigation:urlGeneration allowRelativeURL="true" contentNode="<%=wpsContentNode%>" layoutNode='<%= wpsCompositionNode %>' portletWindowState="Normal" themeTemplate="">
			<portal-navigation:urlParam type="render" name="ao" value="thm"/>
			<portal-navigation:urlParam type="render" name="OCN" value="<%= wpsNavigationNodeID %>" />
				<a href='<% wpsURL.write(escapeXmlWriter); %>'><portal-fmt:text key="link.enrollment" bundle="nls.engine"/></a>
			</portal-navigation:urlGeneration>
			</portal-internal:adminlinkinfo>
		</li>
		<%-- Login Link --%>
		<c:set var="endPreviewOperation" value="${wp.operation['ibm.portal.operations.endPreviewMode']}"></c:set>
		<c:if test="${!endPreviewOperation.isActive}">
		<li>
			<portal-navigation:urlGeneration allowRelativeURL="true" keepNavigationalState="false" contentNode="wps.content.root" home="protected" >
				<a href='<% wpsURL.write(escapeXmlWriter); %>' ><portal-fmt:text key="link.login" bundle="nls.engine"/></a>
			</portal-navigation:urlGeneration>
		</li>
		</c:if>
		</portal-logic:if>
	<!-- </ul> -->
	</div>
