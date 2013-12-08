package com.pixodrome.tenSeconds.screens.levelSelect
{
	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.scoliosis.screen.Screen;
	import com.pixodrome.tenSeconds.levels.LevelList;
	import com.pixodrome.tenSeconds.screens.GameScreen;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class LevelSelection extends Screen
	{
		
		private var lastFinishedLevel : uint;
		
		[Embed(source="../../assets/levelSelect.jpg")]
		private var IMG : Class;
		
		private static var texture : Texture;
		
		function LevelSelection(lastFinishedLevel : uint)
		{
			this.lastFinishedLevel = lastFinishedLevel;
			
			if(!texture)
			{
				var bmp : Bitmap = new IMG();
				texture = Texture.fromBitmap(bmp);
			}
			
			var img : Image = new Image(texture);
			this.addChild(img);
			
			for(var i : uint = 0; i < LevelList.LIST.length; ++i)
			{
				var btn : LevelBTN = new LevelBTN(i);
				btn.TRGGERED.add(this.onLevelSelect);
				btn.x = (i % 10) * (btn.width + 10);
				btn.y = uint(i / 10) * (btn.height + 10) + 20;
				this.addChild(btn);
				
				btn.x += (scoliosis.width - (btn.width + 10) * 10) / 2;
			}
		}
		
		private function onLevelSelect(idLevel : uint) : void
		{
			var level : Class = LevelList.LIST[idLevel];
			this.scoliosis.gotoScreen(new GameScreen(level, idLevel));
		}
		
	}
}
