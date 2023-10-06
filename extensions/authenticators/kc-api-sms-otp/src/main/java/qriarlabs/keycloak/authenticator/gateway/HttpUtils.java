package qriarlabs.keycloak.authenticator.gateway;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpUtils {

	public static String sendHttpPostRequest(String apiUrl, String jsonData) throws IOException {
		URL url = new URL(apiUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		// Set the necessary HTTP headers
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Content-Type", "application/json");
		connection.setRequestProperty("Accept", "application/json");

		// Enable the output stream to send data
		connection.setDoOutput(true);

		// Write the JSON data to the request body
		try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
			outputStream.writeBytes(jsonData);
			outputStream.flush();
		}

		// Get the HTTP response code
		int responseCode = connection.getResponseCode();

		// Read the response body
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			StringBuilder response = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			return response.toString();
		} finally {
			connection.disconnect();
		}
	}

	public static void main(String[] args) {

		SmsMessage msg = new SmsMessage();
		msg.setMobile("+5511966191717");
		msg.setTotp("32232");
		msg.setUsed(false);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		try {
			String apiUrl = "http://localhost:3412/api/sms";
			String jsonData = gson.toJson(msg);
			String response = sendHttpPostRequest(apiUrl, jsonData);
			System.out.println("Response: " + response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
