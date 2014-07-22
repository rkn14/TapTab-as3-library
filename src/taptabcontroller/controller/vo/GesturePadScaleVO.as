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
	 * GesturePad Scale Value Object
	 * see scale property
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadScaleVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_SCALE_VALUE";
		
		
		/**
		 * the gesture scale offset since last scale. 
		 * Ex : scale = 1.1, scale increased by 10 percent
		 * Ex : scale = 0.9, scale decreased by 10 percent
		 */		
		public var scale : Number;
		
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __controlId the control id
		 * 
		 */	
		public function GesturePadScaleVO(__controlId : String)
		{
			super(TYPE, __controlId);
		}
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadScaleVO
		{
			var value : GesturePadScaleVO = new GesturePadScaleVO(__obj.controlId);			

			value.scale = __obj.scale;
			
			return value;
		}
		
		public function toString() : String
		{
			return "[GesturePadScaleValue] " + scale;
		}
	}
}