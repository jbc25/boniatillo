package com.acpp.boniatillo.ui.new_payment.step3;

import android.content.Context;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Payment;
import com.acpp.boniatillo.ui.new_payment.NewPaymentActivity;
import com.acpp.boniatillo.ui.new_payment.NewPaymentPresenter;

/**
 * Created by julio on 1/02/18.
 */


public class NewPaymentStep3Presenter extends BasePresenter {

    private final NewPaymentStep3View view;

    public static NewPaymentStep3Presenter newInstance(NewPaymentStep3View view, Context context) {

        return new NewPaymentStep3Presenter(view, context);

    }

    private NewPaymentStep3Presenter(NewPaymentStep3View view, Context context) {
        super(context, view);

        this.view = view;

    }

    public void onCreate() {

    }

    public void onResume() {

    }

    public void refreshData() {

        Entity entity = getNewPaymentPresenter().getSelectedEntity();
        Payment payment = getNewPaymentPresenter().getPayment();
        view.showPaymentSummaryInfo(
                payment.getBoniatosAmountFormatted() + " " +
                        context.getString(R.string.currency_name_plural),
                payment.getEurosAmountFormatted() + " " + context.getString(R.string.euros),
                entity.getName(),
                entity.getBonusFormatted(context, payment.getTotal_amount()) + " " +
                        context.getString(R.string.currency_name_plural));

    }

    public void onConfirmPaymentClick(String pin) {

        getNewPaymentPresenter().onConfirmPayment(pin);

    }


    private NewPaymentPresenter getNewPaymentPresenter() {
        return (NewPaymentPresenter) ((NewPaymentActivity) context).getBasePresenter();
    }
}
