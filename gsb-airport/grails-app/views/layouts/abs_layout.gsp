<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title><meta name="layout" content="main">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    %{--<asset:stylesheet src="mainabsfeb16.css"/>--}%
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <g:layoutHead/>
</head>
<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div align="right" class="login-top"><sec:ifLoggedIn><a class="buttonslogout" href="${request.contextPath}/logoff" >Logout </a>
        User: <sec:loggedInUserInfo field="username"/></sec:ifLoggedIn></div>
    <sec:ifNotLoggedIn><div align="right" class="buttonslogin">
        <g:link controller="login" action="auth">Login</g:link></div></sec:ifNotLoggedIn>
    <div align="center" class="sec-mess-top"><gsb:renderSecMess/></div>
    <div align="right" class="use-mess-top"><gsb:renderUseMess/></div>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${request.contextPath}/#">
                <span class="gsb-logo-mark" aria-hidden="true">GSB</span>
                <gsb:bannerText slot="brandTitle" defaultText="Airport Status"/>
            </a>

        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li><g:link controller="airportLookupOption">Lookup Options</g:link></li>
                    <li><g:link controller="appAdmin">App Admin</g:link></li>
                </sec:ifAnyGranted>
                <g:pageProperty name="page.nav" />
            </ul>
        </div>
    </div>
</div>
<gsb:quickLinks/>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>
<div>
    <div align="center" class="sec-mess-bottom"><gsb:renderSecMess/></div>
    <div align="left" class="use-mess-bottom"><gsb:renderUseMess/></div>
    <div align="right" class="ver-mess-bottom"><gsb:renderVerMess/></div>

</div>
</body>
</html>
