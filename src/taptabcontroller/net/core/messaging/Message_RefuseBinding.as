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
	 * Message sent by a TapTab Controller to refuse binding
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_RefuseBinding
	{
		
		/**
		 * 
		 * @return a new Message_RefuseBinding instance
		 * 
		 */		
		public static function newInstance() : Message_RefuseBinding
		{			
			var instance : Message_RefuseBinding = new Message_RefuseBinding();
			return instance;
		}
		
		/**
		 * 
		 * @return a new Message_RefuseBinding instance
		 * 
		 */		
		public static function parse() : Message_RefuseBinding
		{
			return Message_RefuseBinding.newInstance();
		}
		
	}
}