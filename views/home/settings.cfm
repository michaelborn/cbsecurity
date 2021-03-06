<cfoutput>
<div class="mt-2">

	<p>Here is a listing of the settings for the global interceptor <code>cbsecurity@global</code>:</p>

	<cfdump var="#prc.properties.filter( function( key ){
		return !listFindNoCase( "rules,jwt", key );
	} )#">

	<h2>JWT Settings</h2>
	<p>Here are your settings for your Json Web Tokens Security. Please note your <code>secretKey</code> is not shown.</p>
	<cfdump var="#prc.properties.jwt.filter( function( key ){
		return !listFindNoCase( "secretKey", key );
	} )#">

</div>
</cfoutput>