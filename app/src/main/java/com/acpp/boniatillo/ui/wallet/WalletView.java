package com.acpp.boniatillo.ui.wallet;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Wallet;

/**
 * Created by julio on 2/02/18.
 */

public interface WalletView extends BaseView {

    void showUserInfo(String name);

    void showWalletData(boolean showLoading, Wallet wallet);

    void showPendingPaymentsNumber(int numberPendingPayments);

    void showLoggedOutView();
}
