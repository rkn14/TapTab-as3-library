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
	 * Message sent by a peer to ping another peer
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_Ping
	{		

		
		
		/**
		 *  
		 * @return a new Message_Ping instance
		 * 
		 */
		public static function newInstance() : Message_Ping
		{			
			var instance : Message_Ping = new Message_Ping();
			return instance;
		}
		
		/**
		 * 
		 * @return a new Message_Ping instance
		 * 
		 */		
		public static function parse() : Message_Ping
		{
			return Message_Ping.newInstance();
		}
		
	}
}