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
	 * GesturePad Swipe Value Object
	 * see offsetX, offsetY properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadSwipeVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_SWIPE_VALUE";
		
		
		/**
		 * the swipe offset in X axis
		 */		
		public var offsetX : Number;
		
		/**
		 * the swipe offset in Y axis
		 */		
		public var offsetY : Number;
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __controlId the control id
		 * 
		 */	
		public function GesturePadSwipeVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadSwipeVO
		{
			var value : GesturePadSwipeVO = new GesturePadSwipeVO(__obj.controlId);			

			value.offsetX = __obj.offsetX;
			value.offsetY = __obj.offsetY;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[GesturePadSwipeValue] " + offsetX + ", " + offsetY;
		}
	}
}