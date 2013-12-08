package com.pixodrome.tenSeconds.components.Rendering
{
	import flash.geom.Point;
	
	/**
	 * @author Thomas
	 */
	public class CameraComp
	{
		public var isActive : Boolean;
		
		public var offset : Point;
		
		public var zoom : Number;
		
		function CameraComp()
		{
			this.isActive = true;
			
			this.offset = new Point();
			
			this.zoom = 1;
		}
		
	}
}
