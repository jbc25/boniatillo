package com.acpp.boniatillo.ui.payments;

import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;

import androidx.activity.EdgeToEdge;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.model.Payment;

import java.util.List;

public class PaymentsActivity extends BaseActivity implements PaymentsView, PaymentsAdapter.OnItemClickListener {

    private PaymentsPresenter presenter;
    private PaymentsAdapter adapter;
    private LinearLayout viewPayments;
    private RecyclerView recyclerPayments;
    private ProgressBar progressPayments;
    private FrameLayout frameToolbar;

    private void findViews() {
        viewPayments = (LinearLayout)findViewById( R.id.view_payments );
        recyclerPayments = (RecyclerView)findViewById( R.id.recycler_payments );
        progressPayments = (ProgressBar)findViewById( R.id.progress_payments );
        frameToolbar = (FrameLayout) findViewById(R.id.frame_toolbar);
    }



    @Override
    public void onCreate(Bundle savedInstanceState) {
        presenter = PaymentsPresenter.newInstance(this, this);
        setBasePresenter(presenter);

        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_paments);

        configureSecondLevelActivity();
        findViews();

        ViewCompat.setOnApplyWindowInsetsListener(frameToolbar, (v, insets) -> {
            Insets bars = insets.getInsets(
                    WindowInsetsCompat.Type.systemBars()
                            | WindowInsetsCompat.Type.displayCutout()
            );
            v.setPadding(bars.left, 0, bars.right, bars.bottom);
            frameToolbar.setPadding(0, bars.top, 0, 0);
            return WindowInsetsCompat.CONSUMED;
        });

        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerPayments.setLayoutManager(layoutManager);
//        recyclerPayments.setItemAnimator(new OvershootInRightAnimator());

        presenter.onCreate();

    }

    @Override
    public void refreshData() {
        presenter.refreshData();
    }

//    @Override
//    public void setRefreshing(boolean refresing) {
//        viewPayments.setVisibility(refresing ? View.GONE : View.VISIBLE);
//        progressPayments.setVisibility(refresing ? View.VISIBLE : View.GONE);
//    }

    @Override
    public void showPendingPayments(List<Payment> payments) {
        if (adapter == null) {
            adapter = new PaymentsAdapter(this, payments);
            adapter.setOnItemClickListener(this);
            recyclerPayments.setAdapter(adapter);
        } else {
            adapter.notifyDataSetChanged();
        }
    }

    @Override
    public void onAcceptPaymentClick(View view, int position) {
//        recyclerPayments.setItemAnimator(new ScaleInRightAnimator());
        presenter.onAcceptPaymentClick(position);
    }

    @Override
    public void onCancelClick(View view, int position) {
//        recyclerPayments.setItemAnimator(new OvershootInLeftAnimator());
        presenter.onCancelPaymentClick(position);

    }

    @Override
    public void onItemRemoved(int position) {
        adapter.onItemRemoved(position);
    }
}
