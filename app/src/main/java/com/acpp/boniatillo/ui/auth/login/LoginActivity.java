package com.acpp.boniatillo.ui.auth.login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import com.acpp.boniatillo.DebugHelper;
import com.acpp.boniatillo.R;
import com.acpp.boniatillo.base.BaseActivity;
import com.acpp.boniatillo.ui.auth.register.RegisterActivity;

public class LoginActivity extends BaseActivity implements View.OnClickListener, LoginView {

    private EditText editUsername;
    private EditText editPassword;
    private View btnLogin;
    private LoginPresenter presenter;
    private View btnRememberPassword;
    private View btnRegister;

    private void findViews() {
        editUsername = (EditText)findViewById( R.id.edit_username );
        editPassword = (EditText)findViewById( R.id.edit_password );
        btnRememberPassword = findViewById(R.id.btn_remember_password);
        btnLogin = findViewById(R.id.btn_login);
        btnRegister = findViewById(R.id.btn_register);


        btnLogin.setOnClickListener(this);
        btnRememberPassword.setOnClickListener(this);
        btnRegister.setOnClickListener(this);
    }



    @Override
    public void onCreate(Bundle savedInstanceState) {
        presenter = LoginPresenter.newInstance(this, this);
        setBasePresenter(presenter);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        findViews();

        if (DebugHelper.MOCK_DATA) {
            editUsername.setText("juliotest");
            editPassword.setText("boniatos");
        }

    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_login:

                String username = editUsername.getText().toString();
                String password = editPassword.getText().toString();

                presenter.onLoginClick(username, password);
                break;

            case R.id.btn_remember_password:
                String username2 = editUsername.getText().toString();
                presenter.onRememberPasswordClick(username2);
                break;

            case R.id.btn_register:
                startActivity(new Intent(this, RegisterActivity.class));
                finish();
                overridePendingTransition(0, 0);
                break;

        }
    }

}
