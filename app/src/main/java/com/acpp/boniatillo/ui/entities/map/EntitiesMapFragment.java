package com.acpp.boniatillo.ui.entities.map;


import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Bundle;

import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseFragment;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.ui.entities.EntitiesPagerAdapter;
import com.acpp.boniatillo.ui.entities.EntitiesPresenter;
import com.acpp.boniatillo.ui.entities.EntitiesView;
import com.google.gson.JsonObject;

import org.maplibre.android.MapLibre;
import org.maplibre.android.camera.CameraPosition;
import org.maplibre.android.camera.CameraUpdateFactory;
import org.maplibre.android.geometry.LatLng;
import org.maplibre.android.maps.MapLibreMap;
import org.maplibre.android.maps.MapView;
import org.maplibre.android.maps.Style;
import org.maplibre.android.plugins.annotation.Symbol;
import org.maplibre.android.plugins.annotation.SymbolManager;
import org.maplibre.android.plugins.annotation.SymbolOptions;
import org.maplibre.android.utils.BitmapUtils;
import org.maplibre.geojson.Point;

import java.util.ArrayList;
import java.util.List;

/**
 * A simple {@link Fragment} subclass.
 */
public class EntitiesMapFragment extends BaseFragment implements EntitiesView {


//    private final LatLng latLngStart = new LatLng(40.345825, -3.694815); // Villaverde
    private final LatLng latLngStart = new LatLng(40.484496650657995, -3.369288575547182); // Alcalá
    private EntitiesPresenter presenter;
    private EntitiesPagerAdapter.EntityListener entityListener;
    private MapView mapView;
    private MapLibreMap libreMap;

    private SymbolManager symbolManager;
    private List<Symbol> symbols = new ArrayList<>();

    //            POSITRON(url = "https://tiles.openfreemap.org/styles/positron"),
//            BRIGHT(url = "https://tiles.openfreemap.org/styles/bright"),
//            LIBERTY(url = "https://tiles.openfreemap.org/styles/liberty")
    private static final String STYLE_URL = "https://api.maptiler.com/maps/openstreetmap/style.json?key=r4ABTF9CyV2RaEe7M9C2";

    public EntitiesMapFragment() {
        // Required empty public constructor
    }

    private void findViews(View layout) {
        mapView = layout.findViewById(R.id.mapview);
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        MapLibre.getInstance(getContext());

        presenter = EntitiesPresenter.newInstance(this, getActivity());
        setBasePresenter(presenter);

        View layout = inflater.inflate(R.layout.fragment_entities_map, container, false);
        findViews(layout);

        return layout;
    }


    private void configureMap(List<Entity> entities) {

        mapView.getMapAsync(map -> {
            libreMap = map;
            map.setStyle(new Style.Builder().fromUri(STYLE_URL), style -> {

                Drawable drawable = ContextCompat.getDrawable(getContext(), R.drawable.ic_location);
                Bitmap bitmap = BitmapUtils.getBitmapFromDrawable(drawable);
                style.addImage("custom-marker", drawable);

                symbolManager = new SymbolManager(mapView, map, style);
                symbolManager.setIconAllowOverlap(true);
                symbolManager.setTextAllowOverlap(true);

                loadEntities(entities);

            });

            CameraPosition cameraPosition = CameraUpdateFactory
                    .newLatLngZoom(latLngStart, 12)
                    .getCameraPosition(map);
            map.setCameraPosition(cameraPosition);
        });

    }


    @Override
    public void showEntities(List<Entity> entities) {

        configureMap(entities);

    }

    private void loadEntities(List<Entity> entities) {

        symbolManager.delete(symbols);

        List<SymbolOptions> symbolOptionsList = new ArrayList<>();

        for (Entity entity : entities) {

            JsonObject jsonData = new JsonObject();
            jsonData.addProperty("id", entity.getId());

            SymbolOptions symbolOptions = new SymbolOptions()
//                    .withGeometry(Point.fromLngLat(entity.getLongitude(), entity.getLatitude()))
                    .withLatLng(new LatLng(entity.getLatitude(), entity.getLongitude()))
                    .withIconImage("custom-marker")
                    .withIconSize(1.5f)
                    .withTextField(entity.getName())
                    .withData(jsonData)
                    .withTextSize(14.0f)
                    .withTextOffset(new Float[]{0.0f, 1.3f}) // Offset del texto respecto al icono
                    .withTextAnchor("top")
                    .withTextColor("#0080D2")
                    .withTextHaloColor("white")
                    .withTextHaloWidth(2.0f);

            symbolOptionsList.add(symbolOptions);

        }

        symbols = symbolManager.create(symbolOptionsList);


        symbolManager.addClickListener(symbol -> {

//            libreMap.animateCamera(CameraUpdateFactory.newCameraPosition(
//                    new CameraPosition.Builder()
//                            .target(symbol.getLatLng())
//                            .build()
//            ));
//
            String id = symbol.getData().getAsJsonObject().get("id").getAsString();
            if (entityListener != null) {
                entityListener.onEntityClick(-1, id);
            }

            return true;
        });

    }

    public void setEntityListener(EntitiesPagerAdapter.EntityListener entityListener) {
        this.entityListener = entityListener;
    }

    public void onStart() {
        super.onStart();
        mapView.onStart();
    }

    public void onResume() {
        super.onResume();
        mapView.onResume();
    }

    public void onPause() {
        super.onPause();
        mapView.onPause();
    }

    public void onStop() {
        super.onStop();
        mapView.onStop();
    }

    public void onLowMemory() {
        super.onLowMemory();
        mapView.onLowMemory();
    }

    public void onDestroy() {
        super.onDestroy();
        mapView.onDestroy();
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        mapView.onSaveInstanceState(outState);
    }

}

