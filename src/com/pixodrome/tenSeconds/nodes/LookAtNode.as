package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;
	/**
	 * @author Thomas
	 */
	public class LookAtNode extends Node
	{
		public var lookAt : LookAt;
		
		public var rotation : Rotation;
		
		public var scale : Scale;
		
		public var position : Position;
	}
}
