/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core
{
	import flash.events.Event;
	
	/**
	 *
	 * Events dispatched by the NetManager Singleton
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class NetManagerEvent extends Event
	{
		
		/**
		 * Dispatched when NetManager is connected to Lan and NetGroup
		 */		
		public static const CONNECTED : String = "NetManagerEvent.CONNECTED";
		
		/**
		 * Dispatched when NetManager is disconnected from the LAN
		 */		
		public static const DISCONNECTED : String = "NetManagerEvent.DISCONNECTED";
		
		/**
		 * Dispatched when a message is received from an other peer
		 */		
		public static const MESSAGE_RECEIVED: String = "NetManagerEvent.MESSAGE_RECEIVED";
		
		/**
		 * Dispatched when a new peer is discovered in the NetGroup
		 */		
		public static const NEW_PEER : String = "NetManagerEvent.NEW_PEER";
		
		/**
		 * Dispatched when a peer has leave the NetGroup
		 */		
		public static const PEER_LEAVE : String = "NetManagerEvent.PEER_LEAVE";
		
	
		
		/**
		 * used when MESSAGE_RECEIVED
		 */		
		public var message:NetMessage;
		
		/**
		 * used when NEW_PEER or PEER_LEAVE 
		 */		
		public var peerID:String;
		
		
		public function NetManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		
	}
}