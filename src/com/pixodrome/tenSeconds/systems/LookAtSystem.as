package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import com.pixodrome.tenSeconds.nodes.LookAtNode;
	/**
	 * @author Thomas
	 */
	public class LookAtSystem extends ListIteratingSystem
	{
		function LookAtSystem()
		{
			super(LookAtNode, this.onUpdate, this.onAdded, this.onRemoved);
		}

		private function onRemoved(node : LookAtNode) : void
		{
		}

		private function onAdded(node : LookAtNode) : void
		{
		}

		private function onUpdate(node : LookAtNode, time : Number) : void
		{
			var diffX : Number = node.position.x - node.lookAt.target.x;
			var diffY : Number = node.position.y - node.lookAt.target.y;
		
			var angle : Number = Math.atan2(diffY, diffX) + Math.PI;
			
			node.rotation.angle = angle;
		}
		
	}
}
