package com.acpp.boniatillo.ui.entity_info;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;

/**
 * Created by julio on 28/11/17.
 */

public interface EntityInfoView extends BaseView{

    void showEntityInfo(Entity entity);

    void hidePaymentButton();
}
