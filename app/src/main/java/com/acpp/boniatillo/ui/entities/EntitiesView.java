package com.acpp.boniatillo.ui.entities;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;

import java.util.List;

/**
 * Created by julio on 11/10/17.
 */

public interface EntitiesView extends BaseView {

    void showEntities(List<Entity> entities);
}
