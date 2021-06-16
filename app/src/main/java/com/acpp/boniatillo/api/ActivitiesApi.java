package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.response.ActivitiesResponse;

import retrofit2.Response;
import retrofit2.http.GET;
import rx.Observable;

public interface ActivitiesApi {

    @GET("activity/?limit=100")
    Observable<Response<ActivitiesResponse>> getActivities();

}
