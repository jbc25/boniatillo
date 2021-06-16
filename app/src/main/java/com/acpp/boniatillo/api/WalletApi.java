package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.model.Purchase;
import com.acpp.boniatillo.model.Wallet;

import retrofit2.Response;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import rx.Observable;

public interface WalletApi {

    @GET("wallet/")
    Observable<Response<Wallet>> getWallet();

    @POST("wallet/purchase/")
    Observable<Response<Void>> purchaseCurrency(@Body Purchase purchase);

}
