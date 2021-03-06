package com.acpp.boniatillo.interactor;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.EntitiesApi;
import com.acpp.boniatillo.api.response.ApiError;
import com.acpp.boniatillo.api.response.EntitiesResponse;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.util.Util;

import java.util.List;

import retrofit2.Response;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by julio on 14/02/16.
 */
public class EntityInteractor extends BaseInteractor {



    public interface Callback {

        void onResponse(List<Entity> entities);

        void onError(String error);
    }

    public EntityInteractor(Context context, BaseView baseView) {
        this.baseView = baseView;
        this.context = context;

    }


    public void getEntities(final Callback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getEntities()
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<EntitiesResponse>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                        e.printStackTrace();
                    }

                    @Override
                    public void onNext(Response<EntitiesResponse> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body().getEntities());


                    }
                });


    }

    public void getEntitiesFiltered(String query, final Callback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getEntitiesFiltered(query)
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<EntitiesResponse>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<EntitiesResponse> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body().getEntities());


                    }
                });


    }

    public void getEntityById(String id, final BaseApiCallback<Entity> callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getEntityById(id)
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<Entity>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<Entity> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body());


                    }
                });
    }

    private EntitiesApi getApi() {
        return getApi(EntitiesApi.class);
    }


}
