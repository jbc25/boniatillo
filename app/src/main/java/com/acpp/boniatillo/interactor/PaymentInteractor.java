package com.acpp.boniatillo.interactor;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.PaymentApi;
import com.acpp.boniatillo.api.response.ApiError;
import com.acpp.boniatillo.api.response.PaymentsResponse;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Payment;
import com.acpp.boniatillo.util.Util;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Response;
import rx.Observer;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;

/**
 * Created by julio on 14/02/16.
 */
public class PaymentInteractor extends BaseInteractor {


    public interface Callback {

        void onResponse(List<Entity> entities);

        void onError(String error);
    }

    public PaymentInteractor(Context context, BaseView baseView) {
        this.baseView = baseView;
        this.context = context;

    }


    public void sendPayment(Payment payment, final BaseApiPOSTCallback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().sendPayment(payment)
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

    public void getPendingPayments(final BaseApiGETListCallback<Payment> callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        // BONIATILLOS DONT NEED TO CONFIRM. JUST IN CASE SERVER DONT DO IT WELL XD
        if (true) {
            callback.onResponse(new ArrayList<Payment>());
            return;
        }

        getApi().getPendingPayments()
                .subscribeOn(Schedulers.newThread()).observeOn(AndroidSchedulers.mainThread()).doOnTerminate(actionTerminate)
                .subscribe(new Observer<Response<PaymentsResponse>>() {
                    @Override
                    public void onCompleted() {
                    }

                    @Override
                    public void onError(Throwable e) {

                        callback.onError(e.getMessage());
                    }

                    @Override
                    public void onNext(Response<PaymentsResponse> response) {

                        if (!response.isSuccessful()) {
                            ApiError apiError = ApiError.parse(response);
                            callback.onError(apiError.getMessage());
                            return;
                        }

                        callback.onResponse(response.body().getPayments());


                    }
                });


    }

    public void acceptPayment(String id, final BaseApiPOSTCallback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().acceptPayment(id)
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

    public void cancelPayment(String id, final BaseApiPOSTCallback callback) {

        if (!Util.isConnected(context)) {
            baseView.toast(R.string.no_connection);
            return;
        }

        getApi().cancelPayment(id)
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

    private PaymentApi getApi() {
        return getApi(PaymentApi.class);
    }


}
