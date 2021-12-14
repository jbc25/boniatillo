package com.acpp.boniatillo.ui.main;

import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import androidx.annotation.NonNull;

import com.acpp.boniatillo.BuildConfig;
import com.google.android.material.bottomnavigation.BottomNavigationItemView;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationView;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AlertDialog;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import com.acpp.boniatillo.App;
import com.acpp.boniatillo.DebugHelper;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.api.response.Data;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.base.BaseFragment;
import com.acpp.boniatillo.model.Notification;
import com.acpp.boniatillo.ui.auth.login.LoginActivity;
import com.acpp.boniatillo.ui.auth.register.RegisterActivity;
import com.acpp.boniatillo.ui.entities.EntitiesFragment;
import com.acpp.boniatillo.ui.info.WebViewActivity;
import com.acpp.boniatillo.ui.intro.IntroActivity;
import com.acpp.boniatillo.ui.novelties.list.NoveltiesFragment;
import com.acpp.boniatillo.ui.wallet.WalletFragment;
import com.acpp.boniatillo.ui.wallet.WalletPresenter;
import com.acpp.boniatillo.views.CircleTransform;
import com.acpp.boniatillo.views.custom_dialog.NewPaymentDialog;
import com.squareup.picasso.Picasso;

public class MainActivity extends BaseActivity implements BottomNavigationView.OnNavigationItemSelectedListener, View.OnClickListener, NavigationView.OnNavigationItemSelectedListener, MainView {


    private DrawerLayout drawerLayout;
    private TextView btnLogin;
    private TextView btnSignup;
    private BottomNavigationView bottomNavView;
    private TextView tvUserName;
    private View viewEnterButtons;
    private View btnLogout;
    private View viewUserInfo;
    private MainPresenter presenter;
    private ImageView imgAvatar;
    private TextView tvPendingPaymentsBadge;

    private void findViews() {


        bottomNavView = (BottomNavigationView) findViewById(R.id.navigation_bottom_view);
        bottomNavView.setOnNavigationItemSelectedListener(this);

        NavigationView navigationView = (NavigationView) findViewById(R.id.navigation_view);
        navigationView.setNavigationItemSelectedListener(this);

        btnLogin = (TextView) navigationView.getHeaderView(0).findViewById(R.id.btn_login);
        btnSignup = (TextView) navigationView.getHeaderView(0).findViewById(R.id.btn_singup);
        tvUserName = (TextView) navigationView.getHeaderView(0).findViewById(R.id.tv_user_name);
        viewEnterButtons = navigationView.getHeaderView(0).findViewById(R.id.view_enter_buttons);
        viewUserInfo = navigationView.getHeaderView(0).findViewById(R.id.view_user_info);
        btnLogout = navigationView.getHeaderView(0).findViewById(R.id.btn_logout);
        imgAvatar = (ImageView) navigationView.getHeaderView(0).findViewById(R.id.img_avatar);

        btnLogin.setOnClickListener(this);
        btnSignup.setOnClickListener(this);
        btnLogout.setOnClickListener(this);

        ((TextView)findViewById(R.id.tv_app_version)).setText("Version: " + BuildConfig.VERSION_NAME);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {

        presenter = MainPresenter.newInstance(this, this);
        setBasePresenter(presenter);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViews();
        configureToolbar();
        configureDrawerLayout();
        configureBottomNavView();


        if (DebugHelper.SHORTCUT_ACTIVITY != null) {
            startActivity(new Intent(this, DebugHelper.SHORTCUT_ACTIVITY));
            return;
        }

//        if (App.getUserData(this) == null) {
//            startActivity(new Intent(this, LoginActivity.class));
//            finish();
//            return;
//        }

        getFragmentManager().beginTransaction().replace(R.id.content, new EntitiesFragment()).commit();

        if (DebugHelper.SWITCH_SHOW_INTRO && !App.getPrefs(this).getBoolean(App.SHARED_INTRO_SEEN, false)) {
            startActivity(new Intent(this, IntroActivity.class));
            getPrefs().edit().putBoolean(App.SHARED_INTRO_SEEN, true).commit();
        }


        presenter.onCreate(getIntent());

//        showMockNotificationDialog();
    }

    private void showMockNotificationDialog() {

        Notification notification = new Notification();
        notification.setAmount(10f);
        notification.setSender("Pepa");
        notification.setTotal_amount(20f);
//        BonusDialog bonusDialog = BonusDialog.newInstance(notification);
//        bonusDialog.show(getSupportFragmentManager(), null);

        NewPaymentDialog.newInstance(notification).show(getFragmentManager(), null);
    }


    @Override
    protected void onResume() {
        super.onResume();
        if (DebugHelper.SHORTCUT_ACTIVITY != null) {
            DebugHelper.SHORTCUT_ACTIVITY = null;
            return;
        }
        presenter.onResume();
    }


    private void configureBottomNavView() {

        View v = bottomNavView.findViewById(R.id.navigation_wallet);
        BottomNavigationItemView itemView = (BottomNavigationItemView) v;

        View view = LayoutInflater.from(this)
                .inflate(R.layout.view_pending_payments_badge, bottomNavView, false);

        tvPendingPaymentsBadge = (TextView) view.findViewById(R.id.tv_number_pending_payments_main);
        itemView.addView(view);

//        showNewNewsMessage();
    }

    private void configureDrawerLayout() {

        drawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawerLayout, toolbar, R.string.open, R.string.close);
        drawerLayout.addDrawerListener(toggle);
        toggle.syncState();

//        drawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_LOCKED_CLOSED, Gravity.END);
//        toolbar.setNavigationIcon(null);
    }

//    public void toggleDrawerRight() {
//        if (drawerLayout.isDrawerOpen(Gravity.END)) {
//            drawerLayout.closeDrawer(Gravity.END);
//        } else {
//            drawerLayout.openDrawer(Gravity.END);
//        }
//    }


