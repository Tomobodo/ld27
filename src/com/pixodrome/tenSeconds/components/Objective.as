package com.pixodrome.tenSeconds.components
{
	/**
	 * @author Thomas
	 */
	public class Objective
	{
		
		public var checked : Boolean;
		
		public var finalObjective : Boolean;
		
		function Objective(finalObjective : Boolean = false)
		{
			this.finalObjective = finalObjective;
		}
		
	}
}
