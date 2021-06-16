package com.acpp.boniatillo.ui.new_payment.step1;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;

import java.util.List;

/**
 * Created by julio on 30/01/18.
 */

public interface NewPaymentStep1View extends BaseView {

    void enableContinueButton(boolean enable);

    void showEntities(List<Entity> entities);
}
