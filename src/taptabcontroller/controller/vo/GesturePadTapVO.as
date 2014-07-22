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
	 * GesturePad Tap Value Object
	 * see locationX, locationY properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadTapVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_TAP_VALUE";
		
		
		
		/**
		 * the tap locationX in range (-1 : 1)
		 */		
		public var locationX : Number;
		
		/**
		 * the tap locationY in range (-1 : 1)
		 */		
		public var locationY : Number;
		
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __name the control id
		 * 
		 */	
		public function GesturePadTapVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadTapVO
		{
			var value : GesturePadTapVO = new GesturePadTapVO(__obj.controlId);			

			value.locationX = __obj.locationX;
			value.locationY = __obj.locationY;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[GesturePadTapValue] ";
		}
		
	}
}