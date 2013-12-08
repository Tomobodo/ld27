package com.pixodrome.tenSeconds.components
{
	/**
	 * @author Thomas
	 */
	public class Tank
	{
		
		public var capacity : Number;
		
		public var contains : Number;
		
		function Tank(capacity : Number)
		{
			this.capacity = capacity;
			this.contains = 0;
		}
		
		public function fill()
		{
			this.contains = this.capacity;
		}
		
	}
}
