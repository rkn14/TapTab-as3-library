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
	 * GesturePad Rotate Value Object
	 * see rotation property
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadRotateVO extends AbstractVO
	{
		
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_ROTATION_VALUE";
		
		
		/**
		 * the rotation offset in radians since last rotation
		 */		
		public var rotation : Number;
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __controlId the control id
		 * 
		 */	
		public function GesturePadRotateVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadRotateVO
		{
			var value : GesturePadRotateVO = new GesturePadRotateVO(__obj.controlId);			

			value.rotation = __obj.rotation;
			
			return value;
		}
		
		public function toString() : String
		{
			return "[GesturePadRotateValue] " + rotation;
		}
	}
}