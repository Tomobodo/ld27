package com.pixodrome.tenSeconds.entitys
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * @author Thomas
	 */
	public class Star extends Sprite
	{
		
		private static var texture : Texture;
		
		public var paralaxCoef : Number;
		
		public var posX : Number;
		public var posY : Number; 
		
		[Embed(source="../assets/star.png")]
		private var SYMBOL_Star : Class;
		
		function Star()
		{
			if(!texture)
				texture = Texture.fromBitmap(new SYMBOL_Star());
			
			var img : Image = new Image(texture);
			this.addChild(img);
			img.pivotX = img.width / 2;
			img.pivotY = img.height / 2;
			
		}
		
	}
}
