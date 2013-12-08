package com.pixodrome.tenSeconds.entitys.instructions
{
	import ash.core.Entity;

	import nape.phys.Body;

	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Objective;
	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;
	import com.pixodrome.utils.physics.nape.BitmapDataIso;
	import com.pixodrome.utils.physics.nape.IsoBody;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class Cross extends Entity
	{
		
		[Embed(source="../../assets/cross.png")]
		private var cross_SYMBOL : Class;
		private var bitmap : Bitmap;
		private var view : Image;
		
		function Cross(x : Number, y : Number)
		{
			super();
			
			this.createView();
			
			this.add(new Position(x,y));
			this.add(new Rotation());
			this.add(new Scale());
			this.add(new Objective(false));
			
			this.createBody();
		}

		private function createBody() : void
		{
			var bitmapIso : BitmapDataIso = new BitmapDataIso(bitmap.bitmapData);
			var body : Body = IsoBody.run(bitmapIso, bitmapIso.bounds);
			
			var rBody : RigidBody = new RigidBody(body);
			this.add(rBody);
			
			this.view.pivotX = -body.userData['graphicOffset'].x;
			this.view.pivotY = -body.userData['graphicOffset'].y;
			
			body.userData["type"] = "rocket";
		}

		private function createView() : void
		{
			this.bitmap = new cross_SYMBOL();
			var texture : Texture = Texture.fromBitmap(bitmap);
			
			view = new Image(texture);
			
			this.add(new View(view));
			
		}
		
	}
}
