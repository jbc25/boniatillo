package com.acpp.boniatillo.ui.entity_info;

import android.content.Context;
import android.content.Intent;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Offer;
import com.acpp.boniatillo.ui.new_payment.NewPaymentPresenter;
import com.acpp.boniatillo.ui.novelties.detail.NoveltyDetailPresenter;

import es.dmoral.toasty.Toasty;

/**
 * Created by julio on 28/11/17.
 */


 public class EntityInfoPresenter extends BasePresenter {

    private static final String EXTRA_ID_ENTITY = "extra_id_entity";
    private static final String EXTRA_ENTITY = "extra_entity";

    private final EntityInfoView view;
    private Entity entity;

    public static void startEntityInfoActivity(Context context, Entity entity) {
        Intent intent = new Intent(context, EntityInfoActivity.class);
        intent.putExtra(EXTRA_ENTITY, entity);
        context.startActivity(intent);
    }

     public static EntityInfoPresenter newInstance(EntityInfoView view, Context context) {

         return new EntityInfoPresenter(view, context);

     }

     private EntityInfoPresenter(EntityInfoView view, Context context) {
         super(context, view);

         this.view = view;

     }

     public void onCreate(Intent intent) {

         entity = (Entity) intent.getSerializableExtra(EXTRA_ENTITY);
         view.showEntityInfo(entity);

         Data data = App.getUserData(context);
         if (data != null && data.isEntity()) {
             if (entity.getId().equals(data.getEntity().getId())) {
                 view.hidePaymentButton(); // Cannot pay myself
             }
         }
     }

     public void onResume() {

         refreshData();
     }

     public void refreshData() {


     }

    public void onOfferClicked(int position) {
        Offer offer = entity.getOffers().get(position);
        context.startActivity(NoveltyDetailPresenter.newNoveltyDetailActivity(context, offer));
    }

    public void onNewPaymentClick() {

        Data data = App.getUserData(context);
        if (data != null) {
            context.startActivity(NewPaymentPresenter.newNewPaymentActivity(context, entity));
        } else {
            Toasty.info(context, context.getString(R.string.payment_enter_user_before)).show();
        }
    }
}
