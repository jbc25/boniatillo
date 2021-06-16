package com.acpp.boniatillo.ui.main;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

import com.google.firebase.iid.FirebaseInstanceId;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.DeviceInteractor;
import com.acpp.boniatillo.interactor.PaymentInteractor;
import com.acpp.boniatillo.model.AuthLogin;
import com.acpp.boniatillo.model.Device;
import com.acpp.boniatillo.model.Notification;
import com.acpp.boniatillo.model.Payment;

import java.util.List;

/**
 * Created by julio on 2/02/18.
 */


 public class MainPresenter extends BasePresenter {

     private final MainView view;

     public static Intent newMainActivity(Context context) {

         Intent intent = new Intent(context, MainActivity.class);
         intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
         return intent;
     }

     public static MainPresenter newInstance(MainView view, Context context) {

         return new MainPresenter(view, context);

     }

     private MainPresenter(MainView view, Context context) {
         super(context, view);

         this.view = view;

     }

     public void onCreate(Intent intent) {

         if (intent.hasExtra("type")) {
             intent.putExtra(Notification.FIELD_FROM_OUTSIDE, true);
             ((BaseActivity)context).processNotification(intent);
             intent.getExtras().clear();
         }

     }


    public void onResume() {

         refreshData();
        checkTokenFirebaseSent();
     }

     public void refreshData() {

         Data data = App.getUserData(context);
         view.showUserData(data);

         if (data != null) {
             refreshPendingPayments();
         }
     }



    private void refreshPendingPayments() {
        new PaymentInteractor(context, view).getPendingPayments(new BaseInteractor.BaseApiGETListCallback<Payment>() {
            @Override
            public void onResponse(List<Payment> list) {
                if (list != null) {
                    view.showPendingPaymentsNumber(list.size());
                }
            }

            @Override
            public void onError(String message) {

            }
        });
    }

    public void onLogoutClick() {
        App.removeUserData(context);
        view.showUserData(null);
        view.showPendingPaymentsNumber(0);
    }

    private void checkTokenFirebaseSent() {
        if (!getPrefs().getBoolean(App.SHARED_TOKEN_FIREBASE_SENT, false)
                && AuthLogin.API_KEY != null) {
            sendDevice();
        }
    }

    private void sendDevice() {

        String model = Build.MANUFACTURER + " " + Build.MODEL;
        Device device = new Device(model, FirebaseInstanceId.getInstance().getToken());
        new DeviceInteractor(context,  view).sendDevice(device, new BaseInteractor.BaseApiPOSTCallback() {
            @Override
            public void onSuccess(Integer id) {
                getPrefs().edit().putBoolean(App.SHARED_TOKEN_FIREBASE_SENT, true).commit();
            }

            @Override
            public void onError(String message) {
                Log.e(TAG, "onError: error sending device token");
            }
        });
    }
}
