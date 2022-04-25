package com.example.PersonDataExercise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface PersonRepository extends JpaRepository<Person, Long> {

    //this is how to reference a stored procedure that is not defined in the entity in java
    @Procedure("insertPerson")
    public void addPerson(String name, String surName, String Address, long BDay, long BMonth, long BYear);

    public Collection<Person> findPersonBySurNameAndFirstName(String surname, String name);

    public List<Person> findPersonBySurName(String surname);



}
