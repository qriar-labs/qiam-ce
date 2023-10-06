package qriarlabs.keycloak.authenticator.gateway;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import qriarlabs.keycloak.authenticator.ApiSmsConstants;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;

/**
 * @author Edgar Silva - QriarLabs
 */
@Slf4j
public class ApiSmsServiceFactory {


	public static ApiSmsService get(Map<String, String> config) {

		String api_endpoint = config.getOrDefault(ApiSmsConstants.API_ENDPOINT, "");

		SmsMessage smsMessage = new SmsMessage();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		return (phoneNumber, message) ->
		{
			smsMessage.setMobile(phoneNumber);
			smsMessage.setTotp(message);
			smsMessage.setUsed(false);

			String jsonData = gson.toJson(smsMessage);



			log.warn("Sending to %s the data: %s", api_endpoint, jsonData);

			HttpUtils.sendHttpPostRequest(api_endpoint,jsonData);


			log.warn(String.format("***** SIMULATION MODE ***** Would send SMS to %s with text: %s", phoneNumber, message));
		};

	}

	}

