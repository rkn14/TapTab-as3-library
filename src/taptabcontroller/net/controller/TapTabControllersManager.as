/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import taptabcontroller.API;
	import taptabcontroller.net.core.NetManagerEvent;
	import taptabcontroller.net.core.NetMessage;
	import taptabcontroller.net.core.NetPeer;
	import taptabcontroller.net.core.PeerTypeEnum;
	import taptabcontroller.net.core.messaging.Message_RequestBinding;
	import taptabcontroller.net.core.messaging.Message_SystemIdentify;
	
	
	/**
	 *
	 * This class lets you manage multiple connections with TapTab Controller instances.
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabControllersManager extends NetPeer
	{
		
		
		
		private var _taptabControllers:Vector.<TapTabController>;
		/**
		 * 
		 * @return the list of TapTabControllers 
		 * 
		 */		
		public function get taptabControllers() : Vector.<TapTabController>
		{
			return _taptabControllers;
		}
		
		
		
		
		
		private var _taptabControllersConfiguration:TapTabControllerConfigurationVO;
		/**
		 * the TapTabControllerConfigurationVO
		 * @return the TapTabControllerConfigurationVO
		 * 
		 */		
		public function get taptabControllerConfiguration() : TapTabControllerConfigurationVO
		{
			return _taptabControllersConfiguration;
		}
		/**
		 * the TapTabControllerConfigurationVO
		 * @param __value the new TapTabControllerConfigurationVO
		 * 
		 */		
		public function set taptabControllerConfiguration(__value : TapTabControllerConfigurationVO) : void
		{
			_taptabControllersConfiguration = __value;
		}
		
		
		
		private var _bindingMode : String = TapTabControllersManagerBindingMode.AUTO;
		/**
		 * the binding mode, default is AUTO, see TapTabControllersManagerBindingMode constants 
		 */		
		public function get bindingMode():String
		{
			return _bindingMode;
		}
		/**
		 * set the binding mode,  
		 * @param value the new binding mode, see TapTabControllersManagerBindingMode constants 
		 * 
		 */		
		public function set bindingMode(value:String):void
		{
			_bindingMode = value;
		}
		
		
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __name the TapTabControllersManager name
		 * @param __taptabControllersConfiguration the TapTabControllerConfigurationVO used to initialize the TapTab Controllers
		 * @param __applicationBitmap the application bitmap as a ByteArray
		 * 
		 */		
		public function TapTabControllersManager(__name:String, __taptabControllersConfiguration : TapTabControllerConfigurationVO, __applicationBitmap : ByteArray = null)
		{
			super(__name, PeerTypeEnum.TAPTAB_CLIENT, API.VERSION, __applicationBitmap);
			_taptabControllersConfiguration = __taptabControllersConfiguration;			
			_taptabControllers = new Vector.<TapTabController>();
		}
		
		
		/**
		 * requests a TapTabController to bind 
		 * 
		 * @param __peerId the TapTabController peer id
		 * 
		 */		
		public function requestBindingTo(__peerId : String) : void
		{
			_netManager.sendMessageTo(__peerId, NetMessage.TYPE_SYSTEM_REQUEST_BINDING, Message_RequestBinding.newInstance());
		}
		
		
		/**
		 * @param __peerId the TapTabController peer id
		 * @return the TapTabController with id
		 * 
		 */		
		public function getTapTabControllerByPeerId(__peerId : String) : TapTabController
		{
			for each (var taptabController : TapTabController in _taptabControllers)
				if (taptabController.peerID == __peerId)
					return taptabController;
			return null;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		
		protected function _handler_TapTabController(__event:TapTabControllerEvent):void
		{
			var taptabController : TapTabController = __event.target as TapTabController;
			switch (__event.type)
			{
				case TapTabControllerEvent.BOUND:
					// send xml configuration to taptabController, automatically
					if(_taptabControllersConfiguration != null)
						taptabController.sendConfiguration(_taptabControllersConfiguration);
					taptabController.addEventListener(TapTabControllerEvent.QUIT, _handler_TapTabController);
					break;
				case TapTabControllerEvent.QUIT:
					//taptabController.disconnected();					
					// re-request binding
					if(_bindingMode == TapTabControllersManagerBindingMode.AUTO)						
						taptabController.requestBinding();
					break;
			}
		}
		
		
		override protected function _handler_NetManager(event:NetManagerEvent):void
		{
			super._handler_NetManager(event);
			switch (event.type)
			{
				case NetManagerEvent.CONNECTED:
					_connected = true;
					dispatchEvent(new TapTabControllersManagerEvent(TapTabControllersManagerEvent.CONNECTED));
					break;
				case NetManagerEvent.DISCONNECTED:
					_connected = false;
					dispatchEvent(new TapTabControllersManagerEvent(TapTabControllersManagerEvent.DISCONNECTED));
					break;
				case NetManagerEvent.NEW_PEER:
					_identifyMyselfToPeer(event.peerID);			
					break;
				case NetManagerEvent.PEER_LEAVE:
					var taptabController : TapTabController = getTapTabControllerByPeerId(event.peerID);
					if(taptabController)
					{
						taptabController.disconnected();
						_removeTapTabController(taptabController);
					}						
					break;
				case NetManagerEvent.MESSAGE_RECEIVED:
					_messageReceived(event.message);					
					break;
			}
		}
		 
		private function _messageReceived(__message:NetMessage):void
		{
			// crée le taptabController si elle vient de s'identifier
			if (__message.type == NetMessage.TYPE_SYSTEM_IDENTIFY)
			{
				var messageIdentify : Message_SystemIdentify = Message_SystemIdentify.parse(__message.content);
				// is it a taptabController ?
				if (PeerTypeEnum.getByName(messageIdentify.peerType) == PeerTypeEnum.TAPTAB_CONTROLLER)
				{
					// compatible ?
					if (API.isCompatible(messageIdentify.apiVersion))
					{
						var remoteAsset : TapTabControllerAsset = TapTabControllerAsset.parse(messageIdentify.applicationBitmap);
						var assetObj : Object = remoteAsset.getAsset();
						var appBitmapData : BitmapData = (assetObj != null) ? Bitmap(assetObj).bitmapData : null;
						_taptabControllerIdentified(messageIdentify.peerID, messageIdentify.peerType, messageIdentify.applicationName, appBitmapData);
					}else
						dispatchEvent(new TapTabControllersManagerEvent(TapTabControllersManagerEvent.TAPTABCONTROLLER_API_VERSION_NOT_COMPATIBLE));
				}
			}
			
			// get taptabController
			var taptabController : TapTabController = getTapTabControllerByPeerId(__message.from);
			
			// send message
			if(taptabController)
				taptabController.messageReceived(__message);
		}
		  
		
		
		
		
		private function _removeTapTabController(__taptabController : TapTabController) : void
		{
			var index : int = _taptabControllers.indexOf(__taptabController);
			if(index > -1)
				_taptabControllers.splice(index, 1);
			
			__taptabController.removeEventListener(TapTabControllerEvent.BOUND, _handler_TapTabController);
			__taptabController.removeEventListener(TapTabControllerEvent.QUIT, _handler_TapTabController);
			__taptabController.destroy();
		}
		
		private function _taptabControllerIdentified(__peerID:String, __peerType:String, __name : String, __bitmapData : BitmapData):void
		{
			var taptabController : TapTabController = new TapTabController(this, __peerID, __name, __bitmapData);			
			_taptabControllers.push(taptabController);
			
			taptabController.addEventListener(TapTabControllerEvent.BOUND, _handler_TapTabController);
			
			var evt : TapTabControllersManagerEvent = new TapTabControllersManagerEvent(TapTabControllersManagerEvent.NEW_TAPTABCONTROLLER);
			evt.taptabController = taptabController;			
			dispatchEvent(evt);				
			
			// if bindingMode AUTO
			if(_bindingMode == TapTabControllersManagerBindingMode.AUTO)
				taptabController.requestBinding();
		}
				
		
		
	}
}