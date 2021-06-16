package com.acpp.boniatillo.ui.wallet;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v7.app.AlertDialog;
import android.widget.ImageView;

import net.glxn.qrgen.android.QRCode;
import com.acpp.boniatillo.App;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.PaymentInteractor;
import com.acpp.boniatillo.interactor.WalletInteractor;
import com.acpp.boniatillo.model.Payment;
import com.acpp.boniatillo.model.Wallet;

import java.util.List;

/**
 * Created by julio on 2/02/18.
 */


public class WalletPresenter extends BasePresenter {

    private final WalletView view;
    private final WalletInteractor walletInteractor;

    public static WalletPresenter newInstance(WalletView view, Context context) {

        return new WalletPresenter(view, context);

    }

    private WalletPresenter(WalletView view, Context context) {
        super(context, view);

        this.view = view;

        walletInteractor = new WalletInteractor(context, view);

    }

    public void onCreate() {

    }

    public void onResume() {

        refreshData();
    }

    public void refreshData() {

        Data data = App.getUserData(context);
        if (data != null) {
            view.showUserInfo(data.getName());
            refreshWalletData();
            refreshPendingPayments();
        } else {
            view.showLoggedOutView();
        }


    }

    public boolean isQRGeneratorVisible() {
        return App.isEntity(context);
//        return App.getUserData(context) != null;
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

    private void refreshWalletData() {

        view.showWalletData(true, null);

        walletInteractor.getWallet(new WalletInteractor.Callback() {
            @Override
            public void onResponse(Wallet wallet) {
                view.showWalletData(false, wallet);
            }

            @Override
            public void onError(String error) {

            }
        });
    }

    public void onShowQRClick() {

        String id = App.getUserData(context).getEntity().getId();
        int sizeQR = context.getResources().getDimensionPixelSize(R.dimen.size_qr);

        Bitmap qrBitmap = QRCode.from(id).withSize(sizeQR, sizeQR).bitmap();
        ImageView imageView = new ImageView(context);
        imageView.setImageBitmap(qrBitmap);

        new AlertDialog.Builder(context)
                .setTitle(R.string.entity_qr)
                .setView(imageView)
                .setNegativeButton(R.string.back, null)
                .show();
    }
}
