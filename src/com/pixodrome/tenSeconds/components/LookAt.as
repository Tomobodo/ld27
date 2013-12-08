package com.pixodrome.tenSeconds.components
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	/**
	 * @author Thomas
	 */
	public class LookAt
	{
		
		public var target : Position;
		
		function LookAt(target : Position)
		{
			this.target = target;
		}
	}
}
