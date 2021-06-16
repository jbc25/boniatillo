package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.Transaction;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public class TransactionResponse {

    private List<Transaction> transactions;
    private Meta meta;

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }

    public List<Transaction> getTransactions() {
        return transactions;
    }

    public void setTransactions(List<Transaction> transactions) {
        this.transactions = transactions;
    }
}
