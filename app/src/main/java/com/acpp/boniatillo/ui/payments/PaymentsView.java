package com.acpp.boniatillo.ui.payments;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Payment;

import java.util.List;

/**
 * Created by julio on 28/02/18.
 */

public interface PaymentsView extends BaseView {
    void showPendingPayments(List<Payment> payments);

    void onItemRemoved(int position);
}
