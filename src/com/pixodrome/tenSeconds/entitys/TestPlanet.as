package com.pixodrome.tenSeconds.entitys
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
	import com.pixodrome.tenSeconds.components.transform.Position;
	import com.pixodrome.tenSeconds.components.transform.Rotation;
	import com.pixodrome.tenSeconds.components.transform.Scale;

	import flash.display.BitmapData;
	import flash.display.Shape;
	/**
	 * @author Thomas
	 */
	public class TestPlanet extends Entity
	{
		
		private var view : DisplayObject;
		private var body : RigidBody;
		
		function TestPlanet()
		{
			super();
			
			this.drawView();
			this.createBody();
			
			this.add(new View(this.view));
			this.add(this.body);
			this.add(new Position(Math.random() *20000-10000, Math.random() *20000-10000));
			this.add(new Scale());
			this.add(new Rotation());
			this.add(new Attractor(1e7));
		}

		private function createBody() : void
		{
			var body : Body = new Body(BodyType.STATIC);
			body.shapes.add(new Circle(20));
			var rbody : RigidBody = new RigidBody(body);
			this.body = rbody;
		}

		private function drawView() : void
		{
			var circle : Shape = new Shape();
			circle.graphics.beginFill(0xccccff);
			circle.graphics.drawCircle(20, 20, 20);
			circle.graphics.endFill();
			circle.graphics.lineStyle(2,0);
			circle.graphics.moveTo(20, 20);
			circle.graphics.lineTo(40, 20);
			
			var bitmapData : BitmapData = new BitmapData(40, 40, true, 0);
			bitmapData.draw(circle);
			
			var texture : Texture = Texture.fromBitmapData(bitmapData);
			
			var img : Image = new Image(texture);
			img.pivotX = 20;
			img.pivotY = 20;
			
			this.view = img;
		}
		
	}
}
