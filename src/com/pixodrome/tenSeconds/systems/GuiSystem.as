package com.pixodrome.tenSeconds.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;

	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;

	import com.pixodrome.tenSeconds.components.Tank;
	import com.pixodrome.tenSeconds.nodes.PlayerNode;

	import flash.display.Bitmap;
	/**
	 * @author Thomas
	 */
	public class GuiSystem extends System
	{
		
		private var container : DisplayObjectContainer;
		private var players : NodeList;
		
		private var fuelBarBackground : Quad;
		private var fuelBar : Quad;
		
		private var rotationIndicator : Quad;
		
		private var fuelTxt : TextField;
		
		[Embed(source="../assets/cadran.png")]
		private var SYMBOL_CADRAN : Class;
		
		private static var cadranTexture : Texture;
		private var timecdr : Image;
		
		function GuiSystem(container : DisplayObjectContainer)
		{
			this.container = container;
		}
		
		override public function addToEngine(engine : Engine) : void
		{
			this.players = engine.getNodeList(PlayerNode);
			
			this.players.nodeAdded.add(this.onPlayerNodeAdded);
			this.players.nodeAdded.add(this.onPlayerNodeRemoved);
		}

		private function onPlayerNodeRemoved(node : PlayerNode) : void
		{
		}

		private function onPlayerNodeAdded(node : PlayerNode) : void
		{
			this.initRotationIndic(node);
			this.initFuelBars(node);
		}

		private function initRotationIndic(node : PlayerNode) : void
		{
			this.rotationIndicator = new Quad(30, 5, 0xffffff);
			this.container.addChild(this.rotationIndicator);
			this.rotationIndicator.x = 760;
			this.rotationIndicator.y = 410;
			
			if(!GuiSystem.cadranTexture)
			{
				var bmp : Bitmap = new SYMBOL_CADRAN();
				cadranTexture = Texture.fromBitmap(bmp);
			}
			
			var img : Image = new Image(cadranTexture);
			this.container.addChild(img);
			
			img.x = 720;
			img.y = 370;
		}

		private function initFuelBars(node : PlayerNode) : void
		{
			this.fuelBarBackground = new Quad(800, 30, 0x000000);
			this.fuelBarBackground.y = 450;
			this.container.addChild(this.fuelBarBackground);
			
			var text : TextField = new TextField(70, 60, "Fuel", "Arial", 24,0xffffff,true);
			this.container.addChild(text);
			text.y = 435;
			
			this.fuelBar = new Quad(725, 20, 0xffffff);
			this.container.addChild(this.fuelBar);
			this.fuelBar.x = 70;
			this.fuelBar.y = 455;
			
			timecdr = new Image(cadranTexture);
			this.container.addChild(timecdr);
			
			timecdr.y = 370;
			
			this.fuelTxt = new TextField(100, 100, "", "Arial", 24, 0xffffff, true);
			this.container.addChild(this.fuelTxt);
			
			fuelTxt.x = (timecdr.width - fuelTxt.width) / 2;;
			fuelTxt.y = timecdr.y + (timecdr.height - fuelTxt.height) / 2;
		}
		
		override public function update(time : Number) : void
		{
			for(var playerNode : PlayerNode = this.players.head; playerNode; playerNode = playerNode.next)
				this.updateGui(playerNode);
		}

		private function updateGui(playerNode : PlayerNode) : void
		{
			var tank : Tank = playerNode.tank;
			this.fuelBar.scaleX = tank.contains / tank.capacity;
			
			this.rotationIndicator.rotation = playerNode.rotation.angle;
			
			var round : Number = Math.round(tank.contains*10)/10;
			
			fuelTxt.text = "" + round + " s";
		}
		
	}
}
