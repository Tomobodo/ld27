package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import starling.display.DisplayObjectContainer;

	import com.pixodrome.tenSeconds.nodes.RenderNode;
	/**
	 * @author Thomas
	 */
	public class RenderSystem extends ListIteratingSystem
	{
		
		private var container : DisplayObjectContainer;
		
		function RenderSystem(container : DisplayObjectContainer)
		{
			this.container = container;
			
			super(RenderNode, this.onUpdate, this.onNodeAdded, this.onNoderemoved);
		}

		private function onNoderemoved(node : RenderNode) : void
		{
			this.container.removeChild(node.view.display);
		}

		private function onNodeAdded(node : RenderNode) : void
		{
			this.container.addChild(node.view.display);
		}
		
		private function onUpdate(node : RenderNode, dt : Number) : void
		{
			node.view.display.x = node.position.x;
			node.view.display.y = node.position.y;
			
			node.view.display.scaleX = node.scale.x;
			node.view.display.scaleY = node.scale.y;
			
			node.view.display.rotation = node.rotation.angle;
		}
		
	}
}
