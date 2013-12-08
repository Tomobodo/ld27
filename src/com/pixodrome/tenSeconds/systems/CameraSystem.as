package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import starling.display.DisplayObjectContainer;

	import com.pixodrome.tenSeconds.nodes.CameraNode;

	/**
	 * @author Thomas
	 */
	public class CameraSystem extends ListIteratingSystem
	{
		private var worldContainer : DisplayObjectContainer;
		function CameraSystem(worldConatainer : DisplayObjectContainer)
		{
			this.worldContainer = worldConatainer;
			super(CameraNode, this.onUpdate, this.onAdded, this.onRemoved);
		}

		private function onRemoved(node : CameraNode) : void
		{
		}

		private function onAdded(node : CameraNode) : void
		{
		}

		private function onUpdate(node : CameraNode, time : Number) : void
		{
			if(node.camera.zoom < 0.005)
				node.camera.zoom = 0.005;
			
			this.worldContainer.pivotX = node.position.x - node.camera.offset.x / node.camera.zoom;
			this.worldContainer.pivotY  = node.position.y - node.camera.offset.y / node.camera.zoom;

			this.worldContainer.scaleX = node.camera.zoom;
			this.worldContainer.scaleY = node.camera.zoom;

		}
	}
}
