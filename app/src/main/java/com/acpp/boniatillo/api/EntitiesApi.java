package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.response.EntitiesResponse;
import com.acpp.boniatillo.model.Entity;

import retrofit2.Response;
import retrofit2.http.GET;
import retrofit2.http.Path;
import retrofit2.http.Query;
import rx.Observable;

public interface EntitiesApi {

    @GET("entities/?limit=100")
    Observable<Response<EntitiesResponse>> getEntities();

    @GET("entities/?limit=100")
    Observable<Response<EntitiesResponse>> getEntitiesFiltered(@Query("q") String query);

    @GET("entities/{id}")
    Observable<Response<Entity>> getEntityById(@Path("id") String id);

}
