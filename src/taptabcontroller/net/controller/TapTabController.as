/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	
	import taptabcontroller.controller.tools.ControlsToKeyboardMapper;
	import taptabcontroller.controller.vo.AbstractVO;
	import taptabcontroller.controller.vo.DeviceInfosVO;
	import taptabcontroller.controller.vo.UserInfosVO;
	import taptabcontroller.controller.vo.VOFactory;
	import taptabcontroller.net.client.TapTabClientMessage;
	import taptabcontroller.net.core.NetMessage;

	
	/**
	 * 
	 * @author Grégory Lardon
	 * 
	 */	
	public class TapTabController extends EventDispatcher
	{
		
		
		/** 
		 * Dispatched when TapTab Controller has accepted to bind
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.BOUND
		 */ 
		[Event(name="TapTabControllerEvent.BOUND", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller has refused to bind
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.REFUSE_BINDING
		 */ 
		[Event(name="TapTabControllerEvent.REFUSE_BINDING", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller has disconnected
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.DISCONNECTED
		 */ 
		[Event(name="TapTabControllerEvent.DISCONNECTED", type="flash.events.Event")]
		
		/** 
		 * Dispatched when a TapTab Controller control has changed 
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.CONTROL_CHANGE
		 */ 
		[Event(name="TapTabControllerEvent.CONTROL_CHANGE", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller is activated
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.ACTIVATED
		 */ 
		[Event(name="TapTabControllerEvent.ACTIVATED", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller is deactivated
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.DEACTIVATED
		 */ 
		[Event(name="TapTabControllerEvent.DEACTIVATED", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller user has quit
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.QUIT
		 */ 
		[Event(name="TapTabControllerEvent.QUIT", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller sends its device infos
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.DEVICE_INFOS
		 */ 
		[Event(name="TapTabControllerEvent.DEVICE_INFOS", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller send its user infos
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.USER_INFOS
		 */ 
		[Event(name="TapTabControllerEvent.USER_INFOS", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller orientation change
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.ORIENTATION_CHANGE
		 */ 
		[Event(name="TapTabControllerEvent.ORIENTATION_CHANGE", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller settings panel has open
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.SETTINGS_PANEL_OPEN
		 */ 
		[Event(name="TapTabControllerEvent.SETTINGS_PANEL_OPEN", type="flash.events.Event")]
		
		/** 
		 * Dispatched when TapTab Controller settings panel has closed
		 * 
		 * @eventType taptabcontroller.net.controller.TapTabControllerEvent.SETTINGS_PANEL_CLOSE 
		 */ 
		[Event(name="TapTabControllerEvent.SETTINGS_PANEL_CLOSE", type="flash.events.Event")]
		
	

		
		
		
		
		
		private var _peerID		: String;
		/**
		 * 
		 * @return the taptab controller peer id
		 * 
		 */		
		public function get peerID() : String { return _peerID; }
						
		private var _bound : Boolean = false;
		/**
		 * 
		 * @return true if the taptab controller is bound
		 * 
		 */		
		public function get bound() : Boolean { return _bound; }
				
		private var _controlsToKeyboardMapper : ControlsToKeyboardMapper;
		/**
		 * 
		 * @return the taptab controller controlsToKeyboardMapper
		 * 
		 */		
		public function get controlsToKeyboardMapper() : ControlsToKeyboardMapper { return _controlsToKeyboardMapper; }
				
		private var _deviceInfos:DeviceInfosVO;
		/**
		 * 
		 * @return the taptab controller device infos
		 * 
		 */		
		public function get deviceInfos() : DeviceInfosVO { return _deviceInfos; }
		
		private var _userInfo:UserInfosVO;
		/**
		 * 
		 * @return the taptab controller user infos
		 * 
		 */		
		public function get userInfo() : UserInfosVO { return _userInfo; }
		
		private var _orientation:String;
		/**
		 * 
		 * @return the taptab controller orientation 
		 * 
		 */		
		public function get orientation() : String { return _orientation; }
		
		
		
		private var _taptabControllersManager:TapTabControllersManager;
		
		
		private var _name : String;
		/**
		 * 
		 * @return the taptab controller name
		 * 
		 */		
		public function get name() : String {return _name;}
		
		private var _bitmap:BitmapData;
		/**
		 * 
		 * @return the taptab controller bitmap thumbnail
		 * 
		 */		
		public function get bitmap() : BitmapData {return _bitmap;}
		

		
		
		
		/**
		 * 
		 * Constructor
		 * Creates a new TapTabController instance.
		 * 
		 * @param __taptabControllersManager the instance of TapTabControllersManager that will manage this taptab controller
		 * @param __peerID the taptab controller peer id
		 * @param __name the taptab controller name
		 * @param __bitmapData the taptab controller bitmap thumbnail
		 * 
		 */		
		public function TapTabController(__taptabControllersManager : TapTabControllersManager, __peerID:String, __name : String, __bitmapData : BitmapData)
		{
			_taptabControllersManager = __taptabControllersManager;
			_peerID = __peerID;			
			_name = __name;
			_bitmap = __bitmapData;			
			_controlsToKeyboardMapper = new ControlsToKeyboardMapper();;
		}
		
		
		/**
		 * Destroy a taptab controller instance
		 * 
		 */		
		public function destroy() : void
		{
			_taptabControllersManager = null;
			_bound = false;
			_controlsToKeyboardMapper = null;
		}
		
		
		/**
		 * the taptab controller has disconnected
		 * 
		 */		
		public function disconnected() : void
		{
			_bound = false;			
			dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.DISCONNECTED));
		}
		
		
		
		
		

		/**
		 * send a binding request to the taptab controller
		 * 
		 */		
		public function requestBinding() : void
		{
			_taptabControllersManager.requestBindingTo(_peerID);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/**
		 * send configuration to the taptab controller
		 * 
		 * @param __configuration a TapTabControllerConfigurationVO instance
		 * 
		 */		
		public function sendConfiguration(__configuration : TapTabControllerConfigurationVO) : void
		{
			var message : TapTabClientMessage = new TapTabClientMessage(TapTabClientMessage.CONFIGURATION, __configuration);
			_taptabControllersManager.sendMessageTo(_peerID, message);	
		}
		
		
		/**
		 * make the taptab controller displaying an alert box
		 * 
		 * @param __title the alert title
		 * @param __message the alert message
		 * 
		 */		
		public function alert(__title : String, __message : String) : void
		{
			var message : TapTabClientMessage = new TapTabClientMessage(TapTabClientMessage.ALERT, {title:__title, message:__message});
			_taptabControllersManager.sendMessageTo(_peerID, message);	
		}
		
		
		/**
		 * make the taptab controller playing a sound
		 * 
		 * @param __soundId the sound id
		 * 
		 */		
		public function playSound(__soundId : String) : void
		{
			var message : TapTabClientMessage = new TapTabClientMessage(TapTabClientMessage.PLAY_SOUND, {soundId:__soundId});
			_taptabControllersManager.sendMessageTo(_peerID, message);	
		}
		
		
		/**
		 * change a taptab controller variable
		 * 
		 * @param __varName the variable name
		 * @param __value the new variable value
		 * 
		 */		
		public function setVariable(__varName : String, __value : String) : void
		{
			var message : TapTabClientMessage = new TapTabClientMessage(TapTabClientMessage.SET_VARIABLE, {varName:__varName, value:__value});
			_taptabControllersManager.sendMessageTo(_peerID, message);
		}
		
		/**
		 * Loads a layout by ID
		 *  
		 * @param __layoutId the layout ID
		 * 
		 */		
		public function loadLayout(__layoutId : String) : void
		{
			var message : TapTabClientMessage = new TapTabClientMessage(TapTabClientMessage.LOAD_LAYOUT, {layout:__layoutId});
			_taptabControllersManager.sendMessageTo(_peerID, message);
		}
		
		
		
		
		
		
		
		/**
		 * a message from the taptab controller has arrived
		 * 
		 * @param __message the taptab controller message
		 * 
		 */		
		public function messageReceived(__message:NetMessage):void
		{

			switch (__message.type)
			{
				case NetMessage.TYPE_SYSTEM_IDENTIFY:
									
					break;
				case NetMessage.TYPE_CONFIGURATION_READY:
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.READY));					
					break;
				case NetMessage.TYPE_SYSTEM_ACCEPT_BINDING:
					if(_taptabControllersManager.isControllerConnectionAccepted(this))
					{
						_bound = true;
						dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.BOUND));
					}else{
						_bound = false;
						_taptabControllersManager.rejectControllerConnection(this);
					}
					break;
				case NetMessage.TYPE_SET_ACTIVATED:
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.ACTIVATED));
					break;
				case NetMessage.TYPE_SET_DEACTIVATED:
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.DEACTIVATED));
					break;
				case NetMessage.TYPE_QUIT:
					_bound = false;
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.QUIT));
					break;
				case NetMessage.TYPE_MESSAGE:					
					_parseMessage(__message.content);
					break;
			}
		
		}
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		
		private function _parseMessage(content:Object):void
		{
			if (content.content == null)			
				return;
			
			var taptabControllerMessage : TapTabControllerMessage = TapTabControllerMessage.parse(content);			
			var evt : TapTabControllerEvent
			switch (taptabControllerMessage.type)
			{
				case TapTabControllerMessage.CONTROL_CHANGE:					
					var controlValue : AbstractVO = VOFactory.parseUiValue(taptabControllerMessage.content);					
					evt = new TapTabControllerEvent(TapTabControllerEvent.CONTROL_CHANGE);					
					evt.value = controlValue;
					dispatchEvent(evt);					
					// keyboard mapping
					_controlsToKeyboardMapper.dispatchKeyboardEvent(controlValue);						
					break;			
				case TapTabControllerMessage.ORIENTATION_CHANGE:
					_orientation = String(taptabControllerMessage.content);					
					evt = new TapTabControllerEvent(TapTabControllerEvent.ORIENTATION_CHANGE);					
					evt.value = orientation;
					dispatchEvent(evt);
					break;			
				case TapTabControllerMessage.DEVICE_INFOS:
					var deviceInfoValue : DeviceInfosVO = DeviceInfosVO.parse(taptabControllerMessage.content);		
					_deviceInfos = deviceInfoValue;
					evt = new TapTabControllerEvent(TapTabControllerEvent.DEVICE_INFOS);					
					evt.value = deviceInfoValue;
					dispatchEvent(evt);
					break;
				case TapTabControllerMessage.USER_INFOS:
					_userInfo = UserInfosVO.parse(taptabControllerMessage.content);
					evt = new TapTabControllerEvent(TapTabControllerEvent.USER_INFOS);					
					evt.value = _userInfo;
					dispatchEvent(evt);
					break;
				case TapTabControllerMessage.SETTINGS_PANEL_OPEN:
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.SETTINGS_PANEL_OPEN));
					break;
				case TapTabControllerMessage.SETTINGS_PANEL_CLOSE:
					dispatchEvent(new TapTabControllerEvent(TapTabControllerEvent.SETTINGS_PANEL_CLOSE));
					break;
			}
		}
		


	}
}