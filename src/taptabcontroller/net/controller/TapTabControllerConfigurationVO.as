/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.controller
{
	
	/**
	 * 
	 * @author Grégory Lardon
	 * 
	 */
	public class TapTabControllerConfigurationVO
	{
		
		/**
		 * the first layout id
		 */		
		public var firstLayoutID : String;
		
		/**
		 * an array of layouts XML
		 */		
		public var layouts : Array;
		
		/**
		 * an Object containing TapTabControllerAsset instances
		 */		
		public var assets : Object;
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function TapTabControllerConfigurationVO()
		{
			_build();
		}
		

		/**
		 * @private 
		 */		
		public function generateLayouts() : Object
		{
			var res : Object = {};
			for each (var xmlStr : String in layouts)
			{
				var xml : XML = new XML(xmlStr);
				var id : String = xml.@id;
				res[id] = xml;
			}
			return res;
		}
		
		
		/**
		 * @private
		 */		
		public static function parse(__obj : Object) : TapTabControllerConfigurationVO
		{
			var conf : TapTabControllerConfigurationVO = new TapTabControllerConfigurationVO();
			
			conf.assets = __obj.assets;
			conf.layouts = __obj.layouts;
			conf.firstLayoutID = __obj.firstLayoutID;
			
			return conf;
		}
		
		
		
		
		
		
		
		private function _build():void
		{
			assets = {};
			layouts = [];
		}		
		
		
	}
}