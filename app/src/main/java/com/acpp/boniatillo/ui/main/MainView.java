package com.acpp.boniatillo.ui.main;

import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseView;

/**
 * Created by julio on 2/02/18.
 */

public interface MainView extends BaseView {

    void showUserData(Data userData);

    void showPendingPaymentsNumber(int numberPendingPayments);
}
