package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import nape.geom.Vec2;
	import nape.phys.Body;

	import com.pixodrome.tenSeconds.components.Motor;
	import com.pixodrome.tenSeconds.components.Tank;
	import com.pixodrome.tenSeconds.nodes.MotorNode;

	/**
	 * @author Thomas
	 */
	public class MotorSystem extends ListIteratingSystem
	{
		function MotorSystem()
		{
			super(MotorNode, this.onUpdate, this.onNodeAdded, this.onNodeRemoved);
		}

		private function onUpdate(node : MotorNode, time : Number) : void
		{
			var motor : Motor = node.motor;
			var xAxis : Number = node.controls.xAxis;
			var yAxis : Number = node.controls.yAxis;
			var tank : Tank = node.tank;
			var body : Body = node.body.body;

			// move motor
			var direction : Vec2 = new Vec2(-yAxis, 0);
			direction.rotate(body.rotation);
			
			var fuelUsed : Number = Math.abs(yAxis * time);

			if (fuelUsed > tank.contains)
				fuelUsed = tank.contains;

			tank.contains -= fuelUsed;

			motor.force = computeForce(fuelUsed, motor.power, motor.perf);
			
			if(yAxis > 0)
				motor.force *= 0.5;
			
			direction.muleq(motor.force);
			body.applyImpulse(direction.muleq(time));
			
			// direction motor
			fuelUsed = Math.abs(xAxis * time);
			
			if (fuelUsed > tank.contains)
				fuelUsed = tank.contains;

			tank.contains -= fuelUsed;
			
			var rotationPulse : Number = computeForce(fuelUsed, motor.power, motor.perf) * xAxis / 5;
			
			body.applyAngularImpulse(rotationPulse * time * 10);
		}

		private function computeForce(fuelUsed : Number, power : Number, perf : Number) : Number
		{
			var force : Number = fuelUsed * power * perf * 1e3;
			return force;
		}

		private function onNodeRemoved(node : MotorNode) : void
		{
		}

		private function onNodeAdded(node : MotorNode) : void
		{
		}
	}
}
