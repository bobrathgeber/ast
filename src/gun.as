package {
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class gun extends Entity {
		private var _interval:Number;
		private var _speed:Number;
		private var _cooldown:Boolean;
		//movement pattern
		public var ang:Number;

		function gun(angle:Number) {
			_speed=10;
			_interval=400;
			ang=angle;
		}

		function fire() {
			if (! _cooldown) {
				var newMissile:missile=new missile(new VelocityVector(ang,_speed));
				var abs:Point=parent.localToGlobal(new Point(this.x,this.y));
				newMissile.x=abs.x;
				newMissile.y=abs.y;

				stage.addChild(newMissile);
				startCooldown();
			}
		}

		function startCooldown() {
			_cooldown=true;
			trace("cooldown started");

			var thisTimer:Timer=new Timer(_interval,1);
			thisTimer.start();
			thisTimer.addEventListener(TimerEvent.TIMER, cooldownComplete);

			function cooldownComplete(e:Event) {
				removeEventListener(TimerEvent.TIMER, cooldownComplete);
				_cooldown=false;
			}
		}

	}
}