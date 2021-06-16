package com.acpp.boniatillo.ui.activities;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.ActivityACPP;

import java.util.List;

public interface ActivitiesView extends BaseView {
    void showActivities(List<ActivityACPP> activities, String totalTimeSpent);
}
