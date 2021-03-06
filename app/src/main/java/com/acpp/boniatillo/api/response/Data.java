package com.acpp.boniatillo.api.response;

import com.acpp.boniatillo.model.Entity;
import com.acpp.boniatillo.model.Person;

/**
 * Created by julio on 1/02/18.
 */

public class Data {

    private String api_key;
    private Entity entity;
    private Person person;
    private String type; // person or entity. not necessary with previous fields (one of them always is null)


    // ---
    private String username;

    public String getName() {
        if (entity != null) {
            return entity.getName();
        } else {
            return person.getName();
        }
    }


    public String getApiKeyFull() {
        return "ApiKey " + getUsername() + ":" + getApi_key();
    }

    public boolean isEntity() {
        return type != null && type.equals("entity");
    }

    public String getApi_key() {
        return api_key;
    }

    public void setApi_key(String api_key) {
        this.api_key = api_key;
    }

    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
        this.entity = entity;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
