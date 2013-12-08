package com.pixodrome.tenSeconds.screens.levelSelect
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;

	import org.osflash.signals.Signal;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class LevelBTN extends Sprite
	{
		public const TRGGERED : Signal = new Signal();
		
		public var idLevel : uint;
		
		[Embed(source="../../assets/levelBTN.png")]
		private var SYMBOL_BTN : Class;
		
		private static var texture : Texture;
		
		function LevelBTN(idLevel : uint)
		{
			this.idLevel = idLevel;
			
			this.addEventListener(TouchEvent.TOUCH, onTouched);	
			
			if(!texture)
			{
				var bmp : Bitmap = new SYMBOL_BTN();
				texture = Texture.fromBitmap(bmp);
			}
			
			var img : Image = new Image(texture);
			this.addChild(img);
			
			var txt : TextField = new TextField(50, 50, "" + (idLevel + 1),"Arial", 24, 0xffffff, true);
			txt.x = (this.width - txt.width ) / 2;
			txt.y = (this.height - txt.height) / 2 - 5;
			
			this.addChild(txt);
			
			this.useHandCursor = true;
		}

		private function onTouched(event : TouchEvent) : void
		{
			var touch : Touch = event.getTouch(this);
			if(touch && touch.phase == TouchPhase.ENDED)
				this.TRGGERED.dispatch(this.idLevel);
		}
		
		
	}
}
