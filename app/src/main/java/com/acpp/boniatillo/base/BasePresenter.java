package com.acpp.boniatillo.base;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.util.Util;


/**
 * Created by julio on 16/12/15.
 */
public class BasePresenter {

    public final String TAG = this.getClass().getSimpleName();

    public Context context;
    public BaseView baseView;

    public BasePresenter(Context context, BaseView view) {
        this.context = context;
        this.baseView = view;
    }

    public SharedPreferences getPrefs() {
        return App.getPrefs(context);
    }

    // -------- UTILS --------------
    protected boolean isConnected() {
        return Util.isConnected(context);
    }

    protected boolean isConnectedIfNotShowAlert() {

        boolean isConnected = isConnected();
        if (!isConnected) {
            baseView.alert(context.getString(R.string.no_connection));
        }

        return isConnected;
    }

    protected boolean isConnectedIfNotShowToast() {

        boolean isConnected = isConnected();
        if (!isConnected) {
            baseView.toast(context.getString(R.string.no_connection));
        }

        return isConnected;
    }

    public void setBaseView(BaseView baseView) {
        this.baseView = baseView;
    }


    public void finish() {
        ((Activity) context).finish();
    }


    // ------- COMMON METHODS --------------

    public App getApp() {
        return (App) context.getApplicationContext();
    }


}
