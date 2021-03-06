package com.acpp.boniatillo.ui.new_payment.step1;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.EntityInteractor;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.ui.new_payment.NewPaymentActivity;
import com.acpp.boniatillo.ui.new_payment.NewPaymentPresenter;

import java.util.ArrayList;
import java.util.List;

import es.dmoral.toasty.Toasty;

/**
 * Created by julio on 30/01/18.
 */


 public class NewPaymentStep1Presenter extends BasePresenter {

     private final NewPaymentStep1View view;
    private final EntityInteractor entityInteractor;
    public List<Entity> entities = new ArrayList<>();
    private Entity entitySelected;

    public static NewPaymentStep1Presenter newInstance(NewPaymentStep1View view, Context context) {

         return new NewPaymentStep1Presenter(view, context);

     }

     private NewPaymentStep1Presenter(NewPaymentStep1View view, Context context) {
         super(context, view);

         this.view = view;
         entityInteractor = new EntityInteractor(context, view);

     }

     public void onCreate() {

//         if (getNewPaymentPresenter().getPreselectedEntity() != null) {
//             showPreselectedEntity(getNewPaymentPresenter().getPreselectedEntity());
//         }

         refreshData();
         view.enableContinueButton(false);
     }


    public void onResume() {

     }

     public void refreshData() {

        entityInteractor.getEntities(new EntityInteractor.Callback() {

            @Override
            public void onResponse(List<Entity> entitiesReceived) {
                entities.clear();
                entities.addAll(entitiesReceived);
                view.showEntities(entities);
            }

            @Override
            public void onError(String error) {

            }
        });

     }

    public void onEntityItemClick(int position) {
        this.entitySelected = entities.get(position);
        view.enableContinueButton(true);
    }



     public void onContinueClick() {
         getNewPaymentPresenter().onRecipientSelected(entitySelected);
     }


     private NewPaymentPresenter getNewPaymentPresenter() {
         return (NewPaymentPresenter) ((NewPaymentActivity) context).getBasePresenter();
     }

    public void onIdScanned(String id) {

        view.setRefreshing(true);

        entityInteractor.getEntityById(id, new BaseInteractor.BaseApiCallback<Entity>() {
            @Override
            public void onResponse(Entity entity) {
                showConfirDialog(entity);
            }

            @Override
            public void onError(String message) {
                Toasty.error(context, context.getString(R.string.user_not_recognized)).show();
            }
        });
    }

    private void showConfirDialog(final Entity entity) {
        new AlertDialog.Builder(context)
                .setTitle(entity.getName())
                .setMessage(String.format(context.getString(R.string.entity_recognized_message), entity.getName()))
                .setPositiveButton(R.string.continue_str, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        entitySelected = entity;
                        getNewPaymentPresenter().onRecipientSelected(entitySelected);
                    }
                })
                .setNeutralButton(R.string.back, null)
                .show();
    }
}
