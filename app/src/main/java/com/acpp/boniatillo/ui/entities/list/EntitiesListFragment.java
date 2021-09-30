package com.acpp.boniatillo.ui.entities.list;


import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseFragment;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.ui.entities.EntitiesPagerAdapter;
import com.acpp.boniatillo.ui.entities.EntitiesView;

import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class EntitiesListFragment extends BaseFragment implements EntitiesAdapter.OnItemClickListener, EntitiesView {


    private RecyclerView recyclerEntities;
    private EntitiesAdapter adapter;
    private EntitiesPagerAdapter.EntityListener entityListener;


    public EntitiesListFragment() {
        // Required empty public constructor
    }

    private void findViews(View layout) {
        recyclerEntities = (RecyclerView) layout.findViewById(R.id.recycler_entities);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {


        View layout = inflater.inflate(R.layout.fragment_entities_list, container, false);
        findViews(layout);

        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getActivity());
        recyclerEntities.setLayoutManager(linearLayoutManager);

//        RecyclerView.ItemDecoration divider = new DividerItemDecoration(getActivity(), DividerItemDecoration.VERTICAL);
//        recyclerEntities.addItemDecoration(divider);

        return layout;
    }


    // Presenter Callbacks
    @Override
    public void showEntities(List<Entity> entities) {

        if (adapter == null) {

            adapter = new EntitiesAdapter(getActivity(), entities);
            adapter.setOnItemClickListener(this);

            recyclerEntities.setAdapter(adapter);

        } else {
            adapter.updateData(entities);
        }
    }

    @Override
    public void onEntityClicked(String id, int position) {
        entityListener.onEntityClick(position, id);
    }

    @Override
    public void onEntityFavouriteClicked(String id, int position) {
        entityListener.onEntityFavouriteClick(position, id);
    }


    public void setEntityListener(EntitiesPagerAdapter.EntityListener entityListener) {
        this.entityListener = entityListener;
    }
}
