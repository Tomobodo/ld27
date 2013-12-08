package com.pixodrome.tenSeconds.levels.tutos
{
	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowG;
	import com.pixodrome.tenSeconds.entitys.instructions.Cross;
	import com.pixodrome.tenSeconds.entitys.instructions.InstA;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	/**
	 * @author Thomas
	 */
	public class Tuto1 extends LevelBase
	{
		
		override protected function createLevel() : void
		{
			
			var cross : Cross = new Cross(200, 200);
			
			var arrow : ArrowG = new ArrowG();
			arrow.add(this.rocket.get(Position));
			arrow.add(new LookAt(cross.get(Position)));
			
			var insta : InstA = new InstA();
			
			addEntity(cross);
			addEntity(arrow);
			addEntity(insta);
		}
		
	}
}
