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
	 * Accelerometer Control Value Object
	 * see x, y, z properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class AccelerometerVO extends AbstractVO
	{
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "ACCELEROMETER_VALUE";
		
		
		/**
		 * The acceleration value in Gs (9.8m/sec/sec) along the x-axis.
		 */		
		public var accelerationX : Number;
		
		/**
		 * The acceleration value in Gs (9.8m/sec/sec) along the y-axis.
		 */		
		public var accelerationY : Number;
		
		/**
		 * The acceleration value in Gs (9.8m/sec/sec) along the z-axis.
		 */		
		public var accelerationZ : Number;
		
		
		/**
		 * The timestamp of the Accelerometer update.
		 */		
		public var timestamp : Number;
		
		
		
		public function AccelerometerVO(__controlId:String, __accelerationX : Number, __accelerationY : Number, __accelerationZ : Number, __timestamp : Number)
		{
			super(TYPE, __controlId);
			accelerationX = __accelerationX;
			accelerationY = __accelerationY;
			accelerationZ = __accelerationZ;
			timestamp  = __timestamp;
		}
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : AccelerometerVO
		{
			var value : AccelerometerVO = new AccelerometerVO(__obj.controlId, __obj.accelerationX, __obj.accelerationY, __obj.accelerationZ, __obj.timestamp);						
			return value;
		}
		
		
		public function toString() : String
		{
			return "[AccelerometerVO] " + accelerationX + ", " + accelerationY + ", " + accelerationZ;
		}
		
		
	}
}