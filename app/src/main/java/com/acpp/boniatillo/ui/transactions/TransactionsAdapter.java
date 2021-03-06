package com.acpp.boniatillo.ui.transactions;

import android.content.Context;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.model.Transaction;
import com.acpp.boniatillo.util.Util;

import java.util.List;

/**
 * Created by julio on 1/03/18.
 */


public class TransactionsAdapter extends RecyclerView.Adapter<TransactionsAdapter.ViewHolder> {


    private List<Transaction> transactions;
    private Context context;
    private OnItemClickListener itemClickListener;


    public TransactionsAdapter(Context context, List<Transaction> transactions) {
        this.context = context;
        this.transactions = transactions;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View contactView = LayoutInflater.from(context).inflate(R.layout.row_transaction, parent, false);

        // Return a new holder instance
        ViewHolder viewHolder = new ViewHolder(contactView);
        return viewHolder;
    }


    @Override
    public void onBindViewHolder(final ViewHolder holder, final int position2) {

        final Transaction transaction = getItemAtPosition(holder.getAdapterPosition());

        holder.tvTransactionDatetime.setText(transaction.getDateTimeFormatted());

//        if (transaction.getMade_byadmin()) {
        holder.tvTransactionRelated.setText(transaction.getRelated() != null && !transaction.getRelated().isEmpty() ?
                transaction.getRelated() : context.getString(R.string.acpp));
//        } else {
//            holder.tvTransactionRelated.setText(transaction.getRelated());
//        }
        holder.tvTransactionAmount.setText(Util.getDecimalFormatted(transaction.getAmount(), true));
        holder.tvTransactionAmount.setTextColor(ContextCompat.getColor(context,
                transaction.getAmount() < 0 ? R.color.red : R.color.green_dark));

        holder.tvTransactionAnnotation.setTextColor(ContextCompat.getColor(context,
                transaction.getAmount() < 0 ? R.color.red : R.color.green_dark));

//        if (transaction.getIs_bonification()) {
//            holder.tvTransactionAnnotation.setVisibility(View.VISIBLE);
//            holder.tvTransactionAnnotation.setText(R.string.bonus);
//        } else if (transaction.getIs_euro_purchase()) {
//            holder.tvTransactionAnnotation.setVisibility(View.VISIBLE);
//            holder.tvTransactionAnnotation.setText(R.string.activity);
//        } else {
            holder.tvTransactionAnnotation.setVisibility(View.GONE);
//        }

        holder.tvTransactionCurrentBalance.setText(Util.getDecimalFormatted(transaction.getCurrent_balance(), true));


        holder.rootView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (itemClickListener != null) {
                    itemClickListener.onItemClick(v, holder.getAdapterPosition());
                }
            }
        });


    }

    private void addClickListener(View view, final int position) {

        view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (itemClickListener != null) {
                    itemClickListener.onItemClick(v, position);
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return transactions.size();
    }

    public Transaction getItemAtPosition(int position) {
        return transactions.get(position);
    }

    public void updateData(List<Transaction> transactions) {
        this.transactions = transactions;
        notifyDataSetChanged();
    }


    public static class ViewHolder extends RecyclerView.ViewHolder {

        public View rootView;
        private TextView tvTransactionDatetime;
        private TextView tvTransactionRelated;
        private TextView tvTransactionAmount;
        private TextView tvTransactionAnnotation;
        private TextView tvTransactionCurrentBalance;


        public ViewHolder(View itemView) {

            super(itemView);

            tvTransactionDatetime = (TextView) itemView.findViewById(R.id.tv_transaction_datetime);
            tvTransactionRelated = (TextView) itemView.findViewById(R.id.tv_transaction_related);
            tvTransactionAmount = (TextView) itemView.findViewById(R.id.tv_transaction_amount);
            tvTransactionAnnotation = (TextView) itemView.findViewById(R.id.tv_transaction_amount_annotation);
            tvTransactionCurrentBalance = (TextView) itemView.findViewById(R.id.tv_transaction_current_balance);

            rootView = itemView;
        }

    }


    public void setOnItemClickListener(OnItemClickListener listener) {
        this.itemClickListener = listener;
    }

    public interface OnItemClickListener {
        void onItemClick(View view, int position);
    }
}


