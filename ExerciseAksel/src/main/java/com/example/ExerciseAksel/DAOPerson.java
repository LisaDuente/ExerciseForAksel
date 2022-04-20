package com.example.ExerciseAksel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Arrays;
import java.util.List;

@Repository
public class DAOPerson {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public DAOPerson(){
        this.jdbcTemplate = new JdbcTemplate();
    }

    public Person getPersonByName(String name, String surname){
        String query = "SELECT * FROM PersonData WHERE name = ? AND surname = ?;";
        Person person = this.jdbcTemplate.queryForObject(query, new RowMapper<Person>() {
            @Override
            public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
                Person innerPerson = new Person(
                        rs.getString("Name"),
                        rs.getString("surname"),
                        rs.getString("Street"),
                        rs.getString("PostalCode"),
                        rs.getString("City"),
                        rs.getString("Country"),
                        rs.getInt("day")+" "+rs.getString("Month")+" "+rs.getInt("Year")
                );
                return innerPerson;
            }
        },name,surname);

        return person;
    }

    public void insertPerson(String name, String surname, String street, String postCode, String city, String country, int bDay, int bMonth, int bYear ){
        String query = "{CALL AddPerson(?,?,?,?,?,?,?,?,?)}";
        List<SqlParameter> parameters = Arrays.asList(new SqlParameter(Types.NVARCHAR), new SqlParameter(Types.NVARCHAR),
                new SqlParameter(Types.NVARCHAR),new SqlParameter(Types.NVARCHAR),new SqlParameter(Types.NVARCHAR),
                new SqlParameter(Types.NVARCHAR),new SqlParameter(Types.INTEGER),new SqlParameter(Types.INTEGER),
                new SqlParameter(Types.INTEGER));

        jdbcTemplate.call(con -> {
            CallableStatement cs = con.prepareCall(query);
            cs.setString(1,name);
            cs.setString(2,surname);
            cs.setString(3,street);
            cs.setString(4,postCode);
            cs.setString(5,city);
            cs.setString(6,country);
            cs.setInt(7, bDay);
            cs.setInt(8,bMonth);
            cs.setInt(9,bYear);
            return cs;
        }, parameters);
    }
}
