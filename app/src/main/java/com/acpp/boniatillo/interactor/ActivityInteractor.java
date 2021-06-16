package com.acpp.boniatillo.interactor;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.ActivitiesApi;
import com.acpp.boniatillo.api.response.ActivitiesResponse;
import com.acpp.boniatillo.api.response.ApiError;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.ActivityACPP;
import com.acpp.boniatillo.util.Util;

import retrofit2.Response;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by julio on 14/02/16.
 */
public class ActivityInteractor extends BaseInteractor {
    

    public ActivityInteractor(Context context, BaseView baseView) {
        this.baseView = baseView;
        this.context = context;

    }


    public void getActivities(final BaseApiGETListCallback<ActivityACPP> callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getActivities()
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread())
//                .doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<ActivitiesResponse>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        baseView.setRefreshing(false);
                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<ActivitiesResponse> response) {


                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body().getActivities());


                    }
                });


    }


    private ActivitiesApi getApi() {
        return getApi(ActivitiesApi.class);
    }


}
