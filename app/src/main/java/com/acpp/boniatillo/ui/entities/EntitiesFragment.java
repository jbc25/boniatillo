package com.acpp.boniatillo.ui.entities;


import android.graphics.drawable.Drawable;
import android.os.Bundle;
import androidx.fragment.app.Fragment;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.drawable.DrawableCompat;
import androidx.viewpager.widget.ViewPager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseFragment;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.util.WindowUtils;

import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class EntitiesFragment extends BaseFragment implements EntitiesView, EntitiesPagerAdapter.EntityListener, ViewPager.OnPageChangeListener, View.OnClickListener {

    private LinearLayout viewSearchEntities;
    private EditText editSearchEntities;
    private ViewPager viewpagerEntities;
    private EntitiesPresenter presenter;
    private EntitiesPagerAdapter pagerAdapter;
    private MenuItem menuItemMap;
    private MenuItem menuItemList;
    private View btnSearchEntities;

    private void findViews(View layout) {
        viewSearchEntities = (LinearLayout) layout.findViewById(R.id.view_search_entities);
        editSearchEntities = (EditText) layout.findViewById(R.id.edit_search_entities);
        viewpagerEntities = (ViewPager) layout.findViewById(R.id.viewpager_entities);
        btnSearchEntities = layout.findViewById(R.id.btn_search_entities);

        btnSearchEntities.setOnClickListener(this);
    }


    public EntitiesFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        presenter = EntitiesPresenter.newInstance(this, getActivity());
        setBasePresenter(presenter);

        View layout = inflater.inflate(R.layout.fragment_entities, container, false);
        findViews(layout);

        pagerAdapter = new EntitiesPagerAdapter(getChildFragmentManager(), this);
        viewpagerEntities.setAdapter(pagerAdapter);
        viewpagerEntities.addOnPageChangeListener(this);

        presenter.onCreate();

        setHasOptionsMenu(true);

        return layout;
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.fragment_entities, menu);
        tintMenuIcons(menu);
        menuItemMap = menu.findItem(R.id.menuItem_show_map);
        menuItemList = menu.findItem(R.id.menuItem_show_list);
        super.onCreateOptionsMenu(menu, inflater);
    }

    public void tintMenuIcons(Menu menu) {

        for (int i = 0; i < menu.size(); i++) {
            MenuItem menuItem = menu.getItem(i);
            Drawable drawable = menuItem.getIcon();

            drawable = DrawableCompat.wrap(drawable);
            DrawableCompat.setTint(drawable, ContextCompat.getColor(getActivity(), R.color.colorAccent));
            menuItem.setIcon(drawable);
        }

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        switch (item.getItemId()) {
            case R.id.menuItem_search:
                viewSearchEntities.setVisibility(viewSearchEntities.getVisibility() == View.VISIBLE ? View.GONE : View.VISIBLE);
                if (viewSearchEntities.getVisibility() == View.GONE) {
                    WindowUtils.hideSoftKeyboard(getActivity());
                }

                break;

            case R.id.menuItem_show_map:
            case R.id.menuItem_show_list:
                viewpagerEntities.setCurrentItem(viewpagerEntities.getCurrentItem() == 0 ? 1 : 0, true);
                break;
        }

        return super.onOptionsItemSelected(item);
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_search_entities:
                presenter.onSearch(editSearchEntities.getText().toString());
                break;
        }

    }


    // PRESENTER CALLBACKS
    @Override
    public void showEntities(List<Entity> entities) {
        pagerAdapter.updateData(entities);
    }

    // CHILD ENTITIES CALLBACKS
    @Override
    public void onEntityClick(int position, String id) {
        presenter.onEntityClicked(position, id);
    }

    @Override
    public void onEntityFavouriteClick(int position, String id) {
        presenter.onEntityFavouriteClicked(position, id);
    }


    // VIEW PAGER CALLBACKS
    @Override
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

    }

    @Override
    public void onPageSelected(int position) {
        menuItemMap.setVisible(position == 0);
        menuItemList.setVisible(position == 1);
    }


    @Override
    public void onPageScrollStateChanged(int state) {

    }

}
