package com.acpp.boniatillo.ui.entity_info;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.widget.DividerItemDecoration;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.ui.entity_info.gallery.GalleryPagerFragment;
import com.acpp.boniatillo.util.Util;
import com.squareup.picasso.Picasso;

import es.dmoral.toasty.Toasty;

public class EntityInfoActivity extends BaseActivity implements View.OnClickListener, EntityInfoView, EntitiyOffersAdapter.OnItemClickListener {

    private ImageView imgEntity;
    private ImageView imgHeart;
    private TextView tvAcceptBoniatos;
    private TextView tvBonusBoniatos;
    private TextView btnNewPayment;
    private TextView tvEntityDescription;
    private RecyclerView recyclerOffers;
    private TextView tvEntityName;
    private EntityInfoPresenter presenter;
    private EntitiyOffersAdapter adapter;
    private TextView tvNoOffers;
    private ImageView btnRrssWeb;
    private ImageView btnRrssTelegram;
    private ImageView btnRrssTwitter;
    private ImageView btnRrssFacebook;
    private ImageView btnRrssInstagram;


    private void findViews() {
        imgEntity = (ImageView)findViewById( R.id.img_entity );
        imgHeart = (ImageView)findViewById( R.id.img_heart );
        tvAcceptBoniatos = (TextView)findViewById( R.id.tv_accept_boniatos );
        tvBonusBoniatos = (TextView)findViewById( R.id.tv_bonus_boniatos );
        btnNewPayment = (TextView)findViewById( R.id.btn_new_payment );
        tvEntityDescription = (TextView)findViewById( R.id.tv_entity_description );
        recyclerOffers = (RecyclerView)findViewById( R.id.recycler_offers );
        tvEntityName = (TextView)findViewById( R.id.tv_entity_name );
        tvNoOffers = (TextView) findViewById(R.id.tv_no_offers);

        btnRrssWeb = (ImageView)findViewById( R.id.btn_rrss_web );
        btnRrssTelegram = (ImageView)findViewById( R.id.btn_rrss_telegram );
        btnRrssTwitter = (ImageView)findViewById( R.id.btn_rrss_twitter );
        btnRrssFacebook = (ImageView)findViewById( R.id.btn_rrss_facebook );
        btnRrssInstagram = (ImageView)findViewById( R.id.btn_rrss_instagram );

        btnNewPayment.setOnClickListener(this);
        imgHeart.setOnClickListener(this);

        btnRrssWeb.setOnClickListener(this);
        btnRrssTelegram.setOnClickListener(this);
        btnRrssTwitter.setOnClickListener(this);
        btnRrssFacebook.setOnClickListener(this);
        btnRrssInstagram.setOnClickListener(this);

    }


    @Override
    public void onCreate(Bundle savedInstanceState) {
        presenter = EntityInfoPresenter.newInstance(this, this);
        setBasePresenter(presenter);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_entity_info);

        findViews();
        configureSecondLevelActivity();

        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerOffers.setLayoutManager(layoutManager);

        RecyclerView.ItemDecoration itemDecoration = new DividerItemDecoration(this, DividerItemDecoration.VERTICAL);
        recyclerOffers.addItemDecoration(itemDecoration);

        presenter.onCreate(getIntent());


        btnNewPayment.setVisibility(App.isEntity(this) ? View.GONE : View.VISIBLE);

    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_new_payment:
                presenter.onNewPaymentClick();
                break;

            case R.id.img_heart:
                Toasty.info(this, getString(R.string.social_balance_info_soon)).show();
                break;

            case R.id.btn_rrss_web:
            case R.id.btn_rrss_telegram:
            case R.id.btn_rrss_twitter:
            case R.id.btn_rrss_facebook:
            case R.id.btn_rrss_instagram:
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(String.valueOf(v.getTag()))));
                break;
        }
    }

    @Override
    public void showEntityInfo(Entity entity) {

        tvEntityName.setText(entity.getName());
        if (entity.getDescription() != null) {
            Util.setHtmlLinkableText(tvEntityDescription, entity.getDescription());
        }

        tvNoOffers.setVisibility(entity.getOffers().isEmpty() ? View.VISIBLE : View.GONE);

        tvAcceptBoniatos.setText(entity.getMax_percent_payment() + "%");
        tvBonusBoniatos.setText(entity.getBonusPercent(this) + "%");

        Picasso.with(this)
                .load(entity.getLogo())
//                .placeholder(R.mipmap.img_default_grid)
                .error(R.mipmap.img_mes_header)
//                .resizeDimen(R.dimen.width_image_small, R.dimen.height_image_small)
                .into(imgEntity);

        if (adapter == null) {
            adapter = new EntitiyOffersAdapter(this, entity.getOffers());
            adapter.setOnItemClickListener(this);
            recyclerOffers.setAdapter(adapter);
        } else {
            adapter.updateData(entity.getOffers());
        }

        GalleryPagerFragment galleryPagerFragment = GalleryPagerFragment.newInstance(entity.getGalleryImages(), 0);
        getFragmentManager().beginTransaction().replace(R.id.frame_gallery_pager, galleryPagerFragment).commit();

        setupRRSSButtons(entity);

    }

    private void setupRRSSButtons(Entity entity) {

        btnRrssWeb.setVisibility(Util.isValidLink(entity.getWebpage_link()) ? View.VISIBLE : View.GONE);
        btnRrssWeb.setTag(entity.getWebpage_link());

        btnRrssTelegram.setVisibility(Util.isValidLink(entity.getTelegram_link()) ? View.VISIBLE : View.GONE);
        btnRrssTelegram.setTag(entity.getTelegram_link());

        btnRrssTwitter.setVisibility(Util.isValidLink(entity.getTwitter_link()) ? View.VISIBLE : View.GONE);
        btnRrssTwitter.setTag(entity.getTwitter_link());

        btnRrssFacebook.setVisibility(Util.isValidLink(entity.getFacebook_link()) ? View.VISIBLE : View.GONE);
        btnRrssFacebook.setTag(entity.getFacebook_link());

        btnRrssInstagram.setVisibility(Util.isValidLink(entity.getInstagram_link()) ? View.VISIBLE : View.GONE);
        btnRrssInstagram.setTag(entity.getInstagram_link());

    }

    @Override
    public void hidePaymentButton() {
        btnNewPayment.setVisibility(View.GONE);
    }

    @Override
    public void onOfferClicked(String id, int position) {

        presenter.onOfferClicked(position);
    }

}
