package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteC;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level5 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addCheckPoint(new Position(2000,2000), new Rotation());
			addCheckPoint(new Position(-2000,-2000), new Rotation());
			
			addPlanet(PlaneteC, null, new Position(2000,2300));
			addPlanet(PlaneteC, null, new Position(-2000,-2300));
		}
		
	}
}
