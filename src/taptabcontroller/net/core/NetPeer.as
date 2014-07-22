/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core
{
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	import taptabcontroller.net.controller.TapTabControllerAsset;
	import taptabcontroller.net.core.messaging.Message_Ping;
	import taptabcontroller.net.core.messaging.Message_Pong;
	import taptabcontroller.net.core.messaging.Message_SystemIdentify;

	
	/**
	 * 
	 * NetPeer is a low level class that represents an an application in a NetGroup
	 * <p>
	 * a NetPeer instance can be of 2 types :
	 * <ul>
	 * <li>PeerTypeEnum.TAPTAB_CONTROLLER</li>
	 * <li>PeerTypeEnum.TAPTAB_CLIENT</li>
	 * </ul>
	 * </p>
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class NetPeer extends EventDispatcher
	{
		
		protected var _netManager : NetManager = NetManager.instance;
		
		
		
		/**
		 * 
		 * @return the peer id
		 * 
		 */		
		public function get id() : String 
		{ 
			if (_netManager)
				return _netManager.peerID;
			else
				return null;		
		}
		
		
		protected var _name : String;		
		/**
		 * 
		 * @return the peer name
		 * 
		 */		
		public function get name() : String { return _name };
		
		
		protected var _type : PeerTypeEnum;
		/**
		 * 
		 * @return the peer type
		 * 
		 */		
		public function get type() : PeerTypeEnum { return _type };
		
		
		protected var _apiVersion : String = "";		
		/**
		 * 
		 * @return the peer api version
		 * 
		 */		
		public function get apiVersion() : String { return _apiVersion };
		
		
		protected var _applicationBitmap:ByteArray;
		/**
		 * 
		 * @return the peer application bitmap thumbnail
		 * 
		 */		
		public function get applicationBitmap() : ByteArray { return _applicationBitmap };
		
				
		protected var _connected:Boolean;				
		/**
		 * 
		 * @return the peer connected state
		 * 
		 */		
		public function get connected() : Boolean { return _connected; }
		
		
		
		
		
		/**
		 * 
		 * Constructor
		 * 
		 * @param __name the peer name
		 * @param __type the peer type
		 * @param __apiVersion the peer api version
		 * @param __applicationBitmap the peer application bitmap thumbnail
		 * 
		 */		
		public function NetPeer(__name : String, __type : PeerTypeEnum, __apiVersion : String, __applicationBitmap : ByteArray = null)
		{
			_name = __name;
			_type = __type;
			_apiVersion = __apiVersion;
			_applicationBitmap = __applicationBitmap;
		}
		
		
		/**
		 * Starts the connection to the LAN and the NetGroup		 * 
		 */		
		public function start() : void
		{
			_netManager = NetManager.instance;
			_netManager.addEventListener(NetManagerEvent.CONNECTED, _handler_NetManager);
			_netManager.addEventListener(NetManagerEvent.DISCONNECTED, _handler_NetManager);
			_netManager.addEventListener(NetManagerEvent.NEW_PEER, _handler_NetManager);
			_netManager.addEventListener(NetManagerEvent.PEER_LEAVE, _handler_NetManager);
			_netManager.addEventListener(NetManagerEvent.MESSAGE_RECEIVED, _handler_NetManager);
			_netManager.start();
		}
		
		
		/**
		 * Stops the connection to the NetGroup 
		 */		
		public function stop() : void
		{
			_netManager.removeEventListener(NetManagerEvent.CONNECTED, _handler_NetManager);
			_netManager.removeEventListener(NetManagerEvent.DISCONNECTED, _handler_NetManager);
			_netManager.removeEventListener(NetManagerEvent.NEW_PEER, _handler_NetManager);
			_netManager.removeEventListener(NetManagerEvent.PEER_LEAVE, _handler_NetManager);
			_netManager.removeEventListener(NetManagerEvent.MESSAGE_RECEIVED, _handler_NetManager);
			_netManager.stop();
			_netManager = null;
		}
		
		
		/**
		 * 
		 * Send a message to another peer in the NetGroup
		 * 
		 * @param __peerId the id the target peer
		 * @param __message the message to send
		 * 
		 */				
		public function sendMessageTo(__peerId : String, __message : Object) : void
		{
			_netManager.sendMessageTo(__peerId, NetMessage.TYPE_MESSAGE, __message);
		}
		
		/**
		 * re send identification message to all peers on the network 
		 * 
		 */		
		public function refreshPeers() : void
		{
			_refreshPeers();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		
		
		protected function _handler_NetManager(event:NetManagerEvent):void
		{
			switch (event.type)
			{
				case NetManagerEvent.MESSAGE_RECEIVED: 
					switch (event.message.type)
					{
						case NetMessage.TYPE_SYSTEM_PING:
							// pong
							_pong(event.message.from);
							break;
					}
					break;
			}
		}
		
		protected function _ping(__peerID : String) : void
		{
			_netManager.sendMessageTo(__peerID, NetMessage.TYPE_SYSTEM_PING, Message_Ping.newInstance());
		}
		
		protected function _pong(__peerID : String) : void
		{
			_netManager.sendMessageTo(__peerID, NetMessage.TYPE_SYSTEM_PONG, Message_Pong.newInstance());
		}
		
		protected function _identifyMyselfToPeer(__peerID:String):void
		{
			_netManager.sendMessageTo(_netManager.convertPeerIDToGroupAddress(__peerID), NetMessage.TYPE_SYSTEM_IDENTIFY, Message_SystemIdentify.newInstance(_netManager.peerID, _type.name, _apiVersion, _name, new TapTabControllerAsset(TapTabControllerAsset.TYPE_IMAGE, _applicationBitmap)));
		}		
		
		protected function _refreshPeers() : void
		{
			for each (var peerID : String in _netManager.neighbors)
				_identifyMyselfToPeer(_netManager.convertPeerIDToGroupAddress(peerID));
		}
		
	}
}

















