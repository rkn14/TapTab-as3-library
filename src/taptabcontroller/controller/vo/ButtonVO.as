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
	 * Button Control Value Object
	 * see pressed property
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class ButtonVO extends AbstractVO
	{
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "BUTTON_VALUE"
		
			
		/**
		 * the button pressed state 
		 */			
		public var pressed : Boolean;
		
		
		
		/**
		 *
		 * Constructor 
		 *  
		 * @param __controlId control id
		 * 
		 */		
		public function ButtonVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : ButtonVO
		{
			var value : ButtonVO = new ButtonVO(__obj.controlId);			
			value.pressed = __obj.pressed;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[ButtonValue] " + pressed;
		}
	}
}