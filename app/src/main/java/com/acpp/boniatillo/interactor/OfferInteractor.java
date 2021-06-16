package com.acpp.boniatillo.interactor;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.OffersApi;
import com.acpp.boniatillo.api.response.ApiError;
import com.acpp.boniatillo.api.response.OffersResponse;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Offer;
import com.acpp.boniatillo.util.Util;

import retrofit2.Response;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by julio on 14/02/16.
 */
public class OfferInteractor extends BaseInteractor {
    

    public OfferInteractor(Context context, BaseView baseView) {
        this.baseView = baseView;
        this.context = context;

    }


    public void getOffers(final BaseApiGETListCallback<Offer> callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getOffers()
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread())
//                .doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<OffersResponse>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        baseView.setRefreshing(false);
                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<OffersResponse> response) {


                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body().getOffers());


                    }
                });


    }


    private OffersApi getApi() {
        return getApi(OffersApi.class);
    }


}
