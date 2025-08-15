package com.acpp.boniatillo.ui.entities.map;

import com.acpp.boniatillo.ui.entities.EntitiesPagerAdapter;

import org.maplibre.android.maps.MapView;


/**
 * Created by julio on 21/02/18.
 */

public class EntityInfoWindow {

    private EntitiesPagerAdapter.EntityListener entityClickListener;

    /**
     * @param layoutResId layout that must contain these ids: bubble_title,bubble_description,
     *                    bubble_subdescription, bubble_image
     * @param mapView
     */
    public EntityInfoWindow(int layoutResId, MapView mapView) {
    }

    public void setOnEntityClickListener(EntitiesPagerAdapter.EntityListener entityClickListener) {
        this.entityClickListener = entityClickListener;
    }

//    @Override
//    public void onOpen(Object item) {
//        super.onOpen(item);
//
//        LinearLayout layout = (LinearLayout) mView.findViewById(R.id.bubble_layout);
////        Button btnMoreInfo = (Button) mView.findViewById(R.id.bubble_moreinfo);
//        TextView txtTitle = (TextView) mView.findViewById(R.id.bubble_title);
////
////        txtTitle.setText(title);
//
//        txtTitle.setOnClickListener(v -> entityClickListener.onEntityClick(-1, getMarkerReference().getId()));
//    }
}
