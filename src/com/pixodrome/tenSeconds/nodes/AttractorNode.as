package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.physics.Attractor;
	import com.pixodrome.tenSeconds.components.transform.Position;
	/**
	 * @author Thomas
	 */
	public class AttractorNode extends Node
	{
		public var position : Position;
		public var attraction : Attractor;
	}
}
