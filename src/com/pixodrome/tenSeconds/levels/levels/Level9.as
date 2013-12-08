package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowY;
	import com.pixodrome.tenSeconds.entitys.planets.Sun;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level9 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addPlanet(Sun, ArrowY, new Position(3000,0));
			
			addCheckPoint(new Position(4000,0), new Rotation(Math.PI/2));
		}
		
	}
}
