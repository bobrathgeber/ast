package{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class missile extends Entity {
		private var _v:PolarVector;
		private var _damage:Number;
		private var _distanceTraveled:Number;
		private var _maxDistance:Number;
		//movement pattern
		private var _gun:gun;
		
		function missile(v:PolarVector, thisGun:gun) {
			_gun = thisGun;
			_distanceTraveled = 0;
			_maxDistance = 15;
			addEventListener(Event.ENTER_FRAME, tic);
			_v = v;
		}
		 
		function tic(e:Event){
			//trace("missleX:" + _dX);
			_distanceTraveled += Time.deltaTime * _v.k;

			//trace(distance + " " + _maxDistance);
			if (_distanceTraveled >= _maxDistance) {
				stage.removeChild(this);
				_gun.reduceMissileCount();
				removeEventListener(Event.ENTER_FRAME, tic);
			}
			x+=_v.x;
			y+=_v.y;
		}
	}
}