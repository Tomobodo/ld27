package com.pixodrome.tenSeconds.components.physics
{
	import ash.core.Entity;

	import nape.geom.Vec2;
	import nape.phys.Body;
	/**
	 * @author Thomas
	 */
	public class RigidBody
	{
		
		public var body : Body;
		
		public var graphicOffset : Vec2;
		
		public var collisions : Vector.<RigidBody>;
		
		public var entity : Entity;
		
		public static const USER_DATA_BODY : String = "RigidBody";
		
		function RigidBody(body : Body, offset : Vec2 = null)
		{
			this.body = body;
			if(offset)
				this.graphicOffset = offset;
			else
				this.graphicOffset = new Vec2();
			
			this.collisions = new Vector.<RigidBody>();
			
			body.userData[USER_DATA_BODY] = this;
		}
		
	}
}
