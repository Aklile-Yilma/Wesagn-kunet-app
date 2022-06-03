


abstract class Repository<I, O>{

	void storeCache(O value);

	Future<O?> getCached(I input);

	Future<O> networkCall(I input);

	Future<O> get(I input, [cached= true, cache=true] ) async{

		O? cached = await getCached(input);

		if(cached != null){

			return cached;
		}

		O value = await networkCall(input);

		if(cache){
			storeCache(value);
		}

		return value;

	}


}