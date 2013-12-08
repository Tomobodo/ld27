package com.pixodrome.tenSeconds.nodes
{
	import ash.core.Node;

	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;
	/**
	 * @author Thomas
	 */
	public class RenderNode extends Node
	{
		
		public var position : Position;
		public var scale : Scale;
		public var rotation : Rotation;
		
		public var view : View;
		
	}
}
