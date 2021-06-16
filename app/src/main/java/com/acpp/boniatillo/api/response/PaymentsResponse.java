package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.Payment;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public class PaymentsResponse {

    private List<Payment> payments;
    private Meta meta;

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }
}
