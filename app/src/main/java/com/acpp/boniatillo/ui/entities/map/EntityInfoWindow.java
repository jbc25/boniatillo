package com.acpp.boniatillo.ui.entities.map;

import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.ui.entities.EntitiesPagerAdapter;

import org.osmdroid.views.MapView;
import org.osmdroid.views.overlay.infowindow.MarkerInfoWindow;

/**
 * Created by julio on 21/02/18.
 */

public class EntityInfoWindow extends MarkerInfoWindow {

    private EntitiesPagerAdapter.EntityListener entityClickListener;

    /**
     * @param layoutResId layout that must contain these ids: bubble_title,bubble_description,
     *                    bubble_subdescription, bubble_image
     * @param mapView
     */
    public EntityInfoWindow(int layoutResId, MapView mapView) {
        super(layoutResId, mapView);
    }

    public void setOnEntityClickListener(EntitiesPagerAdapter.EntityListener entityClickListener) {
        this.entityClickListener = entityClickListener;
    }

    @Override
    public void onOpen(Object item) {
        super.onOpen(item);

        LinearLayout layout = (LinearLayout) mView.findViewById(R.id.bubble_layout);
//        Button btnMoreInfo = (Button) mView.findViewById(R.id.bubble_moreinfo);
        TextView txtTitle = (TextView) mView.findViewById(R.id.bubble_title);
//
//        txtTitle.setText(title);

        txtTitle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                entityClickListener.onEntityClick(-1, getMarkerReference().getId());
            }
        });
    }
}
