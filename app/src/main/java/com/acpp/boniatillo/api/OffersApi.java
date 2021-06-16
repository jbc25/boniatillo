package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.response.OffersResponse;

import retrofit2.Response;
import retrofit2.http.GET;
import rx.Observable;

public interface OffersApi {

    @GET("offers/?limit=100")
    Observable<Response<OffersResponse>> getOffers();

}
