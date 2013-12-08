package com.pixodrome.tenSeconds.entitys
{
	import ash.core.Entity;

	import nape.phys.Body;

	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Motor;
	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.Tank;
	import com.pixodrome.tenSeconds.components.control.Axis;
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
	public class Rocket extends Entity
	{
		
		[Embed(source="../assets/rocket.png")]
		private var ROCKET_SYMBOL : Class;
		private var bitmap : Bitmap;
		private var view : Image;
		
		function Rocket()
		{
			super();
			
			this.createView();
			
			this.add(new Position());
			this.add(new Rotation());
			this.add(new Scale());
			
			this.createBody();
			
			this.add(new Motor(25));
			this.add(new Axis());
			
			this.add(new Attractable());
			
			var tank : Tank = new Tank(10);
			tank.fill();
			this.add(tank);
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
			this.bitmap = new ROCKET_SYMBOL();
			var texture : Texture = Texture.fromBitmap(bitmap);
			
			view = new Image(texture);
			
			this.add(new View(view));
			
		}
		
	}
}
