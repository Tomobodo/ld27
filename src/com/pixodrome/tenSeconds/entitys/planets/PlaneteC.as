package com.pixodrome.tenSeconds.entitys.planets
{
	import ash.core.Entity;

	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Circle;

	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Rendering.View;
	import com.pixodrome.tenSeconds.components.physics.Attractor;
	import com.pixodrome.tenSeconds.components.physics.RigidBody;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class PlaneteC extends Entity
	{
		
		private var view : DisplayObject;
		private var body : RigidBody;
		
		private static var texture : Texture;
		
		[Embed(source="../../assets/planete3.png")]
		private var SYMBOL_PLANET : Class;
		
		function PlaneteC()
		{
			super();
			
			this.drawView();
			this.createBody();
			
			this.add(new View(this.view));
			this.add(this.body);
			this.add(new Scale());
			this.add(new Rotation());
			this.add(new Attractor(5e7));
		}

		private function createBody() : void
		{
			var body : Body = new Body(BodyType.STATIC);
			body.shapes.add(new Circle(this.view.width / 2 - 20));
			var rbody : RigidBody = new RigidBody(body);
			this.body = rbody;
		}

		private function drawView() : void
		{
			if(!texture)
			{
				var bitmap : Bitmap = new SYMBOL_PLANET();
				texture = Texture.fromBitmap(bitmap);
			}
			
			var img : Image = new Image(texture);
			
			img.pivotX = img.width / 2;
			img.pivotY = img.height / 2;
			
			this.view = img;
		}
		
	}
}
