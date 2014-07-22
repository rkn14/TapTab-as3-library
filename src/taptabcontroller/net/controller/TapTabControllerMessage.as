/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	
	/**
	 *
	 * A message sent by the TapTab Controller
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabControllerMessage
	{
		
		/**
		 * Received when a TapTab Controller control has changed 
		 */		
		public static const CONTROL_CHANGE : String = "TapTabControllerMessage.CONTROL_CHANGE";
		
		/**
		 * Received when TapTab Controller orientation change
		 */		
		public static const ORIENTATION_CHANGE : String = "TapTabControllerMessage.ORIENTATION_CHANGE";
		
		/**
		 * Received when TapTab Controller sends its device infos
		 */		
		public static const DEVICE_INFOS : String = "TapTabControllerMessage.DEVICE_INFOS";
		
		/**
		 * Received when TapTab Controller send its user infos
		 */		
		public static const USER_INFOS : String = "TapTabControllerMessage.USER_INFOS";
		
		/**
		 * Received when TapTab Controller settings panel has closed
		 */		
		public static const SETTINGS_PANEL_CLOSE : String = "TapTabControllerMessage.SETTINGS_PANEL_OPEN";
		
		/**
		 * Received when TapTab Controller settings panel has open
		 */		
		public static const SETTINGS_PANEL_OPEN : String = "TapTabControllerMessage.SETTINGS_PANEL_OPEN";
		
		
		
		/**
		 * the type of the message, see constants 
		 */		
		public var type : String;
		
		/**
		 * the content object 
		 */		
		public var content : Object;
		
		
		/**
		 * Constructor
		 *  
		 * @param __type the type of the message, see constants
		 * @param __content the content object
		 * 
		 */		
		public function TapTabControllerMessage(__type : String, __content : Object)
		{
			type = __type;
			content = __content;
		}
		
		
		
		
		
		/**
		 * @private
		 */		
		public static function parse(__obj : Object) : TapTabControllerMessage
		{
			var message : TapTabControllerMessage = new TapTabControllerMessage(__obj.type, __obj.content);
			return message;
		}
		
		
	}
}