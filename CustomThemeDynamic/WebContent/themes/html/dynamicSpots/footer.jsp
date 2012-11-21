<%@ page session="false" buffer="none" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/>
<div class="row">
	<div class="span4">
		<!-- <h3><portal-fmt:text key="help.title" bundle="nls.commonUI"/></h3>
		<ul>
			<li><a href="http://www.ibm.com/websphere/portal/library"><portal-fmt:text key="help.documentation" bundle="nls.commonUI"/></a></li>
			<li><a href="http://www-10.lotus.com/ldd/portalwiki.nsf/"><portal-fmt:text key="help.wiki" bundle="nls.commonUI"/></a></li>
			<li><a href="http://www-10.lotus.com/ldd/portalwiki.nsf/archive?openview&amp;title=Demonstration%20Gallery&amp;type=cat&amp;cat=Demonstration%20Gallery/"><portal-fmt:text key="help.media" bundle="nls.commonUI"/></a></li>
			<li><a href="http://www.ibm.com/websphere/developer/zones/portal/"><portal-fmt:text key="help.zone" bundle="nls.commonUI"/></a></li>
		</ul> -->
		<h3>About GreatPeople.me</h3>
		<p>GreatPeople.me is the news and information source for the associates of the Kroger Company's family of stores. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque in nunc erat, in suscipit felis. Sed accumsan imperdiet sagittis. Vivamus convallis placerat sem, et tristique lacus dapibus non.</p>
		<p><img src="/CustomThemeStatic/themes/Portal8.0/img/gp_logo_256.png" /></p>
		<p>&copy; Copyright 2012 The Kroger Co.  All Rights Reserved.</p>
	</div>
	<div class="span4">
		<!-- <h3><portal-fmt:text key="search.explore.title" bundle="nls.commonUI"/></h3>
		<ul>
			<li><a href="<portal-navigation:urlGeneration keepNavigationalState="false" contentNode='ibm.portal.Search'><% wpsURL.write(escapeXmlWriter); %></portal-navigation:urlGeneration>"><portal-fmt:text key="search.center.page" bundle="nls.commonUI"/></a></li>
			<li><a href="<portal-navigation:urlGeneration keepNavigationalState="false" contentNode='ibm.portal.Tagging'><% wpsURL.write(escapeXmlWriter); %></portal-navigation:urlGeneration>"><portal-fmt:text key="tagging.rating.page" bundle="nls.commonUI"/></a></li>
		</ul> -->
		<h3>Connect</h3>
		<ul class="iconography">
			<li><a href="http://www.kroger.com"><img src="/CustomThemeStatic/themes/Portal8.0/img/email.png" />&nbsp;Subscribe to our Newsletter</a></li>
			<li><a href="http://www.kroger.com"><img src="/CustomThemeStatic/themes/Portal8.0/img/facebook.png" />&nbsp;Like us on Facebook</a></li>
			<li><a href="http://www.kroger.com"><img src="/CustomThemeStatic/themes/Portal8.0/img/twitter.png" />&nbsp;Share on Twitter</a></li>
			<li><a href="http://www.kroger.com"><img src="/CustomThemeStatic/themes/Portal8.0/img/yahoo.png" />&nbsp;Follow us on Yammer</a></li>
		</ul>
	</div>
	<div class="span4">
		<!-- <h3><portal-fmt:text key="support.title" bundle="nls.commonUI"/></h3>
		<ul>
			<li><a href="http://www.ibm.com/software/genservers/portal/support/"><portal-fmt:text key="support.page" bundle="nls.commonUI"/></a></li>
			<li><a href="http://www-01.ibm.com/support/docview.wss?rs=1070&amp;uid=swg27007791"><portal-fmt:text key="support.hardware.software" bundle="nls.commonUI"/></a></li>
			<li><a href="http://www14.software.ibm.com/webapp/set2/sas/f/handbook/home.html"><portal-fmt:text key="support.guide" bundle="nls.commonUI"/></a></li>
		</ul> -->
		<h3>Resources</h3>
		<ul>
			<li><a href="http://www.kroger.com">Kroger Co.</a></li>
			<li><a href="http://www.kroger.com">Site Map</a></li>
			<li><a href="http://www.kroger.com">Contact Us</a></li>
			<li><a href="http://www.kroger.com">People Finder</a></li>
			<li><a href="http://www.kroger.com">Career Opportunities</a></li>
			<li><a href="http://www.kroger.com">Express HR</a></li>
			<li><a href="http://www.kroger.com">KnowMe</a></li>
			<li><a href="http://www.kroger.com">Divisions</a></li>
			<li><a href="http://www.kroger.com">Videos</a></li>
			<li><a href="http://www.kroger.com">Report a Concern</a></li>
		</ul>
	</div>
	<portal-logic:if loggedIn="yes">
	</portal-logic:if>
</div>
<script id="JS_jQuery" src="/CustomThemeStatic/themes/Portal8.0/js/jquery.js"></script>
<script id="JS_BootstrapTransition" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-transition.js"></script>
<script id="JS_BootstrapAlert" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-alert.js"></script>
<script id="JS_BootstrapModal" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-modal.js"></script>
<script id="JS_BootstrapDropdown" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-dropdown.js"></script>
<script id="JS_BootstrapScrollspy" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-scrollspy.js"></script>
<script id="JS_BootstrapTab" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-tab.js"></script>
<script id="JS_BootstrapTooltip" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-tooltip.js"></script>
<script id="JS_BootstrapPopover" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-popover.js"></script>
<script id="JS_BootstrapButton" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-button.js"></script>
<script id="JS_BootstrapCollapse" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-collapse.js"></script>
<script id="JS_BootstrapCarousel" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-carousel.js"></script>
<script id="JS_BootstrapTypeahead" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-typeahead.js"></script>
<script id="JS_BootstrapAffix" src="/CustomThemeStatic/themes/Portal8.0/js/bootstrap-affix.js"></script>
<script id="JS_Custom" src="/CustomThemeStatic/themes/Portal8.0/js/custom.js"></script>