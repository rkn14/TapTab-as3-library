/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core
{
	
	/**
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class NetMessage
	{
		
		/**
		 * a peer identify itself in the NetGroup
		 */		
		public static const TYPE_SYSTEM_IDENTIFY					: String = "NetMessage.TYPE_SYSTEM_IDENTIFY";
		
		/**
		 * a peer request to bind to another peer
		 */		
		public static const TYPE_SYSTEM_REQUEST_BINDING 			: String = "NetMessage.TYPE_SYSTEM_REQUEST_BINDING";
		
		/**
		 * a peer cancel a bind request to another peer
		 */		
		public static const TYPE_SYSTEM_CANCEL_REQUEST_BINDING 		: String = "NetMessage.TYPE_SYSTEM_CANCEL_REQUEST_BINDING";
		
		/**
		 * a peer accept to bind to another peer
		 */		
		public static const TYPE_SYSTEM_ACCEPT_BINDING 				: String = "NetMessage.TYPE_SYSTEM_ACCEPT_BINDING";		
		
		/**
		 * a peer pings another peer
		 */		
		public static const TYPE_SYSTEM_PING 						: String = "NetMessage.TYPE_SYSTEM_PING";
		
		/**
		 * a peer pongs another peer
		 */		
		public static const TYPE_SYSTEM_PONG 						: String = "NetMessage.TYPE_SYSTEM_PONG";	
		
		/**
		 * a binded peer becomes activated 
		 */		
		public static const TYPE_SET_ACTIVATED 						: String = "NetMessage.TYPE_SET_ACTIVATED";
		
		/**
		 * a binded peer becomes deactivated
		 */		
		public static const TYPE_SET_DEACTIVATED 					: String = "NetMessage.TYPE_SET_DEACTIVATED";
		
		/**
		 * a binded peer quit connection
		 */		
		public static const TYPE_QUIT 								: String = "NetMessage.TYPE_QUIT";
		
		/**
		 * a binded peer send a message to another binded peer
		 */		
		public static const TYPE_MESSAGE			 				: String = "NetMessage.TYPE_MESSAGE";
		
		
		
		
		
		
		
		/**
		 * the peer id of the peer that is sending the message
		 */		
		public var from : String;
		
		/**
		 * the peer id of the peer who is the target of the message
		 */		
		public var to : String;
		
		/**
		 * the message type, see constants in NetMessage
		 */		
		public var type : String;
		
		/**
		 * an object containing custom properties
		 */		
		public var content : Object;
		
		
		
		
		/**
		 * 
		 * Constructor
		 * 
		 * @param __from the peer id of the peer that is sending the message
		 * @param __to the peer id of the peer who is the target of the message
		 * @param __type the message type, see constants in NetMessage
		 * @param __content an object containing custom properties
		 * 
		 */		
		public function NetMessage(__from : String, __to : String, __type : String, __content : Object)
		{
			from = __from;
			to = __to;
			type = __type;
			content = __content;
		}
		
		
		/**
		 * 
		 * Returns a new NetMessage instance initialized with a custom object
		 * 
		 * @param __obj an object containing properties to initialize the NetMessage
		 * @return a new NetMessage instance
		 * 
		 */		
		public static function Parse(__obj : Object) : NetMessage
		{
			return new NetMessage(__obj.from, __obj.to, __obj.type, __obj.content);			
		}
		
	}
}