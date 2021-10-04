package com.acpp.boniatillo.ui.new_payment.step1;


import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseFragment;
import com.acpp.boniatillo.model.Entity;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class NewPaymentStep1Fragment extends BaseFragment implements NewPaymentStep1View, View.OnClickListener, EntitiesPaymentAdapter.OnItemClickListener {

    private RecyclerView recyclerRecipients;
    private TextView btnContinue;
    private NewPaymentStep1Presenter presenter;
    private ProgressBar progressRecipients;
    private EntitiesPaymentAdapter adapter;


    public NewPaymentStep1Fragment() {
        // Required empty public constructor
    }

    private void findViews(View layout) {

        recyclerRecipients = (RecyclerView)layout.findViewById( R.id.recycler_recipients );
        progressRecipients = (ProgressBar) layout.findViewById(R.id.progress_recipients);
        btnContinue = (TextView)layout.findViewById( R.id.btn_continue );

        btnContinue.setOnClickListener(this);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        presenter = NewPaymentStep1Presenter.newInstance(this, getActivity());
        setBasePresenter(presenter);

        View layout = inflater.inflate(R.layout.fragment_payment_step1, container, false);
        findViews(layout);

        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(getActivity());
        recyclerRecipients.setLayoutManager(layoutManager);

        RecyclerView.ItemDecoration divider = new DividerItemDecoration(getActivity(), DividerItemDecoration.VERTICAL);
        recyclerRecipients.addItemDecoration(divider);

        setHasOptionsMenu(true);

        presenter.onCreate();

        return layout;
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.new_payment_scan, menu);
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.menuItem_scan_qr:
                startScan();
                break;
        }

        return super.onOptionsItemSelected(item);
    }

    private void startScan() {

        // https://github.com/journeyapps/zxing-Android-embedded
        IntentIntegrator.forFragment(this)
                .setBeepEnabled(true)
                .setPrompt(getString(R.string.focus_qr_code_entity))
                .setDesiredBarcodeFormats(IntentIntegrator.QR_CODE)
                .setOrientationLocked(false)
                .initiateScan();

    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {

        IntentResult result = IntentIntegrator.parseActivityResult(requestCode, resultCode, data);
        if(result != null) {
            if(result.getContents() != null) {
                presenter.onIdScanned(result.getContents());
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_continue:
                presenter.onContinueClick();
                break;
        }
    }


    @Override
    public void onItemClick(View view, int position) {
        presenter.onEntityItemClick(position);
    }

    // PRESENTER CALLBACKS
    @Override
    public void enableContinueButton(boolean enable) {
        btnContinue.setEnabled(enable);
    }

    @Override
    public void showEntities(List<Entity> entities) {
        progressRecipients.setVisibility(View.GONE);

        if (adapter == null) {
            adapter = new EntitiesPaymentAdapter(getActivity(), entities);
            adapter.setOnItemClickListener(this);
            recyclerRecipients.setAdapter(adapter);
        } else {
            adapter.updateData(entities);
        }
    }

}
