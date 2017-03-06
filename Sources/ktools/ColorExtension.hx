package ktools;

import kha.Color;
import kha.math.FastVector4;

class ColorExtension{

	inline public static function toVec4(col : Color){
		return new FastVector4(col.R, col.G, col.B, col.A);
	}


}