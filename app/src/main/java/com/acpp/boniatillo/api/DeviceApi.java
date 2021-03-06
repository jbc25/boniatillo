package com.acpp.boniatillo.api;

import com.acpp.boniatillo.model.Device;

import rx.Observable;

import retrofit2.Response;
import retrofit2.http.Body;
import retrofit2.http.PUT;

/**
 * Created by julio on 1/02/18.
 */

public interface DeviceApi {

    @PUT("device/")
    Observable<Response<Void>> sendDevice(@Body Device device);


}
