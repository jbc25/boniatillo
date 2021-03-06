package com.acpp.boniatillo.ui.new_payment;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.widget.Toast;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.PaymentInteractor;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Payment;

import com.acpp.boniatillo.R;

import es.dmoral.toasty.Toasty;

/**
 * Created by julio on 19/01/18.
 */


public class NewPaymentPresenter extends BasePresenter {

    private static final String EXTRA_ENTITY = "extra_id_entity";

    private final NewPaymentView view;
    private final PaymentInteractor paymentInteractor;
    private Entity selectedEntity;
    private Payment payment;
    private Integer currentSection;
    private Entity entityPreselected;

    public static Intent newNewPaymentActivity(Context context, Entity entity) {

        Intent intent = new Intent(context, NewPaymentActivity.class);
        if (entity != null) {
            intent.putExtra(EXTRA_ENTITY, entity);
        }
        return intent;
    }

    public static NewPaymentPresenter newInstance(NewPaymentView view, Context context) {

        return new NewPaymentPresenter(view, context);

    }

    private NewPaymentPresenter(NewPaymentView view, Context context) {
        super(context, view);

        this.view = view;
        paymentInteractor = new PaymentInteractor(context, view);

    }

    public void onCreate(Intent intent) {

        payment = new Payment();

        if (intent.hasExtra(EXTRA_ENTITY)) {
            entityPreselected = (Entity) intent.getSerializableExtra(EXTRA_ENTITY);
            onRecipientSelected(entityPreselected);
        } else {
            showSection(1);
        }
    }

    public void onResume() {

    }

    public Entity getSelectedEntity() {
        return selectedEntity;
    }

    public Entity getPreselectedEntity() {
        return entityPreselected;
    }

    public Payment getPayment() {
        return payment;
    }

    public void onRecipientSelected(Entity entity) {

        Data data = App.getUserData(context);
        if (data != null && data.isEntity()) {
            if (entity.getId().equals(data.getEntity().getId())) {
                Toasty.warning(context, context.getString(R.string.cannot_pay_yourself)).show();
                return;
            }
        }

        this.selectedEntity = entity;
        payment.setReceiver(entity.getId());
        showSection(2);
    }

    public void onAmountsConfirmed(Float totalAmount, Float boniatosAmount) {
        payment.setTotal_amount(totalAmount);
        payment.setCurrency_amount(boniatosAmount);
        showSection(3);
    }

    public void onIndicatorSectionClick(Integer section) {
        if (section < currentSection) {
            showSection(section);
        } else {
            Toasty.warning(context, context.getString(R.string.click_continue), Toast.LENGTH_SHORT).show();
        }
    }

    private void showSection(Integer section) {
        currentSection = section;
        view.showSection(section);
    }

    public void onConfirmPayment(String pin) {

//        Toasty.info(context, context.getString(R.string.sending_payment)).show();
//        view.showProgressDialog(context.getString(R.string.sending_payment));
        view.setRefreshing(true);
        payment.setPin_code(pin);
        paymentInteractor.sendPayment(payment, new BaseInteractor.BaseApiPOSTCallback() {
            @Override
            public void onSuccess(Integer id) {

                showPaymentSuccessDialog();

            }

            @Override
            public void onError(String message) {

//                Toasty.error(context, context.getString(R.string.payment_fail)).show();
                Toasty.error(context, message).show();

            }
        });
    }

    private void showPaymentSuccessDialog() {
        new AlertDialog.Builder(context)
                .setTitle(R.string.payment_done)
                .setMessage(String.format(context.getString(R.string.payment_done_message),
                        selectedEntity.getName(), selectedEntity.getBonusFormatted(context, payment.getTotal_amount())))
                .setNeutralButton(R.string.ok, null)
                .setOnDismissListener(new DialogInterface.OnDismissListener() {
                    @Override
                    public void onDismiss(DialogInterface dialog) {
                        finish();
                    }
                })
                .setOnCancelListener(new DialogInterface.OnCancelListener() {
                    @Override
                    public void onCancel(DialogInterface dialog) {
                        finish();
                    }
                })
                .show();
    }

    public void onBackPressed() {
        if (currentSection > 1) {
            currentSection--;
            view.showSection(currentSection);
        } else {
            showConfirmExitDialog();
        }
    }

    private void showConfirmExitDialog() {
        new AlertDialog.Builder(context)
                .setTitle(R.string.cancel_payment)
                .setMessage(R.string.cancel_payment_message)
                .setPositiveButton(R.string.exit, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        ((Activity) context).finish();
                    }
                })
                .setNeutralButton(R.string.remain, null)
                .show();
    }
}
