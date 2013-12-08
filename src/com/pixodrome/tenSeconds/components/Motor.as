package com.pixodrome.tenSeconds.components
{
	/**
	 * @author Thomas
	 */
	public class Motor
	{
		
		public var perf : Number;
		
		public var power : Number;
		
		public var force : Number;
		
		function Motor(power : Number, perf : Number = 1)
		{
			this.power = power;
			this.perf = perf;
			this.force = 0;
		}
		
	}
}
