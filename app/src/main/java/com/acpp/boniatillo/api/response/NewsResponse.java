package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.News;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public class NewsResponse {

    private List<News> news;
    private Meta meta;

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }

    public List<News> getNews() {
        return news;
    }

}
