package com.pixodrome.tenSeconds.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;

	import nape.geom.Vec2;
	import nape.phys.Body;

	import com.pixodrome.tenSeconds.nodes.AttractableNode;
	import com.pixodrome.tenSeconds.nodes.AttractorNode;

	/**
	 * @author Thomas
	 */
	public class AttractorSystem extends System
	{
		private var attractorList : NodeList;
		private var attractableList : NodeList;

		function AttractorSystem()
		{
		}

		override public function addToEngine(engine : Engine) : void
		{
			this.attractorList = engine.getNodeList(AttractorNode);
			this.attractableList = engine.getNodeList(AttractableNode);
		}

		override public function update(time : Number) : void
		{
			for (var attractable : AttractableNode = this.attractableList.head; attractable; attractable = attractable.next)
			{
				var body : Body = attractable.physic.body;
				var distX : Number;
				var distY : Number;
				var dist : Number;
				var force : Vec2;
				
				for (var attractor : AttractorNode = this.attractorList.head; attractor; attractor = attractor.next)
				{
					if (attractor.entity != attractable.entity)
					{
						distX = attractor.position.x - body.position.x;
						distY = attractor.position.y - body.position.y;

						dist = distX * distX + distY * distY;
						
						force = Vec2.get(distX, distY);
						force.length = (attractor.attraction.strength * body.mass) / dist;
						
						if (force.length > 0)
							body.applyImpulse(force.muleq(time), null, true);
							
						force.dispose();
					}
				}
			}
		}
	}
}
