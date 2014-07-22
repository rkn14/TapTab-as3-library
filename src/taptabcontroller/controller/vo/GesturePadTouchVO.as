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
	 * GesturePad Touch Value Object
	 * see touchId, phase, pressure, locationX, locationY properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class GesturePadTouchVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "GESTUREPAD_TOUCH_VALUE";
		
		
		/**
		 * the touch has began
		 */		
		public static const PHASE_BEGAN : String = "began";
		
		/**
		 * the touch has moved
		 */		
		public static const PHASE_MOVED : String = "moved";
		
		/**
		 * the touch has ended 
		 */		
		public static const PHASE_ENDED : String = "ended";
		
		
		
		/**
		 * the touch id
		 */		
		public var touchId : int;
		
		/**
		 * the touch phase
		 */		
		public var phase : String;
		
		/**
		 * the touch pressure
		 */		
		public var pressure : Number;
		
		
		
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
		public function GesturePadTouchVO(__controlId:String)
		{
			super(TYPE, __controlId);
		}
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : GesturePadTouchVO
		{
			var value : GesturePadTouchVO = new GesturePadTouchVO(__obj.controlId);			
			
			value.touchId = __obj.touchId;
			value.phase = __obj.phase;
			value.pressure = __obj.pressure;			
			value.locationX = __obj.locationX;
			value.locationY = __obj.locationY;					
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[GesturePadTouchValue] " + touchId + " :  " + locationX + ", " + locationY;
		}
	}
}