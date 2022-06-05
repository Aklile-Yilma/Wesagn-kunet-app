


import 'dart:developer';

abstract class RepositoryCall<I, O>{

	void storeCache(O value);

	Future<O?> getCached(I input);

	Future<O> networkCall(I input);

	Future<O> get(I input, [cached= true, cache=true] ) async{

		O? cached = await getCached(input);

		if(cached != null){
      log("Returing Cached Value");
			return cached;
		}

    log("Not Found in Cache");
		O value = await networkCall(input);

		if(cache){
      log("Storing to Cache");
			storeCache(value);
		}

    log("Returning Network Value");
		return value;

	}


}