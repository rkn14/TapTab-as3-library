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
	 * Message sent by a TapTab Controller or a TapTab client to identify itself on the LAN
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class Message_SystemIdentify
	{
		
		/**
		 * the peer id
		 */		
		public var peerID : String;
		
		/**
		 * the peer type, PeerTypeEnum.TAPTAB_DEVICE.name or PeerTypeEnum.CLIENT_APPLICATION.name 
		 */		
		public var peerType : String;
		
		/**
		 * the api version
		 */		
		public var apiVersion : String;
		
		/**
		 * the application name. 
		 */		
		public var applicationName : String;
		
		/**
		 * the application bitmap thumbnail
		 */		
		public var applicationBitmap : Object;
		
		
		/**
		 * 
		 * @param __peerID the peer id
		 * @param __peerType the peer type
		 * @param __apiVersion the api version
		 * @param __applicationName the application name
		 * @param __applicationBitmap the application bitmap thumbnail
		 * @return a new Message_SystemIdentify instance
		 * 
		 */		
		public static function newInstance(__peerID : String, __peerType : String, __apiVersion : String, __applicationName : String, __applicationBitmap : Object) : Message_SystemIdentify
		{			
			var instance : Message_SystemIdentify = new Message_SystemIdentify();
			instance.peerID = __peerID;
			instance.peerType = __peerType;
			instance.apiVersion = __apiVersion;
			instance.applicationName = __applicationName;
			instance.applicationBitmap = __applicationBitmap;
			return instance;
		}
		
		
		/**
		 * 
		 * @param __obj an object to initialize instance. Ex : {peerID:"HdjHDHLLd!7", peerName:"peerName", apiVersion:"1.0.0", applicationName:"ApplicationName", applicationBitmap:[Object Ojbect]}
		 * @return a new Message_SystemIdentify instance
		 * 
		 */		
		public static function parse(__obj:Object) : Message_SystemIdentify
		{
			return Message_SystemIdentify.newInstance(__obj.peerID, __obj.peerType, __obj.apiVersion, __obj.applicationName, __obj.applicationBitmap );
		}
	}
}