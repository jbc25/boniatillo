package com.acpp.boniatillo.api.response;

/**
 * Created by julio on 1/02/18.
 */

public class LoginResponse {

    private boolean success;
    private Data data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}
