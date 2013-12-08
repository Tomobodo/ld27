package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import nape.dynamics.Arbiter;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.space.Space;
	import nape.util.BitmapDebug;

	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.nodes.PhysicNode;
	/**
	 * @author Thomas
	 */
	public class PhysicSystem extends ListIteratingSystem
	{
		private var world : Space;
		private var debug : BitmapDebug;
		private var currentBody : RigidBody;
		
		
		function PhysicSystem()
		{
			this.world = new Space(Vec2.weak(0,0));
			
			this.debug = new BitmapDebug(800,480,0x000000, true);
			
		
			super(PhysicNode, this.onUpdate, this.onAdded, this.onRemoved);
		}

		private function onRemoved(node : PhysicNode) : void
		{
			node.physic.body.space = null;
			
			node.physic.entity = null;
		}

		private function onAdded(node : PhysicNode) : void
		{
			node.physic.body.position.x = node.position.x;
			node.physic.body.position.y = node.position.y;
			
			node.physic.body.rotation = node.rotation.angle;
			
			node.physic.body.space = this.world;
			
			node.physic.entity = node.entity;
		}

		private function onUpdate(node : PhysicNode, dt : Number) : void
		{
			var body : Body = node.physic.body;
			var offset : Vec2 = node.physic.graphicOffset;
			var pos : Vec2 = node.physic.body.localPointToWorld(offset);
			
			node.position.x = pos.x;			
			node.position.y = pos.y;
			node.rotation.angle = node.physic.body.rotation;
			
			this.currentBody = node.physic;
			
			body.arbiters.foreach(this.checkArbiters);
		}
		
		private function checkArbiters(arb : Arbiter) : void
		{
			if (!arb.isCollisionArbiter()) return;
			
			var otherBody : RigidBody;
			
			if(arb.body1 != this.currentBody.body)
				otherBody = arb.body1.userData[RigidBody.USER_DATA_BODY];
			else
				otherBody = arb.body2.userData[RigidBody.USER_DATA_BODY];
			
			this.currentBody.collisions.push(otherBody);
		}

		override public function update(time : Number) : void
		{
			this.world.step(time);
			super.update(time);
			
			this.debug.clear();
			this.debug.draw(this.world);
			this.debug.flush();
		}
		
		public function getDebug() : BitmapDebug
		{
			return this.debug;
		}

	}
}
