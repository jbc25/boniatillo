package com.acpp.boniatillo.base;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.common.ApiClient;
import com.acpp.boniatillo.util.Util;

import java.util.List;

import rx.functions.Action0;

/**
 * Created by julio on 14/02/16.
 */
public class BaseInteractor {

    public final String TAG = this.getClass().getSimpleName();

    public Context context;
    public BaseView baseView;

    public <T> T getApi(Class<T> service) {
        return ApiClient.getInstance().create(service);
    }

    public interface BaseApiCallback<T> {
        void onResponse(T responseBody);

        void onError(String message);
    }

    public interface BaseApiPOSTCallback {
        void onSuccess(Integer id);

        void onError(String message);
    }

    public interface BaseApiGETListCallback<T> {
        void onResponse(List<T> list);

        void onError(String message);
    }

    public Action0 actionTerminate = new Action0() {
        @Override
        public void call() {

            if (baseView != null) {
                baseView.setRefreshing(false);
                baseView.hideProgressDialog();
            }

        }
    };


    public boolean isConnected() {

        boolean connected = Util.isConnected(context);

        if (!connected) {
            if (baseView != null) {
                baseView.toast(R.string.no_connection);
            }
        }

        return connected;
    }

}