    @Override
    public void refreshData() {
        Fragment fragment = getFragmentManager().findFragmentById(R.id.content);
        if (fragment instanceof WalletFragment) {
            ((WalletPresenter)((WalletFragment)fragment).getBasePresenter()).refreshData();
        }

        presenter.refreshData();
    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {

        if (bottomNavView.getSelectedItemId() == item.getItemId()) {
            return false;
        }

        try {
            switch (item.getItemId()) {
                case R.id.navigation_entities:
                    setToolbarTitle(R.string.entities);
                    showSection(new EntitiesFragment());
                    return true;
                case R.id.navigation_wallet:
                    setToolbarTitle(R.string.wallet);
                    showSection(new WalletFragment());
                    return true;
                case R.id.navigation_profile:
                    setToolbarTitle(R.string.news);
                    showSection(new NoveltiesFragment());
                    return true;

                case R.id.menuItem_acpp:
                    WebViewActivity.startLocalHtml(this, getString(R.string.acpp), WebViewActivity.FILENAME_ACPP);
                    break;

                case R.id.menuItem_the_boniatillo:
                    WebViewActivity.startLocalHtml(this, getString(R.string.the_boniatillo), WebViewActivity.FILENAME_EL_BONIATILLO);
//                String url2 = "https://madrid.mercadosocial.net/reboniato/";
//                WebViewActivity.startRemoteUrl(this, getString(R.string.how_it_works), url2);
                    break;

                case R.id.nav_contact_email:
                    String email = "madrid@acpp.com";

                    Intent emailIntent = new Intent(Intent.ACTION_SENDTO, Uri.fromParts(
                            "mailto", email, null));
                    emailIntent.putExtra(Intent.EXTRA_SUBJECT, getString(R.string.email_contact_subject));
//                emailIntent.putExtra(Intent.EXTRA_TEXT, "Body");
                    startActivity(emailIntent);
                    break;

                case R.id.nav_contact_web:
                    String urlWeb = "https://www.acpp.com/";
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(urlWeb)));

//                String tokenFirebase = FirebaseInstanceId.getInstance().getToken();
//                alert(tokenFirebase);
                    break;

                case R.id.nav_contact_facebook:
                    String urlFacebook = "https://www.facebook.com/ACPPmadrid";
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(urlFacebook)));
                    break;

