package {
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	public class ship extends Entity {

		private var _max_velocity:Number;
		private var _dX:Number;
		private var _dY:Number;
		private var _gunArray:Array = new Array();
		private var _accelMultiplier:Number;

		public function ship() {
			_accelMultiplier = 0.5;
			_max_velocity=8;
			_dX=0;
			_dY=0;
			mountGun(10,0,10);
			mountGun(-10,0,-10);
			mountGun(0,0,0);
		}

		public function mountGun(X:int, Y:int, R:int) {
			var newGun:gun=new gun(this.rotation);
			_gunArray.push(newGun);
			addChild(newGun);
			newGun.rotation = R;
			newGun.x=X;
			newGun.y=Y;
		}


		function turn(degrees:int) {
			this.rotation+=degrees;
			for each (var g:gun in _gunArray) {
				g.ang=this.rotation;
			}
		}

		function moveShip() {
			this.x+=_dX;
			this.y+=_dY;
		}

		function accelerate() {
			var newXAccel:Number=Math.sin(this.rotation*Math.PI/180) * _accelMultiplier;
			var newYAccel:Number=Math.cos(this.rotation*Math.PI/180)*-1 * _accelMultiplier;
			
			if (Math.abs(_dX+newXAccel) < _max_velocity) {
				_dX+=newXAccel;
			}
			if (Math.abs(_dY+newYAccel) < _max_velocity) {
				_dY+=newYAccel;
			}
			//_dX = Math.min(_dX, _max_velocity);
			//_dY = Math.min(_dY, _max_velocity);
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