package com.example.ExerciseAksel;

public class Birthday {
    private int ID;
    private int day;
    private String month;
    private int year;

    public Birthday(int ID, int day, String month, int year){
        this.ID = ID;
        this.day = day;
        this.month = month;
        this.year = year;
    }

    @Override
    public String toString() {
        return "Birthday{" +
                "ID=" + ID +
                ", day=" + day +
                ", month='" + month + '\'' +
                ", year=" + year +
                '}';
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
}
