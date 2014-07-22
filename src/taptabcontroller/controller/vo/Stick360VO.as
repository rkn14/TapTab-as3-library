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
	 * Stick360 Control Value Object
	 * see pressed, value4Directions, value8Directions, valueAngle, valueX, valueY properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class Stick360VO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "STICK_360_VALUE";
		
		
		/**
		 * the stick is pressed
		 */		
		public var pressed : Boolean;
		
		/**
		 * the direction in range [RIGHT, TOP, LEFT, BOTTOM]
		 */		
		public var value4Directions : String;
		
		/**
		 * the direction in range [RIGHT, TOP_RIGHT, TOP, TOP_LEFT, LEFT, BOTTOM_LEFT, BOTTOM, BOTTOM_RIGHT]
		 */		
		public var value8Directions : String;
		
		/**
		 * the direction angle in radians
		 */		
		public var valueAngle : Number;
		
		/**
		 * the x stick cursor position, in range (-1 : 1)
		 */		
		public var valueX : Number;
		
		/**
		 * the y stick cursor position, in range (-1 : 1)
		 */		
		public var valueY : Number;
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __controlId the control id
		 * 
		 */	
		public function Stick360VO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : Stick360VO
		{
			var value : Stick360VO = new Stick360VO(__obj.controlId);			
			
			value.pressed = __obj.pressed;
			value.value4Directions = __obj.value4Directions;
			value.value8Directions = __obj.value8Directions;
			value.valueAngle = __obj.valueAngle;
			value.valueX = __obj.valueX;
			value.valueY = __obj.valueY;
			
			return value;
		}
		
		
		
		public function toString() : String
		{
			return "[Stick360Value] " + value4Directions + ", " + value8Directions + ", " + valueX + ", " + valueY;
		}
		
	}
}