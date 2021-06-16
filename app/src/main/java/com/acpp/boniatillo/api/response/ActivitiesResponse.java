package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.ActivityACPP;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public class ActivitiesResponse {

    private List<ActivityACPP> activities;
    private Meta meta;

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }

    public List<ActivityACPP> getActivities() {
        return activities;
    }

    public void setActivities(List<ActivityACPP> activities) {
        this.activities = activities;
    }
}
