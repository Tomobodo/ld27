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
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowY;
	import com.pixodrome.tenSeconds.entitys.planets.Sun;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level7 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			var rocketA : Rocket = new Rocket();
			rocketA.add(new LookAt(this.rocket.get(Position)));
			rocketA.add(new Position(200, -100));
			
			this.rocket.add(new Attractor(5e6));
			
			var arrowR : ArrowR = new ArrowR();
			arrowR.add(this.rocket.get(Position));
			arrowR.add(new LookAt(rocketA.get(Position)));
			
			(this.rocket.get(Rotation) as Rotation).angle = Math.PI / 2;
			
			addPlanet(Sun, ArrowY, new Position(0,5000));
			
			var checkpoint : Entity = addCheckPoint(new Position(200,-1000), new Rotation(Math.PI));
			checkpoint.remove(Attractable);
			
			addEntity(rocketA);
			addEntity(arrowR);
		}
		
	}
}
