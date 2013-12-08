package com.pixodrome.tenSeconds.screens
{
	import starling.display.Image;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	import com.pixodrome.scoliosis.gui.TextButton;
	import com.pixodrome.scoliosis.screen.Screen;
	import com.pixodrome.tenSeconds.screens.levelSelect.LevelSelection;

	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	/**
	 * @author Thomas
	 */
	 
	public class MainMenu extends Screen
	{
		
		private var playBTN : TextButton;
		
		[Embed(source="../assets/title.jpg")]
		private var SYMBOL_TILE: Class;
		
		[Embed(source="../assets/Avatar.png")]
		private var SYMBOLE_AVATAR : Class;
		private var imgAv : Image;
		
		[Embed(source="../assets/Decisions.mp3")]
		private var SYMBOL_MUSIC : Class;
		
		public function MainMenu()
		{
			this.playBTN = new TextButton("Play !", "Arial", 0xffffff, 46);
			
			var bmp : Bitmap = new SYMBOL_TILE();
			var tex : Texture = Texture.fromBitmap(bmp);
			
			var img : Image = new Image(tex);
			this.addChild(img);
			
			var avatar : Bitmap = new SYMBOLE_AVATAR();
			var texture : Texture = Texture.fromBitmap(avatar);
			
			imgAv = new Image(texture);
			
			imgAv.x = 0;
			imgAv.y = 480 - imgAv.height;
			imgAv.useHandCursor = true;
			imgAv.addEventListener(TouchEvent.TOUCH, onAvTouch);
			
			var music : Sound = new SYMBOL_MUSIC();
			music.play(0,1000);
			
			addChild(imgAv);
		}

		private function onAvTouch(event : TouchEvent) : void
		{
			if(event.getTouch(imgAv) && event.getTouch(imgAv).phase == TouchPhase.ENDED)
			{
				var targetURL:URLRequest = new URLRequest("https://twitter.com/pixodrome");
   				navigateToURL(targetURL);
			}
		}
		
		override public function draw() : void
		{
			this.addChild(this.playBTN);
			this.playBTN.x = (this.scoliosis.width - this.playBTN.width) / 2;
			this.playBTN.y = 350;
		}
		
		override public function addListeners() : void
		{
			this.playBTN.TRIGGERED.add(this.gotoLevelSelection);
		}
		
		override public function removeListeners() : void
		{
			this.playBTN.TRIGGERED.remove(this.gotoLevelSelection);
		}

		private function gotoLevelSelection() : void
		{
			this.scoliosis.gotoScreen(new LevelSelection(0));
		}
		
		
			
		
	}
}
