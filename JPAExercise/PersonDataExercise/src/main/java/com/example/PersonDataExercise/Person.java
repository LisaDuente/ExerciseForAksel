package com.example.PersonDataExercise;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    long ID;
    String firstName;
    String surName;
    //same could be possible for adress but I dont want to
    String Adress;

    //check on those relations to get a better understanding
    @OneToOne
    @JoinColumn(name= "id")
    private Birthday birthday;

    @Override
    public String toString() {
        return "Person{" +
                "ID=" + ID +
                ", firstName='" + firstName + '\'' +
                ", surName='" + surName + '\'' +
                ", Adress='" + Adress + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
