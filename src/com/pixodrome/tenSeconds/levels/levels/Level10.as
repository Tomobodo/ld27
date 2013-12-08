package com.pixodrome.tenSeconds.levels.levels
{
	import ash.core.Entity;

	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.physics.Attractable;
	import com.pixodrome.tenSeconds.components.physics.Attractor;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.Rocket;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowR;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level10 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			var chackA : Entity = addCheckPoint(new Position(2000,0), new Rotation(-Math.PI/2));
			chackA.remove(Attractable);
			
			var chackB : Entity = addCheckPoint(new Position(-2000,0), new Rotation(Math.PI/2));
			chackB.remove(Attractable);
			
			var rocketA : Rocket = new Rocket();
			rocketA.add(new LookAt(this.rocket.get(Position)));
			rocketA.add(new Position(1900, 0));
			
			var rocketB : Rocket = new Rocket();
			rocketB.add(new LookAt(this.rocket.get(Position)));
			rocketB.add(new Position(-1900, 0));
			
			this.rocket.add(new Attractor(5e6));
			
			var arrowR : ArrowR = new ArrowR();
			arrowR.add(this.rocket.get(Position));
			arrowR.add(new LookAt(rocketA.get(Position)));
			
			var arrowR2 : ArrowR = new ArrowR();
			arrowR2.add(this.rocket.get(Position));
			arrowR2.add(new LookAt(rocketB.get(Position)));
			
			addEntity(rocketA);
			addEntity(rocketB);
			
			addEntity(arrowR);
			addEntity(arrowR2);
		}
		
	}
}
