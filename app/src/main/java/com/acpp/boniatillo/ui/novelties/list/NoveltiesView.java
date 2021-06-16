package com.acpp.boniatillo.ui.novelties.list;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Novelty;

import java.util.List;

/**
 * Created by julio on 20/02/18.
 */

public interface NoveltiesView extends BaseView {

    void showNovelties(List<Novelty> novelties);

}
