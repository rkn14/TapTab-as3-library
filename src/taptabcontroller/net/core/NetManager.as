/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core
{
	import flash.events.EventDispatcher;
	import flash.events.NetStatusEvent;
	import flash.net.GroupSpecifier;
	import flash.net.NetConnection;
	import flash.net.NetGroup;

	/**
	 * 
	 * The NetManager SingleTon lets you connect to the local
	 * network and in a NetGroup. 
	 * Then you are able to connect to other NetGroup peers.
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class NetManager extends EventDispatcher
	{
		 
		
		/** 
		 * Dispatched when NetManager is connected to Lan and NetGroup
		 * 
		 * @eventType taptabcontroller.net.core.NetManagerEvent.CONNECTED 
		 */ 
		[Event(name="NetManagerEvent.CONNECTED", type="flash.events.Event")]
		
		/** 
		 * Dispatched when NetManager is disconnected from the LAN
		 * 
		 * @eventType taptabcontroller.net.core.NetManagerEvent.DISCONNECTED 
		 */ 
		[Event(name="NetManagerEvent.DISCONNECTED", type="flash.events.Event")]

		/** 
		 * Dispatched when a message is received from an other peer
		 * 
		 * @eventType taptabcontroller.net.core.NetManagerEvent.MESSAGE_RECEIVED 
		 */ 
		[Event(name="NetManagerEvent.MESSAGE_RECEIVED", type="flash.events.Event")]
		
		/** 
		 * Dispatched when a new peer is discovered in the NetGroup
		 * 
		 * @eventType taptabcontroller.net.core.NetManagerEvent.NEW_PEER 
		 */ 
		[Event(name="NetManagerEvent.NEW_PEER", type="flash.events.Event")]
		
		/** 
		 * Dispatched when a peer has leave the NetGroup
		 * 
		 * @eventType taptabcontroller.net.core.NetManagerEvent.PEER_LEAVE 
		 */ 
		[Event(name="NetManagerEvent.PEER_LEAVE", type="flash.events.Event")]
		
		
		
		
		
		
		
		// === SINGLETON IMPLEMENTATION =========================================================================================
		private static var _instance : NetManager;		
		/**
		 * 
		 * @return the single instance of NetManager
		 * 
		 */		
		public static function get instance() : NetManager 
		{
			if(!_instance)
				_instance = new NetManager();
			return _instance;
		}

	
		
		/**
		 * the default port 
		 */		
		public static const DEFAULT_PORT : String = "3000";
		/**
		 * the default group name 
		 */		
		public static const DEFAULT_GROUP : String = "TapTabControllerGroup";
		
		
		
		
		private var _port : String;
		private var _groupName : String;
		
		private var _netConnection:NetConnection;	
		private var _group:NetGroup;
		
		private var _neighbors:Vector.<String>;
		
		
		private var _connected:Boolean;
		/**
		 * 
		 * @return true when connected to the NetGroup
		 * 
		 */		
		public function get connected() : Boolean { return _connected; }
		
		/**
		 * 
		 * @return the peer ID
		 * 
		 */		
		public function get peerID() : String 
		{ 
			if (_netConnection && _group)
				return _group.convertPeerIDToGroupAddress(_netConnection.nearID);
			else
				return null;
		}
		
		
		

		
		
		
		
		
		
		/**
		 * 
		 * convert peer ID to group address
		 * 
		 * @param __peerId the peer id to convert
		 * @return the group adress
		 * 
		 */		
		public function convertPeerIDToGroupAddress(__peerId : String) : String
		{
			return _group.convertPeerIDToGroupAddress(__peerId);	
		}		
		
		
		
		/**
		 *
		 * Starts the NetManager, the connection to the LAN and the NetGroup
		 *  
		 * @param __port the network port
		 * @param __groupName the group name
		 * 
		 */		
		public function start(__port : String = DEFAULT_PORT, __groupName : String = DEFAULT_GROUP) : void 
		{
			_port = __port;
			_groupName = __groupName;		
			
			_neighbors = new Vector.<String>();
			
			_start();
		}
		
		
		/**
		 * Stop the NetManager, disconnect from the LAN and NetGroup
		 * 
		 */		
		public function stop() : void
		{
			if(_group)
			{
				_group.removeEventListener(NetStatusEvent.NET_STATUS, _handler_NetConnection);
				_group.close();
				_group = null;
			}
			if(_netConnection)
			{
				_netConnection.removeEventListener(NetStatusEvent.NET_STATUS, _handler_NetConnection);
				_netConnection.close();			
				_netConnection = null;
			}
			
			_neighbors = new Vector.<String>();
		}
		
		/**
		 * 
		 * @return the list of the NetGroup neighbors peer id
		 * 
		 */		
		public function get neighbors() : Vector.<String>
		{
			return _neighbors;
		}
		
		/**
		 *
		 * Send a message to a peer in the NetGroup
		 *  
		 * @param __peerId the id of the target peer 
		 * @param __type the message type, see NetMessage constants
		 * @param __content an object that will we sent with the message
		 * 
		 */		
		public function sendMessageTo(__peerId : String, __type : String, __content : Object = null) : void
		{
			var message : NetMessage = new NetMessage(
				peerID,
				__peerId,
				__type,
				__content
			);		
			
			//send message
			_group.sendToNearest(message, message.to);
			
		}
		

		
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		private function _start():void
		{
			_netConnection = new NetConnection();
			_netConnection.addEventListener(NetStatusEvent.NET_STATUS, _handler_NetConnection);
			_netConnection.connect("rtmfp:");
		}		
		
		private function _setupGroup():void
		{
			var groupspec:GroupSpecifier = new GroupSpecifier(_groupName);
			
			groupspec.postingEnabled = true;			
			groupspec.multicastEnabled = true;
			groupspec.routingEnabled = true;			
			
			//allow data to be exchanged on IP multicast sockets
			groupspec.ipMulticastMemberUpdatesEnabled = true;
			//set the IP adress and port to use
			groupspec.addIPMulticastAddress("225.225.0.1:" + _port);
			//create NetGroup with our NetConnection using GroupSpecifier details
			_group = new NetGroup(_netConnection, groupspec.groupspecWithAuthorizations());
			//listen for result of setup
			_group.addEventListener(NetStatusEvent.NET_STATUS, _handler_NetConnection);
		}


		private function _messageReceived(__peerID : String, __message : NetMessage):void
		{
			var evt : NetManagerEvent = new NetManagerEvent(NetManagerEvent.MESSAGE_RECEIVED);
			evt.peerID = __peerID;
			evt.message = __message;
			dispatchEvent(evt);
		}
		
		
		private function _handler_NetConnection(event:NetStatusEvent):void
		{
			switch(event.info.code)
			{
				//connection succeeded so setup a group
				case "NetConnection.Connect.Success":
					_setupGroup();
					break;
				case "NetGroup.Connect.Success":
					_setConnected(true);
					break;
				case "NetGroup.Posting.Notify": 
					
				case "NetGroup.SendTo.Notify":
					if (event.info.fromLocal == true)
						_messageReceived(event.info.peerID, NetMessage.Parse(event.info.message));
					else
						// not for me, continue routing
						_group.sendToNearest(event.info.message, event.info.message.to);										
					break;
				
				case "NetGroup.Neighbor.Connect":
					_addNeighbor(event.info.peerID);
					break;
				case "NetGroup.Neighbor.Disconnect":
					_removeNeighbor(event.info.peerID);
					break;
				
			}
		}
		
		
		private function _addNeighbor(__peerID : String) : void
		{
			// push id
			_neighbors.push(__peerID);
			
			// dispatch NEW_PEER
			var evt : NetManagerEvent = new NetManagerEvent(NetManagerEvent.NEW_PEER);
			evt.peerID = __peerID;
			dispatchEvent(evt);
		
		}
		
		private function _removeNeighbor(__peerID : String) : void
		{			
			// splice			
			var index : int = _neighbors.indexOf(__peerID);
			if(index > -1)
				_neighbors.splice(index, 1);
			
			// dispatch PEER_LEAVE
			var evt : NetManagerEvent = new NetManagerEvent(NetManagerEvent.PEER_LEAVE);
			evt.peerID = convertPeerIDToGroupAddress(__peerID);
			dispatchEvent(evt);
			
		}
		
		private function _setConnected(__value:Boolean):void
		{
			_connected = __value;
			if(_connected)
				dispatchEvent(new NetManagerEvent(NetManagerEvent.CONNECTED));
			else
				dispatchEvent(new NetManagerEvent(NetManagerEvent.DISCONNECTED));
		}	
		
		
		
		
		
		
	
		
		
	}
}