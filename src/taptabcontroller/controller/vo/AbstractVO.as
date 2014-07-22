/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.controller.vo
{
	
	/**
	 * 
	 * Abstract class pour Value Objects
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class AbstractVO
	{
		
		/**
		 * the type of the VO
		 */		
		public var type : String;
		
		/**
		 * the control id
		 */		
		public var controlId : String;
		
		
		/**
		 * 
		 * Constructor
		 * 
		 * @param __type the type of the VO
		 * @param __controlId the control id
		 * 
		 */		
		public function AbstractVO(__type : String, __controlId : String)
		{
			type = __type;
			controlId = __controlId;
		}
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : AbstractVO
		{
			return new AbstractVO(__obj.type, __obj.name);
		}
		
		
	}
}