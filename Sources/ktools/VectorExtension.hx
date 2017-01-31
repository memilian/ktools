package ktools;

import kha.math.Vector3;
import kha.math.Vector4;
import kha.math.Quaternion;
import kha.math.FastVector3;
import kha.math.FastVector4;
import kha.math.FastMatrix4;

using ktools.FloatExtension.FastFloatExtension;

class VectorExtension{

	public static inline function axisX(c : Class<FastVector3>){
		return new FastVector3(1,0,0);
	}

	public static inline function axisNX(c : Class<FastVector3>){
		return new FastVector3(-1,0,0);
	}

	public static inline function axisY(c : Class<FastVector3>){
		return new FastVector3(0,1,0);
	}

	public static inline function axisNY(c : Class<FastVector3>){
		return new FastVector3(0,-1,0);
	}

	public static inline function axisZ(c : Class<FastVector3>){
		return new FastVector3(0,0,1);
	}

	public static inline function axisNZ(c : Class<FastVector3>){
		return new FastVector3(0,0,-1);
	}

	public static function rotateX(v : FastVector3, angle : Float){
		var v4 = toFast4(v);
		var mat = FastMatrix4.rotationX(angle);
		v4 = mat.multvec(v4);
		return new FastVector3(v4.x, v4.y, v4.z);
	}

	public static function rotateY(v : FastVector3, angle : Float){
		var v4 = toFast4(v);
		var mat = FastMatrix4.rotationY(angle);
		v4 = mat.multvec(v4);
		return new FastVector3(v4.x, v4.y, v4.z);
	}

	public static function rotateZ(v : FastVector3, angle : Float){
		return toFast3(FastMatrix4.rotationZ(angle).multvec(toFast4(v, 1.0)));
	}

	public static inline function toArray(v : FastVector3){
		return [v.x, v.y, v.z];
	} 

	public static inline function angleTo(a : FastVector3, b : FastVector3){
		// a.normalize();
		// b.normalize();
		return Math.acos(a.dot(b) / (a.length*b.length));
	}

	public static inline function copy(a : FastVector3){
		return a.mult(1);
	}

	public static inline function rotateAround(vector : FastVector3, axis : FastVector3, angle : Float){
		axis.normalize();
		var rot = Quaternion.fromAxisAngle(new Vector3(axis.x, axis.y, axis.z), angle);
        var rotated = rot.matrix().multvec(new Vector4(vector.x, vector.y, vector.z, 1));
		return new FastVector3(rotated.x, rotated.y, rotated.z);
	}

	public static inline function toFast4(vector : FastVector3, w = 1.0){
		return new FastVector4(vector.x, vector.y, vector.z, w);
	}

	public static inline function toFast3(vector : FastVector4){
		return new FastVector3(vector.x, vector.y, vector.z);
	}

	public static inline function transform(vector : FastVector3, mat : FastMatrix4){
		return toFast3(mat.multvec(toFast4(vector)));
	}

	public static inline function lengthSquared(vector : FastVector3){
		return vector.x * vector.x + vector.y * vector.y + vector.z * vector.z;
	}

	public static inline function precision(vector : FastVector3, val : Int){
		return new FastVector3(vector.x.precision(val), vector.y.precision(val), vector.z.precision(val));
	}
}
