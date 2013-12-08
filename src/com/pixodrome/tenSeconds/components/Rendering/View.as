package com.pixodrome.tenSeconds.components.Rendering
{
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 * @author Thomas
	 */
	public class View
	{
		public var display : Sprite;
		public var views : Vector.<DisplayObject>;
		public var currentView : DisplayObject;
		public var currentViewId : uint;

		function View(view : DisplayObject)
		{
			this.display = new Sprite();

			this.views = new Vector.<DisplayObject>();

			this.addView(view);

			this.setView(0);
		}

		public function addView(view : DisplayObject) : void
		{
			this.views.push(view);
		}

		public function setView(id : uint) : void
		{
			if (id <= this.views.length - 1 && id >= 0)
			{
				this.currentViewId = id;

				if (this.currentView)
					this.display.removeChild(this.currentView);

				this.currentView = this.views[id];

				this.display.addChild(this.currentView);
			}
		}
		
		public function next() : void
		{
			this.setView(this.currentViewId +1);
		}
		
		public function previous() : void
		{
			this.setView(this.currentViewId -1);
		}
	}
}
