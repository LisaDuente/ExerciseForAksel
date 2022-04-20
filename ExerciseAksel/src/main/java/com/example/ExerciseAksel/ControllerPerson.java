package com.example.ExerciseAksel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ControllerPerson {

    @Autowired
    ServicePerson personService;

    public ControllerPerson(){
        this.personService = new ServicePerson();
    }

    @GetMapping("/getPerson")
    public String getPerson(@RequestParam(value = "name") String name, @RequestParam(value = "surname") String surname){
        return personService.getPerson(name,surname);
    }

    @PostMapping("/insertPerson")
    public void insertPerson(@RequestParam(value = "parameters") String csvString){
        String[] split = csvString.split(",");
        this.personService.insertPerson(split[0],split[1],split[2],split[3],split[4],split[5],Integer.parseInt(split[6]),
                Integer.parseInt(split[7]),Integer.parseInt(split[8]));
    }
}
