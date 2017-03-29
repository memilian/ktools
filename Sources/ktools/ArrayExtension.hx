package ktools;

class ArrayExtension{

	public static function insertAll<T>(arr : Array<T>, toAdd : Array<T>, index : Int){
		for(i in 0...toAdd.length){
			arr.insert(index++, toAdd[i]);
		}
	}

	public static inline function pushAll<T>(arr : Array<T>, toAdd : Array<T>){
		for(i in 0...toAdd.length){
			arr.push(toAdd[i]);
		}
	}

	public static function replaceAll<T>(arr : Array<T>, toAdd : Array<T>, index : Int){
		for(i in 0...toAdd.length){
			arr[index+i] = toAdd[i];
		}
	}

	public static function filteri<T>( arr : Array<T>, f : Int->T-> Bool ) {
		var res = new Array<T>();
		for(i in 0...arr.length)
			if( f(i, arr[i]) )
				res.push(arr[i]);
		return res;
	}

	public static function first<T>(arr : Array<T>, f : T->Bool) : T {
		for(i in arr){
			if(f(i)) return i;
		}
		return null;
	}

	public static function all<T>(arr : Array<T>, f : T->Bool) : Bool {
		for(i in arr){
			if(!f(i)) return false;
		}
		return true;
	}

	public static inline function lastElement<T>(arr : Array<T>) : T {
		if(arr.length == 0) return null;
		return arr[arr.length-1];
	}
}
