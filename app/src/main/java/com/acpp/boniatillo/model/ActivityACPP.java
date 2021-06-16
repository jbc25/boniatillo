package com.acpp.boniatillo.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ActivityACPP {

    private String day;
    private String daytime;
    private String time_spent;
    private ActivityInfo activity;


    public transient static final DateFormat dayFormatApi = new SimpleDateFormat("yyyy-MM-dd");
    public transient static final DateFormat dayTimeFormatApi = new SimpleDateFormat("HH:mm:ss");
    public transient static final DateFormat timeSpentFormatApi = new SimpleDateFormat("HH:mm:ss");

    public transient static final DateFormat dayFormatUser = new SimpleDateFormat("EEE d MMMM");
    public transient static final DateFormat timeFormatUser = new SimpleDateFormat("HH:mm");
    public transient static final DateFormat timeSpentFormatUser = new SimpleDateFormat("H:mm 'h'");

    public String getDayUserFormat() {

        try {
            Date date = dayFormatApi.parse(getDay());
            String dayFormatted = dayFormatUser.format(date);
            return dayFormatted;
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return getDay();
    }

    public String getTimeUserFormat() {

        try {
            Date date = dayTimeFormatApi.parse(getDaytime());
            String dayFormatted = timeFormatUser.format(date);
            return dayFormatted;
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return getDaytime();
    }

    public String getTimeSpentUserFormat() {
        try {
            Date date = timeSpentFormatApi.parse(getTime_spent());
            String dayFormatted = timeSpentFormatUser.format(date);
            return dayFormatted;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return getTime_spent();
    }


    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime_spent() {
        return time_spent;
    }

    public void setTime_spent(String time_spent) {
        this.time_spent = time_spent;
    }

    public ActivityInfo getActivity() {
        return activity;
    }

    public void setActivity(ActivityInfo activity) {
        this.activity = activity;
    }

    public String getDaytime() {
        return daytime;
    }

    public void setDaytime(String daytime) {
        this.daytime = daytime;
    }



    /*
    {
      "activity": {
        "description": "",
        "name": "Agrocompostaje",
        "type_activity": "Personas responsables en el centro"
      },
      "day": "2018-04-27",
      "time_spent": "04:00:00"
    }
 */
}
