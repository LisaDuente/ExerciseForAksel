package com.example.PersonDataExercise;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BirthdayRepository extends JpaRepository<Birthday, Long> {

    public List<Birthday> findBirthdayById(long id);

}
