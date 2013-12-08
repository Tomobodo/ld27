package com.pixodrome.tenSeconds
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Thomas BAUDON
	 */
	public class Preloader extends MovieClip 
	{
		private var progressBar : Shape;
		private var barBackground : Shape;
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO show loader
			barBackground = new Shape();
			barBackground.graphics.beginFill(0xffffff);
			barBackground.graphics.drawRect(0, 220, 800, 40);
			barBackground.graphics.endFill();
			addChild(barBackground);
			
			progressBar = new Shape();
			progressBar.graphics.beginFill(0x000000);
			progressBar.graphics.drawRect(2, 222, 796, 36);
			progressBar.graphics.endFill();
			addChild(progressBar);
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			// TODO update loader
			var percent : Number = e.bytesLoaded / e.bytesTotal;
			progressBar.scaleX = percent;
		}
		
		private function checkFrame(e:Event):void 
		{
			if (currentFrame == totalFrames) 
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void 
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO hide loader
			
			this.removeChild(progressBar);
			this.removeChild(barBackground);
			
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("com.pixodrome.tenSeconds.TenSeconds") as Class;
			addChild(new mainClass() as DisplayObject);
		}
		
	}
	
}