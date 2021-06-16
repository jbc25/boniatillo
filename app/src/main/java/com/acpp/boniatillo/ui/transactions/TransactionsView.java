package com.acpp.boniatillo.ui.transactions;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Transaction;

import java.util.List;

/**
 * Created by julio on 1/03/18.
 */

public interface TransactionsView extends BaseView {
    void showTransactions(List<Transaction> transactions);
}
