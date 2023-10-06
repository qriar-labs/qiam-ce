package qriarlabs.keycloak.authenticator.gateway;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.extern.slf4j.Slf4j;
import qriarlabs.keycloak.authenticator.ApiSmsConstants;

import java.util.Map;

/**
 * @author Edgar Silva - QriarLabs
 */
@Slf4j
public class VonageSmsServiceFactory {


	public static ApiSmsService get(Map<String, String> config) {

		String api_endpoint = config.getOrDefault(ApiSmsConstants.API_ENDPOINT, "");

		VonageSMS smsMessage = new VonageSMS();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		return (phoneNumber, message) ->
		{
			smsMessage.setTo(phoneNumber);
			smsMessage.setFrom("Skalena KC");
			smsMessage.setText(message);

			String jsonData = gson.toJson(smsMessage);

			log.warn("Sending to %s the data: %s", api_endpoint, jsonData);

			HttpUtils.sendHttpPostRequest(api_endpoint,jsonData);

			log.warn(String.format("***** SIMULATION MODE ***** Would send SMS to %s with text: %s", phoneNumber, message));
		};

	}

	}


