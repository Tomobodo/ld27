package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level4 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			addCheckPoint(new Position(500,-500), new Rotation(-Math.PI));
			addCheckPoint(new Position(-500,-500), new Rotation(-Math.PI));
			addCheckPoint(new Position(500, 500), new Rotation(0));
			addCheckPoint(new Position(-500, 500), new Rotation(0));
		}
		
	}
}
