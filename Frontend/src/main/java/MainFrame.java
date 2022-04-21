import com.google.gson.Gson;

import javax.swing.*;
import java.awt.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class MainFrame extends JFrame{

    private ConnectionManager connector = new ConnectionManager();

    private JPanel mainPanel;

    private JTextField insertName;
    private JTextField insertStreet;
    private JTextField insertPostCode;
    private JTextField insertCity;
    private JTextField insertCountry;
    private JTextField insertSearch;
    private JTextField insertBDay;

    private JComboBox<Integer> day;
    private JComboBox<String> month;
    private JComboBox<Integer> year;

    private JButton enter;
    private JButton search;

    private JLabel message;

    public MainFrame(){
        this.setSize(600,600);

        //INITIALIZE
        this.mainPanel = new JPanel(new GridLayout(9,2));
        JLabel name = new JLabel("Name:");
        this.insertName = new JTextField();
        JLabel street = new JLabel("Street:");
        this.insertStreet = new JTextField();
        JLabel city = new JLabel("City:");
        this.insertCity = new JTextField();
        JLabel postCode = new JLabel("PostCode:");
        this.insertPostCode = new JTextField();
        JLabel country = new JLabel("Country:");
        this.insertCountry = new JTextField();
        JLabel searchLabel = new JLabel("Search a person:");
        this.insertSearch = new JTextField();
        JLabel bDay = new JLabel("Birthday");
        this.insertBDay = new JTextField();

        this.enter = new JButton("Enter");
        this.search = new JButton("Search");

        this.message = new JLabel("TEst");


        //SIZES AND BOUNDS
        this.mainPanel.setSize(new Dimension(600,500));
        this.mainPanel.setVisible(true);
        this.mainPanel.add(name);
        this.mainPanel.add(this.insertName);
        this.mainPanel.add(street);
        this.mainPanel.add(this.insertStreet);
        this.mainPanel.add(city);
        this.mainPanel.add(this.insertCity);
        this.mainPanel.add(postCode);
        this.mainPanel.add(this.insertPostCode);
        this.mainPanel.add(country);
        this.mainPanel.add(this.insertCountry);
        this.mainPanel.add(bDay);
        this.mainPanel.add(this.insertBDay);
        this.mainPanel.add(this.enter);
        this.mainPanel.add(this.search);
        this.mainPanel.add(searchLabel);
        this.mainPanel.add(this.insertSearch);
        this.mainPanel.add(this.message);

        //ACTION LISTENER
        this.enter.addActionListener((e)->{
            String parameters = this.insertName.getText()+","+
                                this.insertStreet.getText()+","+
                                this.insertPostCode.getText()+","+
                                this.insertCity.getText()+","+
                                this.insertCountry.getText()+","+
                                this.insertBDay.getText();

            connector.insertPerson(encodeToURL(parameters));
            this.message.setText("You inserted:"+this.insertName.getText());
            this.insertName.setText("");
            this.insertStreet.setText("");
            this.insertPostCode.setText("");
            this.insertCity.setText("");
            this.insertCountry.setText("");
            this.insertBDay.setText("");

        });

        this.search.addActionListener((e)-> {
            String[] temp = this.insertSearch.getText().split(" ");
            String jsonPerson = connector.getPerson(temp[0], temp[1]);
            Gson gson = new Gson();
            Person person = gson.fromJson(jsonPerson,Person.class);

            System.out.println(jsonPerson);
            this.message.setText(person.getStreet()+" "+person.getPostCode()+" "+person.getCity());
        });

        this.add(this.mainPanel, BorderLayout.CENTER);

        this.setLayout(new BorderLayout());
        this.setVisible(true);
    }

    public static String encodeToURL(String inputString) {
        String encodedString = URLEncoder.encode(inputString, StandardCharsets.UTF_8);
        return encodedString;
    }


}
