package com.example.PersonDataExercise;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.bytebuddy.dynamic.loading.InjectionClassLoader;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Birthday {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    long id;

    //Foreign Key Constraints need Object as instance variables
    @OneToOne
    @JoinColumn(name = "days")
    private Days day;

    @OneToOne
    @JoinColumn(name= "id")
    private Month month;

    @OneToOne
    @JoinColumn(name= "year")
    private Year years;

}
