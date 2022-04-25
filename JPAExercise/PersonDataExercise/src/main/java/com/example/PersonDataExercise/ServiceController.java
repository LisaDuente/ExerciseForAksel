package com.example.PersonDataExercise;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;

@CrossOrigin
@RestController
public class ServiceController {

    @Autowired
    private PersonRepository personRepo;

    @Autowired
    private BirthdayRepository birthRepo;

    @GetMapping("/test")
    public String getPersonByName(@RequestParam(value = "name", defaultValue = "Lisa") String name, @RequestParam(value = "surname", defaultValue = "Duente") String surname){
        Collection<Person> person = personRepo.findPersonBySurNameAndFirstName(surname, name);
        System.out.print(person.toString());
        Gson gson = new Gson();
        String json = gson.toJson(person);
        return person.toString();
    }

    @GetMapping("/person/{surName}")
    public String getPersonBySurName(@PathVariable String surName) {
        Gson gson = new Gson();
        String json = gson.toJson(personRepo.findPersonBySurName(surName));
        System.out.println(json);
        return json;
    }

    @GetMapping("/birthday/{id}")
    public String getBirthdayById(@PathVariable long id){
        Gson gson = new Gson();
        String json = gson.toJson(birthRepo.findBirthdayById(id));
        return json;
    }
}
