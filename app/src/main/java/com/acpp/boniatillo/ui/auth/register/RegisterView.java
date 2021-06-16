package com.acpp.boniatillo.ui.auth.register;

import com.acpp.boniatillo.base.BaseView;
import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Person;
import com.acpp.boniatillo.model.User;

/**
 * Created by julio on 16/02/18.
 */

public interface RegisterView extends BaseView {

    void showRegisterPerson();

    void showRegisterEntity();

    void setContinueRegisterEnable(boolean enable);

    void fillUserAuthData(User user);

    void fillPersonData(Person person);

    boolean fillEntityData(Entity entity);

    void showRegisterUserCommonData();
}
