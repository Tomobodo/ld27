package com.pixodrome.tenSeconds.systems
{
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;

	import com.pixodrome.tenSeconds.components.control.Axis;
	import com.pixodrome.tenSeconds.nodes.CameraControlNode;
	import com.pixodrome.tenSeconds.nodes.RocketControlNode;

	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;

	/**
	 * @author Thomas
	 */
	public class KeyBoardControlSystem extends System
	{
		private var keyDown : Dictionary;
		private var rocketControlNode : NodeList;
		private var cameraControlNode : NodeList;
		private var stage : Stage;

		function KeyBoardControlSystem(stage : Stage)
		{
			this.stage = stage;

			this.keyDown = new Dictionary();
		}

		override public function addToEngine(engine : Engine) : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, this.onKeyUp);

			this.rocketControlNode = engine.getNodeList(RocketControlNode);
			this.cameraControlNode = engine.getNodeList(CameraControlNode);
		}

		override public function removeFromEngine(engine : Engine) : void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, this.onKeyUp);
		}

		override public function update(time : Number) : void
		{
			this.updateRocketControl(time);
			this.updateCameraControl(time);
		}

		private function updateCameraControl(time : Number) : void
		{
			for(var node : CameraControlNode = this.cameraControlNode.head; node; node = node.next)
			{
				if(this.keyDown[Keyboard.UP])
					node.camera.zoom += 0.01;
				if(this.keyDown[Keyboard.DOWN])
					node.camera.zoom -= 0.01;
			}
		}

		private function updateRocketControl(time : Number) : void
		{
			for (var node : RocketControlNode = this.rocketControlNode.head; node; node = node.next)
			{
				var motor : Axis = node.axis;

				if (this.keyDown[Keyboard.E])
				{
					if (motor.yAxis > -1)
						motor.yAxis -= 0.5;
					if (motor.yAxis < -1)
						motor.yAxis = -1;
				}
				else if (this.keyDown[Keyboard.D])
				{
					if (motor.yAxis < 1)
						motor.yAxis += 0.5;
					if (motor.yAxis > 1)
						motor.yAxis = 1;
				}
				else
				{
					if (motor.yAxis > 0.5)
						motor.yAxis -= 0.5;
					else if (motor.yAxis < -0.5)
						motor.yAxis += 0.5;
					else
						motor.yAxis = 0;
				}

				if (this.keyDown[Keyboard.S])
				{
					if (motor.xAxis > -1)
						motor.xAxis -= 0.5;
					if (motor.xAxis < -1)
						motor.xAxis = -1;
				}
				else if (this.keyDown[Keyboard.F])
				{
					if (motor.xAxis < 1)
						motor.xAxis += 0.5;
					if (motor.xAxis > 1)
						motor.xAxis = 1;
				}
				else
				{
					if (motor.xAxis > 0.5)
						motor.xAxis -= 0.5;
					else if (motor.xAxis < -0.5)
						motor.xAxis += 0.5;
					else
						motor.xAxis = 0;
				}
			}
		}

		private function onKeyUp(event : KeyboardEvent) : void
		{
			delete this.keyDown[event.keyCode];
		}

		private function onKeyDown(event : KeyboardEvent) : void
		{
			this.keyDown[event.keyCode] = true;
		}
	}
}
