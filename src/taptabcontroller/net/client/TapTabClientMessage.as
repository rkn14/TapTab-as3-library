/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.client
{
	
	/**
	 *
	 * a message sent to a TapTab Controller
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabClientMessage
	{
		
		/**
		 * change a variable value on a TapTab Controller
		 */		
		public static const SET_VARIABLE : String = "TapTabClientMessage.SET_VARIABLE";
		
		/**
		 * play a sound on a TapTab Controller
		 */		
		public static const PLAY_SOUND : String = "TapTabClientMessage.PLAY_SOUND";
		
		/**
		 * open an alert box on a TapTab Controller
		 */		
		public static const ALERT : String = "TapTabClientMessage.ALERT";
		
		/**
		 * send configuration informations to a TapTab Controller
		 */		
		public static const CONFIGURATION : String = "TapTabClientMessage.CONFIGURATION";
		
		/**
		 * tell a TapTab Controller to load a new layout
		 */		
		public static const LOAD_LAYOUT : String = "TapTabClientMessage.LOAD_LAYOUT";
		
		/**
		 * tell a TapTab Controller to vibrate a short time
		 */		
		public static const VIBRATE : String = "TapTabClientMessage.VIBRATE";		
		
		
		
		
		/**
		 * the message type
		 */		
		public var type : String;
		
		/**
		 * the messge content
		 */		
		public var content : Object;
		
		
		/**
		 * 
		 * Constructor
		 * 
		 * @param __type the message type
		 * @param __content the message content
		 * 
		 */		
		public function TapTabClientMessage(__type : String, __content : Object)
		{
			type = __type;
			content = __content;
		}
		
		
		
		/**
		 * 
		 * Returns a new TapTabClientMessage instance initialized with a custom object
		 * 
		 * @param __obj an object containing properties to initialize the TapTabClientMessage
		 * @return a new TapTabClientMessage instance
		 * 
		 */			
		public static function parse(__obj : Object) : TapTabClientMessage
		{
			var message : TapTabClientMessage = new TapTabClientMessage(__obj.type, __obj.content);
			return message;
		}
		
		
	}
}