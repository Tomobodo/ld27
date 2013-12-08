package com.pixodrome.tenSeconds.screens
{
	import starling.text.TextField;

	import com.pixodrome.scoliosis.gui.TextButton;
	import com.pixodrome.scoliosis.screen.Screen;
	import com.pixodrome.tenSeconds.screens.levelSelect.LevelSelection;
	/**
	 * @author Thomas
	 */
	public class Pause extends Screen
	{
		private var resumeBTN : TextButton;
		private var backSelection : TextButton;
		
		function Pause()
		{
			var pauseTXT : TextField = new TextField(200, 200, "Pause", "Arial", 32, 0xffffff,true);
			pauseTXT.x = (scoliosis.width - pauseTXT.width) / 2;
			pauseTXT.y = 100;
			
			addChild(pauseTXT);
			
			resumeBTN = new TextButton("Resume", "Arial", 0xffffff, 24);
			
			addChild(resumeBTN);
			
			resumeBTN.x = (scoliosis.width - resumeBTN.width) / 2;
			resumeBTN.y = 230;
			
			backSelection = new TextButton("Back to level selection.", "Arial", 0xffffff, 24);
			
			addChild(resumeBTN);
			
			backSelection.x = (scoliosis.width - backSelection.width) / 2;
			backSelection.y = 260;
			
			addChild(backSelection);
		}

		private function resumeTrigger() : void
		{
			this.scoliosis.popScreen();
		}
		
		
		override public function addListeners() : void
		{
			resumeBTN.TRIGGERED.add(resumeTrigger);
			backSelection.TRIGGERED.add(backSelectionTrigger);
		}

		private function backSelectionTrigger() : void
		{
			this.scoliosis.gotoScreen(new LevelSelection(0), true);
		}
		
		
		override public function removeListeners() : void
		{
			resumeBTN.TRIGGERED.remove(resumeTrigger);
			backSelection.TRIGGERED.remove(backSelectionTrigger);
		}
		
	}
}
