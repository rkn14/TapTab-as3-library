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
	 * Dispatched by TapTabControllersManager
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabControllersManagerEvent extends Event
	{
		
		/**
		 * the TapTabControllersManager has connected
		 */		
		public static const CONNECTED : String = "TapTabControllersManagerEvent.CONNECTED";
		
		/**
		 * the TapTabControllersManager has disconnected
		 */		
		public static const DISCONNECTED : String = "TapTabControllersManagerEvent.DISCONNECTED";
		
		/**
		 * a new TapTab Controller has connected
		 */		
		public static const NEW_TAPTABCONTROLLER : String = "TapTabControllersManagerEvent.NEW_TAPTABCONTROLLER";
		
		/**
		 * a TapTab Controller has an incompatible API version
		 */		
		public static const TAPTABCONTROLLER_API_VERSION_NOT_COMPATIBLE : String = "TapTabControllersManagerEvent.TAPTABCONTROLLER_API_VERSION_NOT_COMPATIBLE";
		
		
		/**
		 * the new TapTabController
		 * used with NEW_TAPTABCONTROLLER
		 */		
		public var taptabController : TapTabController;
		
		
		public function TapTabControllersManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
	}
}