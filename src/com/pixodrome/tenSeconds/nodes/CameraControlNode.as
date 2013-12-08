package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.Rendering.CameraComp;
	import com.pixodrome.tenSeconds.components.control.Player;
	/**
	 * @author Thomas
	 */
	public class CameraControlNode extends Node
	{
		
		public var camera : CameraComp;
		
		public var player : Player;
		
	}
}
