package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteB;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level1 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addPlanet(PlaneteB, null, new Position(1000,0));
			addCheckPoint(new Position(1300,0), new Rotation(Math.PI / 2));
		}
		
	}
}
