package com.pixodrome.tenSeconds.levels.tutos
{
	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.entitys.arrows.Arrow;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowG;
	import com.pixodrome.tenSeconds.entitys.instructions.Cross;
	import com.pixodrome.tenSeconds.entitys.instructions.InstB;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteA;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Tuto2 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			
			var cross : Cross = new Cross(1000, 200);
			
			var arrow : ArrowG = new ArrowG();
			arrow.add(this.rocket.get(Position));
			arrow.add(new LookAt(cross.get(Position)));
			
			addPlanet(PlaneteA, Arrow, new Position(500,0));
			
			var inst : InstB = new InstB();
			
			addEntity(cross);
			addEntity(arrow);
			addEntity(inst);
		}
		
	}
}
