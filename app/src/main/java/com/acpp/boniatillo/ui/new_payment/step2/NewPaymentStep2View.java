package com.acpp.boniatillo.ui.new_payment.step2;

import com.acpp.boniatillo.base.BaseView;

/**
 * Created by julio on 31/01/18.
 */

public interface NewPaymentStep2View extends BaseView {

    void showBoniatosRestrictions(String maxAcceptedByEntity, String balance);

    void showTotalAmountInputError(String error);

    void showBoniatosAmountInputError(String error);

    void enableContinueButton(boolean enable);

    void showPresetBoniatosAmount(String amount);
}
