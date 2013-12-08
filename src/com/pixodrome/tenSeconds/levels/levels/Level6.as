package com.pixodrome.tenSeconds.levels.levels
{
	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.Objective;
	import com.pixodrome.tenSeconds.components.control.Axis;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.entitys.Rocket;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowG;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Level6 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			var rocketA : Rocket = new Rocket();
			rocketA.add(new Position(200, 0));
			rocketA.add(new Objective());
			(rocketA.get(Axis) as Axis).yAxis = -0.5;
			(rocketA.get(Axis) as Axis).xAxis = -0.1;
			
			var arrowG : ArrowG = new ArrowG();
			arrowG.add(this.rocket.get(Position));
			arrowG.add(new LookAt(rocketA.get(Position)));
			
			addEntity(rocketA);
			addEntity(arrowG);
		}
		
	}
}
