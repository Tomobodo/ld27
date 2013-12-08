package com.pixodrome.tenSeconds.screens
{
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;

	import com.pixodrome.scoliosis.screen.Screen;
	import com.pixodrome.tenSeconds.levels.LevelList;
	import com.pixodrome.tenSeconds.screens.levelSelect.LevelSelection;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class InterLevel extends Screen
	{
		
		private var lastLevel : uint;
		
		private static var texture : Texture;
		
		[Embed(source="../assets/interlevel.jpg")]
		private var IMG : Class;
		
		public function InterLevel(levelId : uint) : void
		{
			if(!texture)
			{
				var bitmap : Bitmap = new IMG();
				texture = Texture.fromBitmap(bitmap);
			}
			
			var img : Image = new Image(texture);
			this.addChild(img);
			
			this.lastLevel = levelId;
			var text : TextField = new TextField(300, 200, "Level " + (levelId + 1) + " completed!", "Arial", 32, 0xffffff);
			this.addChild(text);
			
			text.y = 100;
			text.x = (scoliosis.width - text.width) / 2;
		}

		override public function addListeners() : void
		{
			this.stage.addEventListener(TouchEvent.TOUCH, this.onTouch);
		}
		
		override public function removeListeners() : void
		{
			this.stage.removeEventListener(TouchEvent.TOUCH, this.onTouch);
		}

		private function onTouch(event : TouchEvent) : void
		{
			if(event.getTouch(stage) && event.getTouch(stage).phase == TouchPhase.ENDED)
			{
				var gotoNext : Boolean = lastLevel < LevelList.LIST.length - 1;
				
				if(gotoNext)
				{	
					var idLevel : uint = this.lastLevel + 1;
					var levelClass : Class = LevelList.LIST[idLevel];
					scoliosis.gotoScreen(new GameScreen(levelClass, idLevel), true);
				}
				else
				{
					scoliosis.gotoScreen(new LevelSelection(this.lastLevel));
				}
			}
		}

	}
}
