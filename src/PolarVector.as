package{
	public class PolarVector {
		
		// props
		private var _r:Number;
		private var _k:Number;
		private var _x:Number;
		private var _y:Number;
		
		// ctor
		public function PolarVector(r:Number, k:Number) {
			_r = r;
			_k = k;
			
			updateCartesian();
			
		}		
		
		public function get x() {
			return _x;
		}
		
		public function get y() {
			return _y;
		}
		
		public function get k() {
			return _k;
		}
		public function set k(newk:Number) {
			_k = newk;
			
			updateCartesian();
			updatePolar();
		}
		
		public function get r() {
			return _r;
		}
		
		public function add(pv:PolarVector){
			_x += pv.x;
			_y += pv.y;
			
			//updatePolar();
		}
		
		private function updateCartesian(){
			trace(Object(this) + " update cart " + _r);
			_x = Math.sin(_r*Math.PI/180) * _k;
			_y = Math.cos(_r*Math.PI/180) * _k * -1;
		}

		private function updatePolar(){
			_k = Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2));
			_r = Math.atan(_y/_x)*180/Math.PI; 
		}
		
		//public function toCartesian():Vector3D {
		//	var x_comp:Number = Math.sin(_r*Math.PI/180) * _k;
		//	var y_comp:Number = Math.cos(_r*Math.PI/180) * _k * -1;
		//	var c:Vector3D = new Vector3D(x_comp, y_comp, 0, 0)
		//	return c;
		//}
	}
}