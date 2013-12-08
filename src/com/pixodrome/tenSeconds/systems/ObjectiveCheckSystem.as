package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import com.pixodrome.tenSeconds.components.control.Player;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.nodes.CheckPointNode;
	/**
	 * @author Thomas
	 */
	public class ObjectiveCheckSystem extends ListIteratingSystem
	{
		
		private var allObjectiveChecked : Boolean;
		
		private var objectiveCompletedOnce : Boolean;
		
		private var onObjectiveComplete : Function;
		
		function ObjectiveCheckSystem(completeCallBack : Function)
		{
			this.onObjectiveComplete = completeCallBack;
			super(CheckPointNode, this.onUpdate, this.onAdded, this.onRemoved);
		}

		private function onRemoved(node : CheckPointNode) : void
		{
		}

		private function onAdded(node : CheckPointNode) : void
		{
		}
		
		override public function update(time : Number) : void
		{
			this.allObjectiveChecked = true;
			super.update(time);
			if(this.allObjectiveChecked && !this.objectiveCompletedOnce)
			{
				this.objectiveCompletedOnce = true;
				this.onObjectiveComplete();
			}
				
		}

		private function onUpdate(node : CheckPointNode, time : Number) : void
		{
			if(!node.objective.checked)
				this.allObjectiveChecked = false;
			
			for(var i : uint = 0; i < node.physic.collisions.length; ++i)
			{
				var colidingBody : RigidBody = node.physic.collisions[i];
				
				if(colidingBody.entity.has(Player) && !node.objective.checked)
				{
					if(!node.objective.checked)
					{
						node.objective.checked = true;
						node.view.next();
					}
				}
			}
		}
		
	}
}
