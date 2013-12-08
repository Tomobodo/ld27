package com.pixodrome.tenSeconds.entitys.instructions
{
	import ash.core.Entity;

	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class InstC extends Entity
	{
		
		private var view : DisplayObject;
		
		private static var texture : Texture;
		
		[Embed(source="../../assets/inst3.png")]
		private var SYMBOL_INSTRUCTION : Class;
		
		function InstC()
		{
			super();
			
			this.drawView();
			
			this.add(new View(this.view));
			this.add(new Scale());
			this.add(new Rotation());
			this.add(new Position(50,-200));
		}


		private function drawView() : void
		{
			if(!texture)
			{
				var bitmap : Bitmap = new SYMBOL_INSTRUCTION();
				texture = Texture.fromBitmap(bitmap);
			}
			
			var img : Image = new Image(texture);
			
			img.pivotX = img.width / 2;
			img.pivotY = img.height / 2;
			
			this.view = img;
		}
		
	}
}
