/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.controller
{
	
	/**
	 * 
	 * This class provides constants for directions, used with Stick360Control
	 * @author Grégory Lardon
	 * 
	 */	
	public class Directions
	{
		
		/**
		 * None
		 */		
		public static const NONE : String = "Directions.NONE";
		
		/**
		 * Right
		 */		
		public static const RIGHT : String = "Directions.RIGHT";
		
		/**
		 * Bottom
		 */		
		public static const BOTTOM : String = "Directions.BOTTOM";
		
		/**
		 * Bottom left
		 */		
		public static const BOTTOM_LEFT : String = "Directions.BOTTOM_LEFT";
		
		/**
		 * Bottom right
		 */		
		public static const BOTTOM_RIGHT : String = "Directions.BOTTOM_RIGHT";
		
		/**
		 * Left
		 */		
		public static const LEFT : String = "Directions.LEFT";
		
		/**
		 * Top
		 */		
		public static const TOP : String = "Directions.TOP";
		
		/**
		 * Top left 
		 */		
		public static const TOP_LEFT : String = "Directions.TOP_LEFT";
		
		/**
		 * Top right
		 */		
		public static const TOP_RIGHT : String = "Directions.TOP_RIGHT";
		
		/**
		 * Array that containers [RIGHT, TOP, LEFT, BOTTOM]
		 */		
		public static const DIRECTIONS_4 : Array = [RIGHT, TOP, LEFT, BOTTOM];
		
		/**
		 * Array that contains [RIGHT, TOP_RIGHT, TOP, TOP_LEFT, LEFT, BOTTOM_LEFT, BOTTOM, BOTTOM_RIGHT]
		 */		
		public static const DIRECTIONS_8 : Array = [RIGHT, TOP_RIGHT, TOP, TOP_LEFT, LEFT, BOTTOM_LEFT, BOTTOM, BOTTOM_RIGHT];
		
		
		
	}
}