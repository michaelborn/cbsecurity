/**
 * Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * ---
 * Module Configuration
 */
component {

	// Module Properties
	this.title 				= "cbsecurity";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "https://www.ortussolutions.com";
	this.description 		= "This module provides robust security for ColdBox Apps";
	// Model Namespace
	this.modelNamespace		= "cbsecurity";
	// CF Mapping
	this.cfmapping			= "cbsecurity";

	/**
	 * Module Config
	 */
	function configure(){

		settings = {
			// Where are the rules, valid options: json,xml,db,model
			"rulesSource" 		: "",
			// The location of the rules file, applies to json|xml ruleSource
			"rulesFile"			: "",
			// The rule validator model, this must have a method like this `userValidator( rule, controller ):boolean`
			// By default we use the CFSecurity validator
			"validator"			: "CFValidator@cbsecurity",
			// If source is model, the wirebox Id to use for retrieving the rules
			"rulesModel"		: "",
			// If source is model, then the name of the method to get the rules, we default to `getSecurityRules`
			"rulesModelMethod"	: "getSecurityRules",
			// If source is db then the datasource name to use
			"rulesDSN"			: "",
			// If source is db then the table to get the rules from
			"rulesTable"		: "",
			// If source is db then the ordering of the select
			"rulesOrderBy"		: "",
			// If source is db then you can have your custom select SQL
			"rulesSql" 			: "",
			// Use regular expression matching on the rules
			"useRegex" 			: true,
			// Force SSL for all relocations
			"useSSL"			: false
		};

	}

	/**
	 * Fired when the module is registered and activated.
	 */
	function onLoad(){
		// If we have a source, try to load it
		if( len( settings.rulesSource ) ){
			controller.getInterceptorService()
				.registerInterceptor(
					interceptorClass		= "cbsecurity.interceptors.Security",
					interceptorProperties	= settings,
					interceptorName			= "CBSecurity"
				);
		}
	}

	/**
	 * Fired when the module is unregistered and unloaded
	 */
	function onUnload(){
	}

}