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
	 * Message sent by an application to request binding with a TapTab Controller
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_RequestBinding
	{		
		
		/**
		 * 
		 * @return a new Message_RequestBinding instance
		 * 
		 */		
		public static function newInstance() : Message_RequestBinding
		{			
			var instance : Message_RequestBinding = new Message_RequestBinding();
			return instance;
		}
		
		/**
		 * 
		 * @return a new Message_RequestBinding instance
		 * 
		 */		
		public static function parse() : Message_RequestBinding
		{
			return Message_RequestBinding.newInstance();
		}
		
	}
}