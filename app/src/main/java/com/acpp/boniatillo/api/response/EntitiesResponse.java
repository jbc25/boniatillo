package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.Entity;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public class EntitiesResponse {

    private List<Entity> entities;
    private Meta meta;

    public List<Entity> getEntities() {
        return entities;
    }

    public void setEntities(List<Entity> entities) {
        this.entities = entities;
    }

    public Meta getMeta() {
        return meta;
    }

    public void setMeta(Meta meta) {
        this.meta = meta;
    }
}
