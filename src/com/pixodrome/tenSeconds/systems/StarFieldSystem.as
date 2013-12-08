package com.pixodrome.tenSeconds.systems
{
	import ash.tools.ListIteratingSystem;

	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;

	import com.pixodrome.tenSeconds.entitys.Star;
	import com.pixodrome.tenSeconds.nodes.CameraNode;
	/**
	 * @author Thomas
	 */
	public class StarFieldSystem extends ListIteratingSystem
	{
		
		private var stars : Vector.<Star>;
		private var starContainer : Sprite;
		
		function StarFieldSystem(world : DisplayObjectContainer, nbStars : uint = 100)
		{
			super(CameraNode, this.onUpdate, this.onAdded, this.onRemoved);
			
			this.starContainer = new Sprite();
			
			this.stars = new Vector.<Star>();
			
			for (var i : uint = 0; i < nbStars; ++i)
			{
				var newStar : Star = new Star();
				
				newStar.paralaxCoef = (Math.random() * 1000.0) / 1000.0;
				
				newStar.posX = Math.random() * 800 / newStar.paralaxCoef;
				newStar.posY = Math.random() * 480 / newStar.paralaxCoef;
				
				this.stars.push(newStar);
				this.starContainer.addChild(newStar);
			}
			
			world.parent.addChildAt(starContainer,0);
		}

		private function onRemoved(node : CameraNode) : void
		{
		}

		private function onAdded(node : CameraNode) : void
		{
		}

		private function onUpdate(node : CameraNode, time : Number) : void
		{
			updateStarsPos(node);
		}

		private function updateStarsPos(node : CameraNode) : void
		{
			var nbStars : uint = this.stars.length;
			var currentStar : Star;
			for (var i : uint = 0; i < nbStars; ++i)
			{
				currentStar = this.stars[i];
				currentStar.x = (-node.position.x + currentStar.posX) * currentStar.paralaxCoef;
				currentStar.y = (-node.position.y + currentStar.posY) * currentStar.paralaxCoef;

				if (currentStar.x <= 0)
					currentStar.posX += 800 / currentStar.paralaxCoef;
				if (currentStar.x >= 800)
					currentStar.posX -= 800 / currentStar.paralaxCoef;
				if (currentStar.y <= 0)
					currentStar.posY += 480 / currentStar.paralaxCoef;
				if (currentStar.y >= 480)
					currentStar.posY -= 480 / currentStar.paralaxCoef;
			}
		}
		
	}
}
