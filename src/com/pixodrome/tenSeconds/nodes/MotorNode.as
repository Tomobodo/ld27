package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.Motor;
	import com.pixodrome.tenSeconds.components.Tank;
	import com.pixodrome.tenSeconds.components.control.Axis;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	/**
	 * @author Thomas
	 */
	public class MotorNode extends Node
	{
		
		public var controls : Axis;
		public var motor : Motor;
		public var tank : Tank;
		public var body : RigidBody;
		
	}
}
