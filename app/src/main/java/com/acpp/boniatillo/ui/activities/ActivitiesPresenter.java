package com.acpp.boniatillo.ui.activities;


import android.content.Context;
import android.content.Intent;

import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.ActivityInteractor;
import com.acpp.boniatillo.model.ActivityACPP;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public class ActivitiesPresenter extends BasePresenter {

    private final ActivitiesView view;

    public static void launchActivitiesActivity(Context context) {

        Intent intent = new Intent(context, ActivitiesActivity.class);

        context.startActivity(intent);
    }

    public static ActivitiesPresenter newInstance(ActivitiesView view, Context context) {

        return new ActivitiesPresenter(view, context);

    }

    private ActivitiesPresenter(ActivitiesView view, Context context) {
        super(context, view);

        this.view = view;

    }

    public void onCreate() {

        new ActivityInteractor(context, view).getActivities(new BaseInteractor.BaseApiGETListCallback<ActivityACPP>() {
            @Override
            public void onResponse(List<ActivityACPP> list) {

                long totalTimeSpent = calculateTotalTimeSpent(list);
                view.showActivities(list, ActivityACPP.timeSpentFormatUser.format(new Date(totalTimeSpent)));
            }

            @Override
            public void onError(String message) {
                view.toast(message);
            }
        });
    }

    private long calculateTotalTimeSpent(List<ActivityACPP> list) {
        long millisSpent = 0;
        for (ActivityACPP activity : list) {
            try {
                Date date = ActivityACPP.timeSpentFormatApi.parse(activity.getTime_spent());
                millisSpent += date.getTime();
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        return millisSpent;
    }


}
