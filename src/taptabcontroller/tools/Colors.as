/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.tools
{
	
	/**
	 *
	 * Some tools to deal with colors
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class Colors
	{
		
		/**
		 *
		 * Convert a hash color string into a color Number
		 *  
		 * @param __hash the hash string. Ex : #FF0000
		 * @return the color Number 
		 * 
		 */		
		public static function HashColorToHex(__hash : String) : Number
		{
			__hash = __hash.replace("#", "0x");
			return Number(__hash);
		}
	}
}