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
	 * UserInfos Value Object
	 * see userName, userColor properties
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class UserInfosVO extends AbstractVO
	{
		
		
		/**
		 * the constant that identifies the Value Object 
		 */		
		public static const TYPE : String = "DEVICE_INFOS_VALUE"
		
			
		/**
		 * the user name
		 */			
		public var userName : String;
		
		
		/**
		 * the user color
		 */		
		public var userColor : Number;
		
		
		
		/**
		 *
		 * Constructor
		 * 
		 */	
		public function UserInfosVO()
		{
			super(TYPE, "userInfos");
		}
		
		
		/**
		 * @private
		 */	
		public static function parse(__obj : Object) : UserInfosVO
		{
			var value : UserInfosVO = new UserInfosVO();			
			
			value.userName = __obj.userName;
			value.userColor = __obj.userColor;
			
			return value;
		}
		
		
		public function toString() : String
		{
			return "[DeviceInfosValue] " + userName + ", "+ userColor;
		}
	}
}