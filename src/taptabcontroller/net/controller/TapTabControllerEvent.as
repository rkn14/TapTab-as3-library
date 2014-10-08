/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	import flash.events.Event;
	
	/**
	 *
	 * Event dispatched by a TapTab Controller instance
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabControllerEvent extends Event
	{
		

		/**
		 * Dispatched when TapTab Controller is configured and ready
		 */		
		public static const READY : String = "TapTabControllerEvent.READY";	
		
		/**
		 * Dispatched when TapTab Controller has accepted to bind
		 */		
		public static const BOUND : String = "TapTabControllerEvent.BOUND";		
		
		/**
		 * Dispatched when TapTab Controller has disconnected
		 */
		public static const DISCONNECTED : String = "TapTabControllerEvent.DISCONNECTED";
		
		/**
		 * Dispatched when a TapTab Controller control has changed 
		 */
		public static const CONTROL_CHANGE : String = "TapTabControllerEvent.CONTROL_CHANGE";
		
		/**
		 * Dispatched when TapTab Controller is activated
		 */
		public static const ACTIVATED : String = "TapTabControllerEvent.ACTIVATED";
		
		/**
		 * Dispatched when TapTab Controller is deactivated
		 */
		public static const DEACTIVATED : String = "TapTabControllerEvent.DEACTIVATED";
		
		/**
		 * Dispatched when TapTab Controller user has quit
		 */
		public static const QUIT : String = "TapTabControllerEvent.QUIT";
		
		/**
		 * Dispatched when TapTab Controller sends its device infos
		 */
		public static const DEVICE_INFOS:String = "TapTabControllerEvent.DEVICE_INFOS";
		
		/**
		 * Dispatched when TapTab Controller send its user infos
		 */
		public static const USER_INFOS:String = "TapTabControllerEvent.USER_INFOS";
		
		/**
		 * Dispatched when TapTab Controller orientation change
		 */
		public static const ORIENTATION_CHANGE:String = "TapTabControllerEvent.ORIENTATION_CHANGE";
		
		/**
		 * Dispatched when TapTab Controller settings panel has open
		 */
		public static const SETTINGS_PANEL_OPEN:String = "TapTabControllerEvent.SETTINGS_PANEL_OPEN";
		
		/**
		 * Dispatched when TapTab Controller settings panel has closed
		 */
		public static const SETTINGS_PANEL_CLOSE:String = "TapTabControllerEvent.SETTINGS_PANEL_CLOSE";

		
		/**
		 * a AbstractUiValue object, when CONTROL_CHANGE
		 */
		public var value : Object;
		
		
		public function TapTabControllerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}