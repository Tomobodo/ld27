package com.pixodrome.tenSeconds
{
	import com.pixodrome.scoliosis.Scoliosis;
	import com.pixodrome.scoliosis.transition.FadeTransition;
	import com.pixodrome.tenSeconds.screens.MainMenu;

	import flash.display.Sprite;
	import flash.events.Event;

	[Frame(factoryClass="com.pixodrome.tenSeconds.Preloader")]
	[SWF(backgroundColor="#050f2c", frameRate="60", width="800", height="480")]
	public class TenSeconds extends Sprite
	{
		
		private var scoliosis : Scoliosis;
		
		public function TenSeconds()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
		}

		private function onAdded(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			
			this.scoliosis = new Scoliosis(this.stage, this.startGame);
			scoliosis.currentTransition = new FadeTransition(2);
		}
		
		private function startGame() : void
		{
			this.scoliosis.gotoScreen(new MainMenu());
		}
	}
}