                case R.id.nav_contact_twitter:
                    String urlTwitter = "http://twitter.com/ACPPasamblea";
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(urlTwitter)));
                    break;

                case R.id.nav_contact_youtube:
                    String urlYoutube = "https://www.youtube.com/channel/UC4zUhc5NrJzugpYzDkNFrlw";
                    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(urlYoutube)));
                    break;
            }
        } catch (ActivityNotFoundException e) {
            toast(R.string.no_app_available);
        }

//        toast("Pulsado: " + item.getTitle());
        drawerLayout.closeDrawer(Gravity.LEFT);
        return false;
    }

    private void openIPDialog() {
        final EditText editText = new EditText(this);
        editText.setText("192.168.43.42:8000");

        new AlertDialog.Builder(this)
                .setView(editText)
                .setPositiveButton("Establecer IP", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        getPrefs().edit().putString("baseUrl", "http://" + editText.getText().toString()).commit();
                    }
                }).show();
    }

    private void showSection(BaseFragment fragment) {

        getFragmentManager().beginTransaction().setCustomAnimations(
                R.animator.fade_in, R.animator.fade_out)
                .replace(R.id.content, fragment)
                .commit();
    }


    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_login:

//                LoginDialog loginDialog = LoginDialog.newInstance();
//                loginDialog.configure(getString(R.string.enter), new LoginDialog.LoginDialogListener() {
//                    @Override
//                    public void onAccept(String username, String password) {
//                        toast("Entrando con: " + username + "...");
//                    }
//                });
//
//                loginDialog.setAvoidDismiss(true);
//                loginDialog.show(getSupportFragmentManager(), null);

                drawerLayout.closeDrawer(Gravity.LEFT);
                startActivity(new Intent(this, LoginActivity.class));

                break;

            case R.id.btn_singup:
                startActivity(new Intent(this, RegisterActivity.class));
                break;

            case R.id.btn_logout:
                presenter.onLogoutClick();
                break;
        }
    }

    @Override
    public void onBackPressed() {
        if (drawerLayout.isDrawerOpen(Gravity.LEFT)) {
            drawerLayout.closeDrawer(Gravity.LEFT);
        } else {
            super.onBackPressed();
        }
    }


    // PRESENTER CALLBACKS

    @Override
    public void showUserData(Data userData) {

        viewEnterButtons.setVisibility(userData == null ? View.VISIBLE : View.GONE);
        viewUserInfo.setVisibility(userData == null ? View.GONE : View.VISIBLE);

        if (userData != null) {
            tvUserName.setText(userData.getName());
            if (userData.getEntity() != null) {
                String logoUrl = userData.getEntity().getLogoThumbnail();
                Picasso.get()
                        .load(logoUrl)
//                        .placeholder(R.mipmap.ic_avatar)
                        .transform(new CircleTransform())
                        .error(R.mipmap.img_acpp_circle)
                        .into(imgAvatar);
            }
        } else {
//            imgAvatar.setImageResource(R.mipmap.ic_avatar);

            Fragment fragment = getFragmentManager().findFragmentById(R.id.content);
            if (fragment instanceof WalletFragment) {
                ((WalletPresenter)((WalletFragment)fragment).getBasePresenter()).refreshData();
            }
        }
    }

    @Override
    public void showPendingPaymentsNumber(int numberPendingPayments) {
        tvPendingPaymentsBadge.setText(String.valueOf(numberPendingPayments));
        tvPendingPaymentsBadge.setVisibility(numberPendingPayments > 0 ? View.VISIBLE : View.GONE);
    }
}
