package{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class missile extends Entity {
		private var _v:VelocityVector;
		private var _damage:Number;
		private var _distanceTraveled:Number;
		private var _maxDistance:Number;
		//movement pattern
		private var _dX:Number;
		private var _dY:Number;
		
		function missile(v:VelocityVector) {
			_distanceTraveled = 0;
			_maxDistance = 15;
			addEventListener(Event.ENTER_FRAME, tic);
			_v = v;
			_dX=Math.sin(v.ang*Math.PI/180)*v.mag;
			_dY=Math.cos(v.ang*Math.PI/180)*v.mag*-1;
		}
		 
		function tic(e:Event){
			//trace("missleX:" + _dX);
			_distanceTraveled += Time.deltaTime * _v.mag;

			//trace(distance + " " + _maxDistance);
			if (_distanceTraveled >= _maxDistance) {
				stage.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, tic);
			}
			x+=_dX;
			y+=_dY;
		}
	}
}