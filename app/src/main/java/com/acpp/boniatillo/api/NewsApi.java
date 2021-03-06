package com.acpp.boniatillo.api;


import com.acpp.boniatillo.api.response.NewsResponse;
import com.acpp.boniatillo.model.News;

import retrofit2.Response;
import retrofit2.http.GET;
import retrofit2.http.Path;
import rx.Observable;

public interface NewsApi {

    @GET("news/?limit=100")
    Observable<Response<NewsResponse>> getNews();

    @GET("news/{id}")
    Observable<Response<News>> getNewsById(@Path("id") String id);

}
