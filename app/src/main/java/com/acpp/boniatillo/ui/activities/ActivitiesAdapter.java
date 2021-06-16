package com.acpp.boniatillo.ui.activities;


import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.acpp.boniatillo.R;
import com.acpp.boniatillo.model.ActivityACPP;

import java.util.List;

public class ActivitiesAdapter extends RecyclerView.Adapter<ActivitiesAdapter.ViewHolder> {


    private List<ActivityACPP> activities;
    private Context context;
    private OnItemClickListener itemClickListener;


    public ActivitiesAdapter(Context context, List<ActivityACPP> activities) {
        this.context = context;
        this.activities = activities;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {

        View contactView = LayoutInflater.from(context).inflate(R.layout.row_activity, parent, false);

        // Return a new holder instance
        ViewHolder viewHolder = new ViewHolder(contactView);
        return viewHolder;
    }


    @Override
    public void onBindViewHolder(final ViewHolder holder, final int position2) {

        final ActivityACPP activity = getItemAtPosition(holder.getAdapterPosition());

        holder.tvActivityDay.setText(activity.getDayUserFormat());
        holder.tvActivityTimeSpent.setText(activity.getTimeSpentUserFormat());
        holder.tvActivityTime.setText(activity.getTimeUserFormat());
        holder.tvActivityTitle.setText(activity.getActivity().getName());

    }

    @Override
    public int getItemCount() {
        return activities.size();
    }

    public ActivityACPP getItemAtPosition(int position) {
        return activities.get(position);
    }

    public void updateData(List<ActivityACPP> activities) {
        this.activities = activities;
        notifyDataSetChanged();
    }


    public static class ViewHolder extends RecyclerView.ViewHolder {

        private final TextView tvActivityTime;
        public View rootView;
        private TextView tvActivityTitle;
        private TextView tvActivityDay;
        private TextView tvActivityTimeSpent;

        public ViewHolder(View itemView) {

            super(itemView);

            tvActivityTitle = (TextView)itemView.findViewById( R.id.tv_activity_title );
            tvActivityDay = (TextView)itemView.findViewById( R.id.tv_activity_day );
            tvActivityTimeSpent = (TextView)itemView.findViewById( R.id.tv_activity_time_spent );
            tvActivityTime = (TextView)itemView.findViewById( R.id.tv_activity_time );

            rootView = itemView;
        }

    }


    public void setOnItemClickListener(OnItemClickListener listener) {
        this.itemClickListener = listener;
    }

    public interface OnItemClickListener {
        void onItemClick(View view, int position);
    }
}


