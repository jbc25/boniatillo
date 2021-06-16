package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.model.ResetPassword;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.api.response.LoginResponse;
import com.acpp.boniatillo.model.AuthLogin;
import com.acpp.boniatillo.model.User;

import retrofit2.Response;
import retrofit2.http.Body;
import retrofit2.http.POST;
import rx.Observable;

public interface AuthApi {

    @POST("login/")
    Observable<Response<LoginResponse>> login(@Body AuthLogin login);

    @POST("register/")
    Observable<Response<Data>> register(@Body User user);

    @POST("reset_password/")
    Observable<Response<Data>> resetPassword(@Body ResetPassword resetPassword);



}
