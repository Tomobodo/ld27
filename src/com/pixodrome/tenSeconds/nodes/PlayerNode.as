package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.Tank;
	import com.pixodrome.tenSeconds.components.control.Player;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	/**
	 * @author Thomas
	 */
	public class PlayerNode extends Node
	{
		
		public var player : Player;
		
		public var tank : Tank;
		
		public var position : Position;
		
		public var rotation : Rotation;
		
		public var physic : RigidBody;
		
	}
}
