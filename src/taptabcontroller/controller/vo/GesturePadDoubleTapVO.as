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
	 * GesturePad Control DoubleTap Value Object
	 * see locationX, locationY properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadDoubleTapVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_DOUBLETAP_VALUE";
		
		
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
		 * @param __controlId the control id
		 * 
		 */		
		public function GesturePadDoubleTapVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadDoubleTapVO
		{
			var value : GesturePadDoubleTapVO = new GesturePadDoubleTapVO(__obj.controlId);			

			value.locationX = __obj.locationX;
			value.locationY = __obj.locationY;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[GesturePadDoubleTapValue] ";
		}
		
	}
}