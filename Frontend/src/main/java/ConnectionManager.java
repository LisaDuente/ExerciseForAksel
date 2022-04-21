import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ConnectionManager {

    private HttpURLConnection connection;

    public ConnectionManager(){

    }

    public String getPerson(String name, String surname){
        String responseString = "";
        try {
            URL url = new URL("http://localhost:8080/getPerson?name=" + name+"&surname=" + surname);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setReadTimeout(5000);
            connection.setConnectTimeout(5000);

            int status = connection.getResponseCode();
            if (status < 300){
                String line;
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                while ((line = reader.readLine()) != null){
                    responseString += line;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseString;
    }

    public String insertPerson(String params){
        String responseString = "";
        try {
            URL url = new URL("http://localhost:8080/insertPerson?parameters="+params);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setReadTimeout(5000);
            connection.setConnectTimeout(5000);
            connection.setDoOutput(true);

            int status = connection.getResponseCode();
            if (status < 300) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String line = "";
                while ((line = reader.readLine()) != null) {
                    responseString = responseString + line;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseString;
    }
}
