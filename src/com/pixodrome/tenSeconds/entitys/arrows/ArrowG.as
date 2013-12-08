package com.pixodrome.tenSeconds.entitys.arrows
{
	import ash.core.Entity;

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
	public class ArrowG extends Entity
	{
		
		private static var texture : Texture;
		
		[Embed(source="../../assets/arrowv.png")]
		private var SYMBOL_ARROW : Class;
		
		function ArrowG()
		{
			super();
			
			this.createView();
			this.add(new Position());
			this.add(new Scale());
			this.add(new Rotation());
		}

		private function createView() : void
		{
			if(!texture)
			{
				var bitmap : Bitmap = new SYMBOL_ARROW();
				texture = Texture.fromBitmap(bitmap);
			}
			
			var img : Image = new Image(texture);
			img.pivotX = - img.width * 2;
			img.pivotY = img.height / 2;
			
			this.add(new View(img));
		}
		
	}
}
