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
	 * @private
	 *  
	 * @author Grégory Lardon
	 * 
	 */	
	public class VOFactory
	{
		
		/**
		 * 
		 * @private 
		 * 
		 */		
		public static function parseUiValue(__obj : Object) : AbstractVO			
		{
			switch (__obj.type)
			{
				case ButtonVO.TYPE:
					return ButtonVO.parse(__obj);					
					break;
				case Stick360VO.TYPE:					
					return Stick360VO.parse(__obj);
					break;			
				case GesturePadDoubleTapVO.TYPE:					
					return GesturePadDoubleTapVO.parse(__obj);
					break;			
				case GesturePadRotateVO.TYPE:					
					return GesturePadRotateVO.parse(__obj);
					break;			
				case GesturePadScaleVO.TYPE:					
					return GesturePadScaleVO.parse(__obj);
					break;			
				case GesturePadSwipeVO.TYPE:					
					return GesturePadSwipeVO.parse(__obj);
					break;			
				case GesturePadTapVO.TYPE:					
					return GesturePadTapVO.parse(__obj);
					break;			
				case GesturePadTouchVO.TYPE:					
					return GesturePadTouchVO.parse(__obj);
					break;			
				case GyroscopeVO.TYPE:					
					return GyroscopeVO.parse(__obj);
					break;			
				case AccelerometerVO.TYPE:					
					return AccelerometerVO.parse(__obj);
					break;			
			}
			return null;
		}
	}
}