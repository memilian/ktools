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

	public static inline function copyFrom(v : FastVector3, from : FastVector3){
		v.x = from.x;
		v.y = from.y;
		v.z = from.z;
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
		return Math.atan2(a.y, a.x) - Math.atan2(b.y, b.x); //Math.acos(a.dot(b) / (a.length*b.length));
	}

	public static inline function rotationTo(a : FastVector3, b : FastVector3) : Quaternion{

		var a = copy(a);
		var b = copy(b);
		a.normalize();
		b.normalize();

		var cosTheta = a.dot(b);
		var rotAxis = new FastVector3();

		if(cosTheta < -1 + 0.001){
			// special case when vectors in opposite directions :
			// there is no "ideal" rotation axis
			// So guess one. any will do as long as it's perpendicular to start
			rotAxis = new FastVector3(0,0,1).cross(a);
			if(lengthSquared(rotAxis) < 0.01) { //parallel
				rotAxis = new FastVector3(1, 0, 0).cross(a);
			}
			rotAxis.normalize();
			return Quaternion.fromAxisAngle(toVector3(rotAxis), Math.PI);
		}

		rotAxis = a.cross(b);

		var s = Math.sqrt((1 + cosTheta) * 2);
		var invS = 1 / s;

		return new Quaternion(rotAxis.x * invS, rotAxis.y * invS, rotAxis.z * invS, s * 0.5);
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

	public static inline function toVector3(vector : FastVector3){
		return new Vector3(vector.x, vector.y, vector.z);
	}

	public static inline function toVector4(vector : FastVector3, w = 1.0){
		return new Vector4(vector.x, vector.y, vector.z, w);
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

	public static inline function lerp(start : FastVector3, end : FastVector3, ratio : Float){
		return start.add(end.sub(start).mult(ratio));
	}
}

class Vector4Extension{

	public static inline function toFast3(vector : Vector4){
		return new FastVector3(vector.x, vector.y, vector.z);
	}

	public static inline function toVector3(vector : Vector4){
		return new Vector3(vector.x, vector.y, vector.z);
	}
}
