package ktools;

import kha.FastFloat;

class FloatExtension{

	public static function clamp(val : Float, min : Float, max : Float){
		return val > max ? max : val < min ? min : val;
	}

	public static function wrap(val : Float, min : Float, max : Float){
		return (val-min) % (max-min) + min;
	}

	public static inline function precision(f : Float, precision : Int){
		var r = Math.pow(10, precision);
		return Math.fround(f * r) / r;
	}
}


class FastFloatExtension{

	public static function clamp(val : FastFloat, min : Float, max : Float){
		return val > max ? max : val < min ? min : val;
	}

	public static function wrap(val : FastFloat, min : Float, max : Float){
		return (val-min) % (max-min) + min;
	}

	public static inline function precision(f : FastFloat, precision : Int){
		var r = Math.pow(10, precision);
		return Math.fround(f * r) / r;
	}
}
