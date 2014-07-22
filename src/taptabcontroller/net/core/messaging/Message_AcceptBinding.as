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
	 * Message sent by a TapTab Controller to accept binding
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_AcceptBinding
	{
		
		/**
		 * 
		 * @return a new Message_AcceptBinding instance
		 * 
		 */		
		public static function newInstance() : Message_AcceptBinding
		{			
			var instance : Message_AcceptBinding = new Message_AcceptBinding();
			return instance;
		}
		
		/**
		 * 
		 * @return a new Message_AcceptBinding instance
		 * 
		 */		
		public static function parse() : Message_AcceptBinding
		{
			return Message_AcceptBinding.newInstance();
		}
	}
}