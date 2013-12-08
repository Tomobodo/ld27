package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.Objective;
	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.components.transform.Position;
	/**
	 * @author Thomas
	 */
	public class CheckPointNode extends Node
	{
		
		public var objective : Objective;
		
		public var position : Position;
		
		public var physic : RigidBody;
		
		public var view : View;
		
	}
}
