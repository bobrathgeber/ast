package {
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	public class asteroid extends MovieClip {
		private var _spin:Number;
		private var _velocity:Number;
		private var _dX:Number;
		private var _dY:Number;
		
		public function asteroid() {
			addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
		}
		
		private function addedToStage(e:Event){
			_spin = (Math.random() *15);
			this.x = (Math.random() * stage.stageWidth);
			this.y = (Math.random() * stage.stageHeight);
			addEventListener(Event.ENTER_FRAME, tic);
			changeVelocity();
		}
		
		public function tic(e:Event) {
			this.rotation += _spin;
			this.x += _dX;
			this.y += _dY;
		}
		
		public function changeVelocity() {
			_dX = (Math.random()*20)-10;
			_dY = (Math.random()*20)-10;
		}
	}
}