package {
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	public class ship extends Entity {

		private var _max_velocity:Number;
		private var _v:PolarVector;
		private var _gunArray:Array = new Array();
		private var _accelMultiplier:Number;

		public function ship() {
			addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
		}
		
		public function addedToStage(e:Event) {
			makeShip();
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function makeShip(){
			_accelMultiplier = 0.5;
			_max_velocity=8;
			_v = new PolarVector(0,0);
			mountGun(10,0,20);
			mountGun(-10,0,-20);
			mountGun(0,0,0);
			mountGun(0,10,180);
		}

		public function mountGun(X:int, Y:int, R:int) {
			var newGun:gun=new gun(R);
			_gunArray.push(newGun);
			addChild(newGun);
			newGun.rotation = R;
			newGun.x=X;
			newGun.y=Y;
		}


		function turn(degrees:int) {
			this.rotation+=degrees;
			for each (var g:gun in _gunArray) {
				g.ang+=degrees;
			}
		}

		function moveShip() {
			this.x+=_v.x;
			this.y+=_v.y;
			
						trace("**********");
			
			trace("x " + _v.x);
			trace("y " + _v.y);
			trace("r " + _v.r);
			trace("k " + _v.k);
		}
		
		function stopShip() {
			this._v = new PolarVector(0,0);
			trace(Math.atan2(3,4)*180/Math.PI);
			
		}

		function accelerate() {
			var a:PolarVector = new PolarVector(this.rotation, _accelMultiplier);
			var old:PolarVector = _v;
			
			_v.add(a);
			
			if (_v.k > _max_velocity) {
				_v.k = _max_velocity;
			}
		}
		
		function tic():void {
			moveShip();
		}

		function fireMissile() {
			for (var i:int = 0; i< _gunArray.length; i++) {
				_gunArray[i].fire();
				trace("gun fired " + i);
			}
		}


	}
}