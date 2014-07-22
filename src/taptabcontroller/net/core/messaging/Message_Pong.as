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
	 * Message sent by a peer to pong another peer
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_Pong
	{		
		
		
		
		
		/**
		 * 
		 * @return a new Message_Pong instance
		 * 
		 */
		public static function newInstance() : Message_Pong
		{			
			var instance : Message_Pong = new Message_Pong();
			return instance;
		}
		
		/**
		 * 
		 * @return a new Message_Pong instance
		 * 
		 */		
		public static function parse() : Message_Pong
		{
			return Message_Pong.newInstance();
		}
		
	}
}