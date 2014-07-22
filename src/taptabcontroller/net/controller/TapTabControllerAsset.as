/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.utils.ByteArray;

	/**
	 * 
	 * @author Grégory Lardon
	 * 
	 */
	public class TapTabControllerAsset extends EventDispatcher
	{
		
		/**
		 * @private
		 */		
		public static const EVENT_READY : String = "TapTabControllerAsset.READY";
		
		
		/**
		 * TapTabControllerAsset of type image
		 */		
		public static const TYPE_IMAGE : String = "IMAGE";
		
		/**
		 * TapTabControllerAsset of type sound
		 */		
		public static const TYPE_SOUND : String = "SOUND";
		
		
		
		
		private var _ready : Boolean = false;
		/**
		 * @private
		 */		
		public function get ready() : Boolean {return _ready;}
		
		
		private var _loader : Loader;
		
		
		
		
		/**
		 * the asset data as ByteArray
		 */		
		public var data : ByteArray;
		
		/**
		 * the asset type, see constants
		 */		
		public var type : String;
		
		
		
		/**
		 * 
		 * @param __type the asset data as ByteArray
		 * @param __data the asset type, see constants
		 * 
		 */		
		public function TapTabControllerAsset(__type : String, __data : ByteArray)
		{
			data = __data;
			type = __type;
		}
		
		/**
		 * @private
		 */		
		public function dispose() : void
		{
			_loader = null;
			if(data)
				data.clear();
			data = null;
			_ready = false;
		}
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : TapTabControllerAsset
		{
			return new TapTabControllerAsset(__obj.type, __obj.data);
		}
		
		
		
		
		
		/**
		 * @private
		 */		
		public function load() : void
		{
			switch (type)
			{
				case TYPE_IMAGE:
					_loader = new Loader();
					_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _handler_Loader);
					_loader.loadBytes(data);
					break;
				case TYPE_SOUND:
					_isReady();
					break;
			}
		}
		
		
		/**
		 * @private
		 */		
		public function getAsset() : Object
		{
			if(!_ready)
				return null;
			
			switch (type)
			{
				case TYPE_IMAGE:
					return (_loader.contentLoaderInfo.content as Bitmap).bitmapData;
					break;
				case TYPE_SOUND:
					var snd : Sound = new Sound();
					snd.loadCompressedDataFromByteArray(data, data.length);
					return snd;
					break;
			}
			return null;
		}
		
		
		
		
		
		
		
		
		
		
		
		// === PRIVATE =========================================================================================================
		
		protected function _handler_Loader(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, _handler_Loader);			
			_isReady();
		}
				
		private function _isReady():void
		{
			_ready = true;
			dispatchEvent(new Event(EVENT_READY));		
		}
		
	}
}