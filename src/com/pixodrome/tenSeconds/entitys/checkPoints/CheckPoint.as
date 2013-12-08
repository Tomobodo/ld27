package com.pixodrome.tenSeconds.entitys.checkPoints
{
	import ash.core.Entity;

	import nape.phys.Body;

	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Objective;
	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.physics.Attractable;
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
	public class CheckPoint extends Entity
	{
		
		[Embed(source="../../assets/notCheckedPoint.png")]
		private var CHECKPOINT_SYMBOL : Class;
		
		private static var texture_normal : Texture;
		
		[Embed(source="../../assets/checkPoint.png")]
		private var CHECKPOINT_2_SYMBOL : Class;
		
		private static var texture_checked : Texture;
		
		private var bitmap : Bitmap;
		
		private var view : View;
		
		function CheckPoint()
		{
			this.createView();
			
			this.add(new Position());
			this.add(new Rotation());
			this.add(new Scale());
			this.add(new Objective(true));
			
			this.createBody();
			
			this.add(new Attractable());
		}
		
		private function createBody() : void
		{
			var bitmapIso : BitmapDataIso = new BitmapDataIso(bitmap.bitmapData);
			var body : Body = IsoBody.run(bitmapIso, bitmapIso.bounds);
			
			var rBody : RigidBody = new RigidBody(body);
			this.add(rBody);
			
			this.view.display.pivotX = -body.userData['graphicOffset'].x;
			this.view.display.pivotY = -body.userData['graphicOffset'].y;
		}

		private function createView() : void
		{
			this.bitmap = new CHECKPOINT_SYMBOL();
			
			var bitmap2 : Bitmap = new CHECKPOINT_2_SYMBOL();
			
			if(!texture_normal)
				texture_normal = Texture.fromBitmap(bitmap);
				
			if(!texture_checked)
				texture_checked = Texture.fromBitmap(bitmap2);
				
			var imageA : Image = new Image(texture_normal);
			var imageB : Image = new Image(texture_checked);
			
			this.view = new View(imageA);
			this.view.addView(imageB);
			
			this.add(this.view);
		}
		
	}
}
