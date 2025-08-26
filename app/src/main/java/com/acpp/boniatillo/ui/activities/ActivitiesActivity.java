package com.acpp.boniatillo.ui.activities;

import android.os.Bundle;

import androidx.activity.EdgeToEdge;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.model.ActivityACPP;

import java.util.List;

public class ActivitiesActivity extends BaseActivity implements ActivitiesView {

    private ActivitiesPresenter presenter;
    private RecyclerView recyclerActivities;
    private View viewEmpty;
    private View viewTotalTimeSpent;
    private TextView tvTotalTimeSpent;
    private FrameLayout frameToolbar;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        presenter = ActivitiesPresenter.newInstance(this, this);
        setBasePresenter(presenter);

        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_activities);
        configureSecondLevelActivity();
        setToolbarTitle(R.string.activities);

        recyclerActivities = findViewById(R.id.recycler_activities);
        viewEmpty = findViewById(R.id.view_empty);
        viewTotalTimeSpent = findViewById(R.id.view_total_time_spent);
        tvTotalTimeSpent = (TextView) findViewById(R.id.tv_total_time_spent);
        frameToolbar = findViewById(R.id.frame_toolbar);

        ViewCompat.setOnApplyWindowInsetsListener(getWindow().getDecorView(), (v, insets) -> {
            Insets bars = insets.getInsets(
                    WindowInsetsCompat.Type.systemBars()
                            | WindowInsetsCompat.Type.displayCutout()
            );
            v.setPadding(bars.left, 0, bars.right, bars.bottom);
            frameToolbar.setPadding(0, bars.top, 0, 0);
            return WindowInsetsCompat.CONSUMED;
        });

        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerActivities.setLayoutManager(layoutManager);

        RecyclerView.ItemDecoration divider = new DividerItemDecoration(this, DividerItemDecoration.VERTICAL);
        recyclerActivities.addItemDecoration(divider);

        presenter.onCreate();

    }

    @Override
    public void showActivities(List<ActivityACPP> activities, String totalTimeSpent) {
        ActivitiesAdapter adapter = new ActivitiesAdapter(this, activities);
        recyclerActivities.setAdapter(adapter);

        tvTotalTimeSpent.setText(totalTimeSpent);

        viewEmpty.setVisibility(activities.isEmpty() ? View.VISIBLE : View.GONE);
        viewTotalTimeSpent.setVisibility(activities.isEmpty() ? View.GONE : View.VISIBLE);

    }
}
