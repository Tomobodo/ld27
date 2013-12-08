package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.Rocket;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteC;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level3 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addPlanet(PlaneteC, null, new Position(-2000,1000));
			
			addCheckPoint(new Position(-2300,1000), new Rotation(-Math.PI / 2));
			
			var rocketA : Rocket = new Rocket();
			rocketA.add(new Position(-2300,970));
			rocketA.add(new Rotation(-Math.PI/2));
			
			var rocketB : Rocket = new Rocket();
			rocketB.add(new Position(-2300,1030));
			rocketB.add(new Rotation(-Math.PI/2));
			
			addEntity(rocketA);
			addEntity(rocketB);
		}
		
	}
}
