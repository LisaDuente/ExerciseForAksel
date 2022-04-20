package com.example.ExerciseAksel;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicePerson {

    @Autowired
    DAOPerson daoPerson;

    public ServicePerson(){
        this.daoPerson = new DAOPerson();
    }

    public void insertPerson(String name, String surname, String street, String postCode, String city, String country,
                             int bDay, int bMonth, int bYear){
        this.daoPerson.insertPerson(name,surname,street,postCode,city,country,bDay,bMonth,bYear);
    }

    public String getPerson(String name, String surname){
        Gson gson = new Gson();
        Person person = this.daoPerson.getPersonByName(name, surname);
        String jsonPerson = gson.toJson(person);
        return jsonPerson;
    }
}
