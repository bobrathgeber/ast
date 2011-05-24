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
		private var _max_missiles:int;
		private var _missile_count:int;

		function gun(angle:Number) {
			_missile_count = 0;
			_max_missiles = 6;
			_speed=5;
			_interval=300;
			ang=angle;
		}

		function fire() {
			if (! _cooldown && (_missile_count < _max_missiles)) {
				var newMissile:missile=new missile(new PolarVector(ang,_speed), this);
				var abs:Point=parent.localToGlobal(new Point(this.x,this.y));
				newMissile.x=abs.x;
				newMissile.y=abs.y;

				stage.addChild(newMissile);
				_missile_count ++;
				startCooldown();
			}
		}
		
		function rotateGun(i:int){
			this.rotation = i;
		}
		
		function reduceMissileCount(){
			_missile_count--;
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