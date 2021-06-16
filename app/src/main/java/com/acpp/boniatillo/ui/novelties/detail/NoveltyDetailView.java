package com.acpp.boniatillo.ui.novelties.detail;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.News;
import com.acpp.boniatillo.model.Offer;

/**
 * Created by julio on 21/02/18.
 */

public interface NoveltyDetailView extends BaseView {
    void showOffer(Offer offer);

    void showNews(News news);
}
