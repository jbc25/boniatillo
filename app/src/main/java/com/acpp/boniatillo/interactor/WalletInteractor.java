package com.acpp.boniatillo.interactor;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.WalletApi;
import com.acpp.boniatillo.api.model.Purchase;
import com.acpp.boniatillo.api.response.ApiError;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Wallet;
import com.acpp.boniatillo.util.Util;

import retrofit2.Response;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by julio on 14/02/16.
 */
public class WalletInteractor extends BaseInteractor {


    public interface Callback {

        void onResponse(Wallet wallet);

        void onError(String error);
    }

    public WalletInteractor(Context context, BaseView baseView) {
        this.baseView = baseView;
        this.context = context;

    }


    public void getWallet(final Callback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().getWallet()
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<Wallet>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<Wallet> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body());


                    }
                });


    }

    public void purchaseCurrency(Float amount, final BaseApiPOSTCallback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        Purchase purchase = new Purchase(amount);

        getApi().purchaseCurrency(purchase)
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<Void>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<Void> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onSuccess(null);

                    }
                });


    }

    private WalletApi getApi() {
        return getApi(WalletApi.class);
    }


}
