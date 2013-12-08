package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import com.pixodrome.tenSeconds.nodes.PhysicNode;

	/**
	 * @author Thomas
	 */
	public class CollisionsFlushSystem extends ListIteratingSystem
	{
		function CollisionsFlushSystem()
		{
			super(PhysicNode, this.onUpdate, this.onAdded, this.onRemoved);
		}

		private function onRemoved(node : PhysicNode) : void
		{
		}

		private function onAdded(node : PhysicNode) : void
		{
		}

		private function onUpdate(node : PhysicNode, time : Number) : void
		{
			while (node.physic.collisions.length > 0)
			{
				node.physic.collisions.pop();
			}
		}
	}
}
