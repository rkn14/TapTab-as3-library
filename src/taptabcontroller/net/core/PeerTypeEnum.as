/*
TapTab as3 library
Copyright 2014 Grégory Lardon. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package taptabcontroller.net.core
{
	public class PeerTypeEnum
	{
		
		/**
		 * PeerTypeEnum with name "TapTab Controller"
		 * Represents a TapTab Controller connected to a NetGroup
		 */		
		public static const TAPTAB_CONTROLLER : PeerTypeEnum = new PeerTypeEnum("TapTab Controller");
		
		/**
		 * PeerTypeEnum with name "TapTab Client"
		 * Represents a TapTab Client connected to a NetGroup
		 */		
		public static const TAPTAB_CLIENT : PeerTypeEnum = new PeerTypeEnum("TapTab Client");
		
		
		
		private var _name : String;
		/**
		 * 
		 * @return the PeerTypeEnum name 
		 * 
		 */		
		public function get name():String { return _name; }
		
		
		
		private static var _items : Array = [TAPTAB_CONTROLLER, TAPTAB_CLIENT];
		/**
		 * 
		 * returns the PeerTypeEnum instance bye its name
		 * 
		 * @param __name the PeerTypeEnum name
		 * @return 
		 * 
		 */		
		public static function getByName(__name : String) : PeerTypeEnum
		{
			for each (var item : PeerTypeEnum in _items)
				if (item.name == __name)
					return item;
			return null;
		}
		
		
		
		/**
		 *
		 * Constructor
		 *  
		 * @param __name the PeerTypeEnum name
		 * 
		 */		
		public function PeerTypeEnum(__name : String)
		{
			_name = __name;
		}

		

	}
}