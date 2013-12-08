package com.pixodrome.tenSeconds.levels.tutos
{
	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.entitys.arrows.Arrow;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowG;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowY;
	import com.pixodrome.tenSeconds.entitys.instructions.Cross;
	import com.pixodrome.tenSeconds.entitys.instructions.InstC;
	import com.pixodrome.tenSeconds.entitys.planets.PlaneteA;
	import com.pixodrome.tenSeconds.entitys.planets.Sun;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Tuto3 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			
			var crossA : Cross = new Cross(1000, 200);
			var crossB : Cross = new Cross(-2000, 1000);
			
			var arrowA : ArrowG = new ArrowG();
			arrowA.add(this.rocket.get(Position));
			arrowA.add(new LookAt(crossA.get(Position)));
			
			var arrowB : ArrowG = new ArrowG();
			arrowB.add(this.rocket.get(Position));
			arrowB.add(new LookAt(crossB.get(Position)));
			
			addPlanet(PlaneteA, Arrow, new Position(500,0));
			addPlanet(Sun, ArrowY, new Position(-1000, 4000));
			
			var inst : InstC = new InstC();
			
			addEntity(crossA);
			addEntity(arrowA);
			
			addEntity(crossB);
			addEntity(arrowB);
			
			addEntity(inst);
		}
		
	}
}
