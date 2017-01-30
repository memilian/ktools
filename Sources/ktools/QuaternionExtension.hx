package ktools;

import kha.math.Quaternion;

class QuaternionExtension{
	inline public static function angle(q : Quaternion){
		return Math.acos(q.w) * 2;
	}
}