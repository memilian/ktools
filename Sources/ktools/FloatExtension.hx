package ktools;

import kha.FastFloat;

class FloatExtension{

	static var rad2deg = 57.2957795131;
	static var deg2rad = 0.0174532925199;

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

	public static inline function toDegree(f : Float){
		return f * rad2deg;
	}

	public static inline function toRadian(f : Float){
		return f * deg2rad;
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
