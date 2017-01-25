package ktools;

class Random{

	var seed : Float;
	var curSeed : Float;

	inline public function new(seed : Int){
		this.seed = seed;
		this.curSeed = seed;
	}

	public function nextFloat(){
		var x = Math.sin(curSeed++) * 10000;
		return x - Math.floor(x);
	}

	public function inRange(min : Float, max : Float){
		return nextFloat() * (max - min) + min;
	}

	public function reset(){
		this.curSeed = seed;
	}
}