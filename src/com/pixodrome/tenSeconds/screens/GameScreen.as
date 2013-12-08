package com.pixodrome.tenSeconds.screens
{
	import ash.core.Engine;
	import ash.core.Entity;

	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;

	import com.pixodrome.scoliosis.screen.Screen;
	import com.pixodrome.tenSeconds.levels.LevelBase;
	import com.pixodrome.tenSeconds.systems.AttractorSystem;
	import com.pixodrome.tenSeconds.systems.CameraSystem;
	import com.pixodrome.tenSeconds.systems.CollisionsFlushSystem;
	import com.pixodrome.tenSeconds.systems.GuiSystem;
	import com.pixodrome.tenSeconds.systems.KeyBoardControlSystem;
	import com.pixodrome.tenSeconds.systems.LookAtSystem;
	import com.pixodrome.tenSeconds.systems.MotorSystem;
	import com.pixodrome.tenSeconds.systems.ObjectiveCheckSystem;
	import com.pixodrome.tenSeconds.systems.PhysicSystem;
	import com.pixodrome.tenSeconds.systems.RenderSystem;
	import com.pixodrome.tenSeconds.systems.StarFieldSystem;

	import flash.ui.Keyboard;
	import flash.utils.getTimer;

	/**
	 * @author Thomas
	 */
	public class GameScreen extends Screen
	{
		private var ash : Engine;
		private var time : Number;
		private var renderSystem : RenderSystem;
		private var physicSystem : PhysicSystem;
		private var worldcontainer : Sprite;
		private var GUIContainer : Sprite;
		private var levelClass : Class;
		private var idLevel : uint;

		function GameScreen(level : Class, idLevel : uint)
		{
			this.time = getTimer();
			this.ash = new Engine();
			
			this.idLevel = idLevel;

			this.worldcontainer = new Sprite();
			this.GUIContainer = new Sprite();

			renderSystem = new RenderSystem(this.worldcontainer);
			physicSystem = new PhysicSystem();
			
			this.addChild(this.worldcontainer);
			this.addChild(this.GUIContainer);

			this.ash.addSystem(new KeyBoardControlSystem(this.scoliosis.stage), 1);
			this.ash.addSystem(new MotorSystem(), 2);
			this.ash.addSystem(new AttractorSystem(), 4);
			this.ash.addSystem(physicSystem, 5);
			this.ash.addSystem(new LookAtSystem(), 6);
			this.ash.addSystem(new ObjectiveCheckSystem(this.gotoInterLevel), 7);
			this.ash.addSystem(renderSystem, 10);
			this.ash.addSystem(new CameraSystem(this.worldcontainer), 15);
			this.ash.addSystem(new StarFieldSystem(this.worldcontainer, 50), 16);
			this.ash.addSystem(new GuiSystem(this.GUIContainer), 20);
			this.ash.addSystem(new CollisionsFlushSystem(), 50);
			
			if(!level)
				this.levelClass = LevelBase;
			else
				this.levelClass = level;
				
			this.loadLevel();
			
			this.RESUMED.add(this.onResumed);

			this.updateEngine();
		}
		
		private function gotoInterLevel() : void
		{
			this.scoliosis.gotoScreen(new InterLevel(this.idLevel));
		}

		private function onKeydown(event : KeyboardEvent) : void
		{
			if(event.keyCode == Keyboard.R)
				this.scoliosis.gotoScreen(new GameScreen(this.levelClass, this.idLevel));
			
			if(event.keyCode == Keyboard.P)
				this.scoliosis.pushScreen(new Pause());
		}
		
		public function loadLevel() : void
		{
			var level : LevelBase = new this.levelClass();
			
			var entitys : Vector.<Entity> = level.getEntitys();
			var nbEntity : uint = entitys.length;
			
			for(var i : uint = 0; i < nbEntity; ++i)
				this.ash.addEntity(entitys[i]);
		}

		private function onResumed() : void
		{
			this.time = getTimer();
		}

		override public function addListeners() : void
		{
			this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, this.onKeydown);
		}

		override public function removeListeners() : void
		{
			this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
			this.stage.removeEventListener(KeyboardEvent.KEY_UP, this.onKeydown);
		}

		private function onEnterFrame(event : Event) : void
		{
			this.updateEngine();
		}

		private function updateEngine() : void
		{
			var t : Number = getTimer();
			var dt : Number = (t - this.time) * 0.001;
			this.ash.update(dt);
			this.time = t;
		}
	}
}
