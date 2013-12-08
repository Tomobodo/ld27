package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	/**
	 * @author Thomas
	 */
	public class PhysicNode extends Node
	{
		public var position : Position;
		public var rotation : Rotation;
		
		public var physic : RigidBody;
	}
}
