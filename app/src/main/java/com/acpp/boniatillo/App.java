package com.acpp.boniatillo;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.util.Log;

import androidx.core.widget.ContentLoadingProgressBar;
import androidx.multidex.MultiDex;
import androidx.multidex.MultiDexApplication;

import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.interactor.DeviceInteractor;
import com.acpp.boniatillo.model.AuthLogin;
import com.acpp.boniatillo.model.Device;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.gson.Gson;
import com.squareup.picasso.LruCache;
import com.squareup.picasso.OkHttp3Downloader;
import com.squareup.picasso.Picasso;

/**
 * Created by julio on 17/06/16.
 */

public class App extends MultiDexApplication {

    private static final String TAG = "App";

    public static final String PREFIX = "com.acpp.boniatillo.";
    public static final String SHARED_TOKEN = PREFIX + "shared_token";
    public static final String SHARED_PHONE_NUMBER = PREFIX + "shared_phone_number";

    public static final String SHARED_FIRST_TIME = PREFIX + "first_time_7";
    private static final String DEBUG_TOKEN = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ3ZWIifQ.RR_ekblK831invbbLkIofHrgBXwIU5JVqnhcs_K_bqqcz2zA-wIVzXmWZPOfrSIVZNw4YWRUqXA8tymXKLj1bg";
    public static final String SHARED_INTRO_SEEN = PREFIX + "shared_intro_seen";
    private static final String SHARED_USER_DATA = PREFIX + "shared_user_data";
    public static final String SHARED_TOKEN_FIREBASE_SENT = PREFIX + "shared_token_firebase_sent";
    public static final String ACTION_NOTIFICATION_RECEIVED = PREFIX + "action_notification_received";


    @Override
    public void onCreate() {
        super.onCreate();

        loadApiKey(this);

        ContentLoadingProgressBar progressBar = new ContentLoadingProgressBar(this);


//        final Fabric fabric = new Fabric.Builder(this)
//                .kits(new Crashlytics())
//                .debuggable(true)           // Enables Crashlytics debugger
//                .build();
//        Fabric.with(fabric);


//        Crashlytics.logException(new RuntimeException("prueba"));


        Picasso.Builder builder = new Picasso.Builder(this);
        builder.listener((picasso, uri, exception) -> Log.e(TAG, "onCreate: Image failed.", exception));
        builder.downloader(new OkHttp3Downloader(this, Integer.MAX_VALUE))
                .memoryCache(new LruCache(10000000));
        Picasso built = builder.build();
        built.setIndicatorsEnabled(false);
        built.setLoggingEnabled(true);
        Picasso.setSingletonInstance(built);

        FirebaseMessaging.getInstance().getToken().addOnSuccessListener(s -> Log.i(TAG, "token: " + s));


    }

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);

        MultiDex.install(this);
    }

    public static SharedPreferences getPrefs(Context context) {
//        return new SecurePreferences(context);
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    public static void saveUserData(Context context, Data data) {
        String dataSerial = new Gson().toJson(data);
        getPrefs(context).edit().putString(App.SHARED_USER_DATA, dataSerial).commit();
        AuthLogin.API_KEY = data.getApiKeyFull();
    }

    public static Data getUserData(Context context) {
        String dataSerial = getPrefs(context).getString(SHARED_USER_DATA, null);
        if (dataSerial == null) {
            return null;
        }

        Data data = new Gson().fromJson(dataSerial, Data.class);
        return data;
    }


    private static void loadApiKey(Context context) {
        Data data = getUserData(context);
        if (data != null) {
            AuthLogin.API_KEY = data.getApiKeyFull();
        }
    }

    public static void removeUserData(Context context) {
        getPrefs(context).edit()
                .remove(SHARED_USER_DATA)
                .remove(SHARED_TOKEN_FIREBASE_SENT)
                .commit();

        new DeviceInteractor(context, null).sendDevice(new Device(), new BaseInteractor.BaseApiPOSTCallback() {
            @Override
            public void onSuccess(Integer id) {
                AuthLogin.API_KEY = null;
            }

            @Override
            public void onError(String message) {
                // not good at all
                AuthLogin.API_KEY = null;
            }
        });



    }


    public static boolean isEntity(Context context) {
        Data data = getUserData(context);
        return data != null && data.isEntity();
    }
}
