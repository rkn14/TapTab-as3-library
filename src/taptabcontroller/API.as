/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller
{
	
	/**
	 * @private 
	 * @author Grégory Lardon
	 * 
	 */	
	public class API
	{
		public static const VERSION : String = "1.0";
		public static const TAPTAB_MINIMUM_VERSION : String = "1.0";
		
		
		
		public static function isCompatible(__taptabVersion : String) : Boolean
		{
			var apiVersion  : Array = TAPTAB_MINIMUM_VERSION.split(".");
			var taptabVersion : Array = __taptabVersion.split(".");
			
			// on s'assure que les 2 tableaux ont la même longueur, on complète avec des 0
			while(apiVersion.length < taptabVersion.length)
				apiVersion.push(0);
			while(taptabVersion.length < apiVersion.length)
				taptabVersion.push(0);
			
			for (var i : int = 0; i < taptabVersion.length; i++)
				if ( Number(taptabVersion[i]) < Number(apiVersion[i]) )
					return false;

			return true;
			
		}
		
		
	}
}