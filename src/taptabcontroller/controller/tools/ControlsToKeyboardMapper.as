/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.controller.tools
{
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	
	import taptabcontroller.controller.Directions;
	import taptabcontroller.controller.ui.Stick360Modes;
	import taptabcontroller.controller.vo.AbstractVO;
	import taptabcontroller.controller.vo.ButtonVO;
	import taptabcontroller.controller.vo.Stick360VO;

	/**
	 *
	 * This class helps to map TapTab Controller control changes on Keyboard events.
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class ControlsToKeyboardMapper
	{
		
		
		private var _keyboardEventsDispatcher : EventDispatcher;
		
		private var _controlToKeyboardMap : Object;		
		
		private var _stick360LastDirections : Object;
		
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function ControlsToKeyboardMapper()
		{
			_init();
		}
		
		
		/**
		 *
		 * initialize the KeyboardMapper
		 *  
		 * @param __keyboardEventsDispatcher the eventDispatcher that the KeyboardMapper will use to dispatch Keyboard events
		 * 
		 */		
		public function init(__keyboardEventsDispatcher : EventDispatcher) : void
		{
			_keyboardEventsDispatcher = __keyboardEventsDispatcher;
		}
		
		
		/**
		 * @private
		 */		
		public function dispatchKeyboardEvent(__controlValue : AbstractVO) : void
		{
			switch (__controlValue.type)
			{
				case ButtonVO.TYPE:
					_dispatchKeyboardForButton(__controlValue as ButtonVO);
					break;
				case Stick360VO.TYPE:
					_dispatchKeyboardForStick360(__controlValue as Stick360VO);
					break;
			}
		}
		
		
		
		
		
		
		
		
		// MAP -------------------------------------------------------------------------------------------
		
		/**
		 *
		 * Maps a button control 
		 *  
		 * @param __buttonId the button id
		 * @param __keyCode the keyCode that will we dispatched 
		 * 
		 */		
		public function mapButton(__buttonId : String, __keyCode : uint) : void
		{
			_controlToKeyboardMap[__buttonId] = __keyCode;
		}
		
		
		/**
		 *
		 * Maps a stick360 control
		 *  
		 * @param __stickId the stick 360 id
		 * @param __stickMode the stick mode, see Stick360Modes
		 * @param __keyCodes an array containing 4 or 8 keycodes that will dispatched for the stick 4 or 8 directions in this order : [RIGHT, TOP, LEFT, BOTTOM] or [RIGHT, TOP_RIGHT, TOP, TOP_LEFT, LEFT, BOTTOM_LEFT, BOTTOM, BOTTOM_RIGHT]
		 * 
		 */		
		public function mapStick360(__stickId : String, __stickMode : String, __keyCodes : Array) : void
		{
			if(_controlToKeyboardMap[__stickId] == null)
			{
				_controlToKeyboardMap[__stickId] = {};
				_controlToKeyboardMap[__stickId].mode = __stickMode;
				_stick360LastDirections[__stickId] = null;
			}
						
			var i : int;	
			switch (__stickMode)
			{
				case Stick360Modes.MODE_4_DIRECTIONS:
					
					if(__keyCodes.length != Directions.DIRECTIONS_4.length)
						throw new Error("ControlToKeyboardMapper : Error, __keyCodes.lenght != 4 !");
					for (i = 0; i < Directions.DIRECTIONS_4.length; i++)
						_controlToKeyboardMap[__stickId][ Directions.DIRECTIONS_4[i] ] = __keyCodes[i];						
					break;
				case Stick360Modes.MODE_8_DIRECTIONS:
					
					if(__keyCodes.length != Directions.DIRECTIONS_8.length)
						throw new Error("ControlToKeyboardMapper : Error, __keyCodes.lenght != 8 !");
					
					for (i = 0; i < Directions.DIRECTIONS_8.length; i++)
						_controlToKeyboardMap[__stickId][ Directions.DIRECTIONS_8[i] ] = __keyCodes[i];						
					break;
				case Stick360Modes.MODE_ANALOGIC:
					throw new Error("ControlToKeyboardMapper : Error, can't map any keyCode with Stick360Modes.MODE_ANALOGIC !");
					break;
			}			
			
		}
		
		
		
		// UNMAP -----------------------------------------------------------------------------------------
		/**
		 *
		 * Unmaps a control
		 *  
		 * @param __controlId the control id
		 * 
		 */		
		public function unmapControl(__controlId : String) : void
		{
			delete _controlToKeyboardMap[__controlId];
		}
		
		/**
		 *
		 * Unmaps a button
		 *  
		 * @param __buttonId the button id
		 * 
		 */		
		public function unmapButton(__buttonId : String) : void
		{
			unmapControl(__buttonId);
		}
		
		/**
		 *
		 * Unmaps a stick 360
		 *  
		 * @param __stickId the stick 360 id
		 * 
		 */		
		public function unmapStick360(__stickId : String) : void
		{
			if(_controlToKeyboardMap[__stickId] == null)
				return;			
			delete _controlToKeyboardMap[__stickId];
		}
		
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		
		private function _dispatchKeyboardForStick360(__controlValue:Stick360VO):void
		{
			if (_keyboardEventsDispatcher == null)
				return;
			if (_controlToKeyboardMap[__controlValue.controlId] == null)
				return;
			
			// new direction
			var newDirection : String;
			switch (_controlToKeyboardMap[__controlValue.controlId].mode)
			{
				case Stick360Modes.MODE_4_DIRECTIONS:
					newDirection = __controlValue.value4Directions;
					break;
				case Stick360Modes.MODE_8_DIRECTIONS:
					newDirection = __controlValue.value8Directions;
					break;
			}
			
			// last direction
			var lastDirection : String = _stick360LastDirections[__controlValue.controlId];
			// si même direction alors on abort
			if(lastDirection != newDirection)
			{
				var keybEvent : KeyboardEvent;
				
				// key up de la direction précédente
				if(lastDirection != Directions.NONE)
				{
					keybEvent = new KeyboardEvent(KeyboardEvent.KEY_UP);
					keybEvent.keyCode = _controlToKeyboardMap[__controlValue.controlId][ _stick360LastDirections[__controlValue.controlId] ];
					_keyboardEventsDispatcher.dispatchEvent(keybEvent);
					_stick360LastDirections[__controlValue.controlId] = Directions.NONE;
				}
				
				// key down
				if (newDirection != Directions.NONE)
				{
					keybEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
					keybEvent.keyCode = _controlToKeyboardMap[__controlValue.controlId][newDirection];
					_keyboardEventsDispatcher.dispatchEvent(keybEvent);
					_stick360LastDirections[__controlValue.controlId] = newDirection;
				}
				
			}
			
		}
		

		private function _dispatchKeyboardForButton(__controlValue:ButtonVO):void
		{
			if (_keyboardEventsDispatcher == null)
				return;
			if (_controlToKeyboardMap[__controlValue.controlId] == null)
				return;
			
			var keybEvent : KeyboardEvent = new KeyboardEvent( __controlValue.pressed ? KeyboardEvent.KEY_DOWN : KeyboardEvent.KEY_UP);
			keybEvent.keyCode = _controlToKeyboardMap[__controlValue.controlId];
			
			_keyboardEventsDispatcher.dispatchEvent(keybEvent);			
		}		
		
		
		
		
		
		private function _init() : void
		{
			_controlToKeyboardMap = {};
			_stick360LastDirections = {};
		}
		
		
		
	}
}





