﻿package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;

	public class ast extends MovieClip {
		private var _level:level = new level();
		private var _ship:ship = new ship();
		private var UpArrow:Boolean=false;
		private var DownArrow:Boolean=false;
		private var LeftArrow:Boolean=false;
		private var RightArrow:Boolean=false;
		private var SpaceBar:Boolean=false;
		private var _stageWidth:int=stage.stageWidth;
		private var _stageHeight:int=stage.stageHeight;
		//public var _stage:Stage;

		public function ast() {
			addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
		}
		
		public function addedToStage(e:Event) {
			startGame();
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function startGame(){
			var newAsteroid:asteroid = new asteroid();
			var newAsteroid1:asteroid = new asteroid();
			var newAsteroid2:asteroid = new asteroid();
			
			stage.addChild(newAsteroid);
			stage.addChild(newAsteroid1);
			stage.addChild(newAsteroid2);
			stage.addChild(_ship);
			shipControl();

			_ship.x=100;
			_ship.y=100;
		}
		function handleKeyPress(event:KeyboardEvent) {

			if (event.keyCode==37||event.keyCode==65) {
				LeftArrow=true;

			} else if (event.keyCode == 39 || event.keyCode==68) {
				RightArrow=true;

			} else if (event.keyCode == 38 || event.keyCode==87) {
				UpArrow=true;

			} else if (event.keyCode == 40 || event.keyCode==83) {
				DownArrow=true;
			} else if (event.keyCode == 32) {
				SpaceBar=true;
			}
		}


		function handleKeyRelease(event:KeyboardEvent) {

			if (event.keyCode==37||event.keyCode==65) {
				LeftArrow=false;

			} else if (event.keyCode == 39 || event.keyCode==68) {
				RightArrow=false;

			} else if (event.keyCode == 38 || event.keyCode==87) {
				UpArrow=false;

			} else if (event.keyCode == 40 || event.keyCode==83) {
				DownArrow=false;

			} else if (event.keyCode == 32) {
				SpaceBar=false;
			}
		}

		public function tic(e:Event) {
			//Rotate Ship
			if (LeftArrow) {
				_ship.turn(-7);
			}
			if (RightArrow) {
				_ship.turn(7);
			}
			if (UpArrow) {
				_ship.accelerate();
			}
			if (DownArrow) {
				_ship.stopShip();
			}
			if (SpaceBar) {
				_ship.fireMissile();
			}

			_ship.tic();
			wrap();
		}

		function wrap() {
			for (var i:int = 0; i < stage.numChildren; i++) {
				var c:DisplayObject=stage.getChildAt(i);

				if (c.x<0) {
					c.x=_stageWidth;
				} else if (c.x > _stageWidth) {
					c.x=0;
				}
				if (c.y<0) {
					c.y=_stageHeight;
				} else if (c.y > _stageHeight) {
					c.y=0;
				}
			}
		}

		public function shipControl() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyRelease);
			stage.addEventListener(Event.ENTER_FRAME, tic);
		}
	}
}