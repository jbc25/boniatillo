package com.acpp.boniatillo.ui.novelties.list;

import android.content.Context;

import com.acpp.boniatillo.base.BaseInteractor;
import com.acpp.boniatillo.base.BasePresenter;
import com.acpp.boniatillo.interactor.NewsInteractor;
import com.acpp.boniatillo.interactor.OfferInteractor;
import com.acpp.boniatillo.model.News;
import com.acpp.boniatillo.model.Novelty;
import com.acpp.boniatillo.model.Offer;
import com.acpp.boniatillo.ui.novelties.detail.NoveltyDetailPresenter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import es.dmoral.toasty.Toasty;

/**
 * Created by julio on 20/02/18.
 */


public class NoveltiesPresenter extends BasePresenter {

    private final NoveltiesView view;
    private final OfferInteractor offerInteractor;
    private final NewsInteractor newsInteractor;
    private List<Novelty> novelties = new ArrayList<>();

    public static NoveltiesPresenter newInstance(NoveltiesView view, Context context) {

        return new NoveltiesPresenter(view, context);

    }

    private NoveltiesPresenter(NoveltiesView view, Context context) {
        super(context, view);

        this.view = view;
        offerInteractor = new OfferInteractor(context, view);
        newsInteractor = new NewsInteractor(context, view);

    }

    public void onCreate() {

        refreshData();
    }

    public void onResume() {

    }

    public void refreshData() {

        novelties.clear();
        view.setRefreshing(true);

        getOffersThenNews();

    }

    private void getOffersThenNews() {

        offerInteractor.getOffers(new BaseInteractor.BaseApiGETListCallback<Offer>() {
            @Override
            public void onResponse(List<Offer> offers) {
                addOffersToNovelties(offers);
                getNews();
            }

            @Override
            public void onError(String message) {
                Toasty.error(context, message).show();
            }
        });
    }

    private void getNews() {
        newsInteractor.getNews(new BaseInteractor.BaseApiGETListCallback<News>() {
            @Override
            public void onResponse(List<News> newsList) {
                addNewsToNovelties(newsList);
            }

            @Override
            public void onError(String message) {
                Toasty.error(context, message).show();
            }
        });
    }

    private void addOffersToNovelties(List<Offer> offers) {

        for (Offer offer : offers) {
            novelties.add(offer);
        }
    }

    private void addNewsToNovelties(List<News> newsList) {

        for (News news : newsList) {
            novelties.add(news);
        }

        Collections.sort(novelties);

        view.showNovelties(novelties);
    }

    public void onNoveltyClick(int position) {
        Novelty novelty = novelties.get(position);
        context.startActivity(NoveltyDetailPresenter.newNoveltyDetailActivity(context, novelty));
    }
}
