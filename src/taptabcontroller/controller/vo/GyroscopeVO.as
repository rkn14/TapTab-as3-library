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
	 * Gyroscope Control Value Object
	 * see x, y, z properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GyroscopeVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GYROSCOPE_VALUE";
		
		
		/**
		 * 
		 */		
		public var x : Number;
		
		/**
		 * 
		 */		
		public var y : Number;
		
		/**
		 * 
		 */		
		public var z : Number;
		
		
		
		
		/**
		 * 
		 * Constructor
		 * 
		 * @param __controlId the control id
		 * @param __x
		 * @param __y
		 * @param __z
		 * 
		 */		
		public function GyroscopeVO(__controlId:String, __x : Number, __y : Number, __z : Number)
		{
			super(TYPE, __controlId);
			x = __x;
			y = __y;
			z = __z;
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GyroscopeVO
		{
			var value : GyroscopeVO = new GyroscopeVO(__obj.controlId, __obj.x, __obj.y, __obj.z);						
			return value;
		}
		
		
		public function toString() : String
		{
			return "[GyroscopeValue] " + x + ", " + y + ", " + z;
		}
	}
}