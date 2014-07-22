/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.controller.vo
{
	
	/**
	 *
	 * Device Infos Value Object
	 * see screenResolutionX, screenResolutionY, dpi, os, manufacturer, tapTabApiVersion properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class DeviceInfosVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "DEVICE_INFOS_VALUE"
		
			
			
		/**
		 * the TapTabController device screen resolution X
		 */			
		public var screenResolutionX : Number;
		
		/**
		 * the TapTabController device screen resolution Y
		 */		
		public var screenResolutionY : Number;
		
		/**
		 * the TapTabController device screen dpi
		 */		
		public var dpi : Number;
		
		/**
		 * the TapTabController device operating system 
		 */		
		public var os : String = "";
		
		/**
		 * the TapTabController device manufacturer
		 */		
		public var manufacturer : String = "";
		
		/**
		 * mad adress
		 */		
		public var macAdress : String = "";
		
		/**
		 * the TapTabController TapTab Api version
		 */		
		public var tapTabApiVersion : String = "";
		
		
		
		
		
		
		
		
		
		/**
		 * Constructor 
		 * 
		 */		
		public function DeviceInfosVO()
		{
			super(TYPE, "deviceInfos");
		}
		
		
		
		
		
		/**
		 * 
		 * @return true it the TapTabController device runs under iOS operating system
		 * 
		 */		
		public function isIOS() : Boolean
		{
			return os.indexOf("iPhone") != -1;
		}
		
		/**
		 * 
		 * @return true it the TapTabController device runs under Android operating system 
		 * 
		 */		
		public function isAndroid() : Boolean
		{
			return manufacturer.indexOf("Android") != -1;
		}		
		
		
		
		
		
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : DeviceInfosVO
		{
			var value : DeviceInfosVO = new DeviceInfosVO();			
			
			value.screenResolutionX = __obj.screenResolutionX;
			value.screenResolutionY = __obj.screenResolutionY;
			value.dpi = __obj.dpi;
			value.os = __obj.os;
			value.manufacturer = __obj.manufacturer;
			value.macAdress = __obj.macAdress;
			value.tapTabApiVersion = __obj.tapTabApiVersion;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[DeviceInfosValue] " + macAdress + ", " + screenResolutionX + ", "+ screenResolutionY + ", "+ dpi + ", "+ os + ", "+ manufacturer + ", " + tapTabApiVersion;
		}
	}
}
