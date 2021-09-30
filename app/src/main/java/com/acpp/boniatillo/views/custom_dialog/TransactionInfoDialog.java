package com.acpp.boniatillo.views.custom_dialog;

import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.model.Transaction;
import com.acpp.boniatillo.util.Util;

/**
 * Created by julio on 23/03/18.
 */

public class TransactionInfoDialog extends AppCompatDialogFragment implements View.OnClickListener {


    private static final String ARG_TRANSACTION = "arg_transaction";

    private TextView tvTransactionAmount;
    private TextView tvTransactionConcept;
    private TextView btnClose;
    private OnCloseListener onDismissOrCancelListener;

    public static TransactionInfoDialog newInstance(Transaction transaction) {
        TransactionInfoDialog bonusDialog = new TransactionInfoDialog();
        Bundle args = new Bundle();
        args.putSerializable(ARG_TRANSACTION, transaction);
        bonusDialog.setArguments(args);
        return bonusDialog;
    }

    private void findViews(View layout) {
        tvTransactionAmount = (TextView)layout.findViewById( R.id.tv_transaction_amount );
        tvTransactionConcept = (TextView)layout.findViewById( R.id.tv_transaction_concept );
        btnClose = (TextView)layout.findViewById( R.id.btn_close );

        btnClose.setOnClickListener(this);
    }


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {

        View layout = inflater.inflate(R.layout.view_dialog_transaction_info, container, false);
        findViews(layout);

        Transaction transaction = (Transaction) getArguments().getSerializable(ARG_TRANSACTION);

        String amountFormatted = Util.getDecimalFormatted(transaction.getAmount(), false);

        tvTransactionAmount.setText(amountFormatted + " " + getString(R.string.currency_name_plural));
        tvTransactionConcept.setText(transaction.getConcept());


        return layout;
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {

            case R.id.btn_close:
                dismiss();
                break;
        }
    }

    public void setOnDismissOrCancelListener(OnCloseListener listener) {
        this.onDismissOrCancelListener = listener;
    }

}
