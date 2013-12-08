package com.pixodrome.tenSeconds.components.physics
{
	/**
	 * @author Thomas
	 */
	public class Attractor
	{
		public var attract : Boolean = true;
		public var strength : Number;
		public var radius : Number;
		
		function Attractor(strength : Number, radius : Number = 1000)
		{
			this.strength = strength;
			
			this.radius = radius;
		}
	}
}
