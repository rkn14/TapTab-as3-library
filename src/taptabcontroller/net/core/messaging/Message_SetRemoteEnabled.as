/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core.messaging
{
	
	
	/**
	 * 
	 * Message sent by a TapTab Controller when its enabled state has changed
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_SetRemoteEnabled
	{
		
		/**
		 * true if the TapTab device is enabled
		 */		
		public var enabled : Boolean;
		
		
		/**
		 * 
		 * @param __enabled true if the remote is enabled
		 * @return a new Message_SetRemoteEnabled instance
		 * 
		 */		
		public static function newInstance(__enabled : Boolean) : Message_SetRemoteEnabled
		{			
			var instance : Message_SetRemoteEnabled = new Message_SetRemoteEnabled();
			instance.enabled = __enabled;				
			return instance;
		}
				
		/**
		 * 
		 * @param __obj an object to initialize instance. Ex : {enabled:true}
		 * @return a new Message_SetRemoteEnabled instance
		 * 
		 */		
		public static function parse(__obj:Object) : Message_SetRemoteEnabled
		{
			return Message_SetRemoteEnabled.newInstance(__obj.enabled);
		}
		
	}
}