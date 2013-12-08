package com.pixodrome.tenSeconds.levels
{
	import ash.core.Entity;

	import com.pixodrome.tenSeconds.components.LookAt;
	import com.pixodrome.tenSeconds.components.Rendering.CameraComp;
	import com.pixodrome.tenSeconds.components.control.Player;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.entitys.Rocket;
	import com.pixodrome.tenSeconds.entitys.arrows.ArrowG;
	import com.pixodrome.tenSeconds.entitys.checkPoints.CheckPoint;
	/**
	 * @author Thomas
	 */
	public class LevelBase
	{
		
		private var entityList : Vector.<Entity>;
		protected var rocket : Rocket;
		
		function LevelBase()
		{
			this.entityList = new Vector.<Entity>();
			
			this.addMainEntitys();
			
			this.createLevel();
			
			this.entityList.push(this.rocket);
		}

		protected function createLevel() : void
		{
		}

		private function addMainEntitys() : void
		{
			var cam : CameraComp = new CameraComp();
			cam.offset.x = 400;
			cam.offset.y = 240;
			cam.zoom = 1;
			
			this.rocket = new Rocket();
			this.rocket.add(cam);
			this.rocket.add(new Player());
			
		}
		
		final public function getEntitys() : Vector.<Entity>
		{
			return this.entityList;
		}
		
		protected function addEntity(entity : Entity) : void
		{
			this.entityList.push(entity);
		}
		
		protected function addCheckPoint(position : Position, rotation : Rotation) : Entity
		{
			var checkPoint : CheckPoint = new CheckPoint();
			checkPoint.add(position);
			checkPoint.add(rotation);
			this.addEntity(checkPoint);
			
			var arrow : ArrowG = new ArrowG();
			arrow.add(this.rocket.get(Position));
			arrow.add(new LookAt(checkPoint.get(Position)));
			this.addEntity(arrow);
			
			return checkPoint;
		}
		
		protected function addPlanet(planetClass : Class, arrowClass : Class, position : Position) : Entity
		{
			var planet : Entity = new planetClass();
			planet.add(position);
			
			if(arrowClass != null)
			{
				var arrow : Entity = new arrowClass();
				arrow.add(this.rocket.get(Position));
				arrow.add(new LookAt(planet.get(Position)));
				this.entityList.push(arrow);
			}
			
			this.entityList.push(planet);
			
			return planet;
		}
		
	}
}
