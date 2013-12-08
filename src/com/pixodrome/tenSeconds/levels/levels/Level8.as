package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowY;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteC;
	import com.pixodrome.tenSeconds.entitys.planets.Sun;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level8 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addPlanet(Sun, ArrowY, new Position(-3000,0));
			addPlanet(PlaneteC, null, new Position(-5000,500));
			
			addCheckPoint(new Position(-4700,400), new Rotation(Math.PI/2));
		}
		
	}
}
