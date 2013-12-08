package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.physics.Attractable;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	/**
	 * @author Thomas
	 */
	public class AttractableNode extends Node
	{
		
		public var attracable : Attractable;
		public var physic : RigidBody;
		
	}
}
