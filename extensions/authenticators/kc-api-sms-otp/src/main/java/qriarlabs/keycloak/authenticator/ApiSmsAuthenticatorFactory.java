package qriarlabs.keycloak.authenticator;

import com.google.auto.service.AutoService;
import org.keycloak.Config;
import org.keycloak.authentication.Authenticator;
import org.keycloak.authentication.AuthenticatorFactory;
import org.keycloak.models.AuthenticationExecutionModel;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.provider.ProviderConfigProperty;

import java.util.List;

/**
 * @author Edgar Silva - QriarLabs
 */
@AutoService(AuthenticatorFactory.class)
public class ApiSmsAuthenticatorFactory implements AuthenticatorFactory {

	public static final String PROVIDER_ID = "api-sms-authenticator";

	private static final ApiSmsAuthenticator SINGLETON = new ApiSmsAuthenticator();

	@Override
	public String getId() {
		return PROVIDER_ID;
	}

	@Override
	public String getDisplayType() {
		return "API SMS Authentication";
	}

	@Override
	public String getHelpText() {
		return "[API Based ] Validates an OTP sent via SMS to the users mobile phone.";
	}

	@Override
	public String getReferenceCategory() {
		return "otp";
	}

	@Override
	public boolean isConfigurable() {
		return true;
	}

	@Override
	public boolean isUserSetupAllowed() {
		return true;
	}

	@Override
	public AuthenticationExecutionModel.Requirement[] getRequirementChoices() {
		return REQUIREMENT_CHOICES;
	}

	@Override
	public List<ProviderConfigProperty> getConfigProperties() {
		return List.of(
			new ProviderConfigProperty(ApiSmsConstants.CODE_LENGTH, "Code length", "The number of digits of the generated code.", ProviderConfigProperty.STRING_TYPE, 6),
			new ProviderConfigProperty(ApiSmsConstants.CODE_TTL, "Time-to-live", "The time to live in seconds for the code to be valid.", ProviderConfigProperty.STRING_TYPE, "300"),
			new ProviderConfigProperty(ApiSmsConstants.SENDER_ID, "SenderId", "The sender ID is displayed as the message sender on the receiving device.", ProviderConfigProperty.STRING_TYPE, "Skalena"),
			new ProviderConfigProperty(ApiSmsConstants.SIMULATION_MODE, "Simulation mode", "In simulation mode, the SMS won't be sent, but printed to the server logs", ProviderConfigProperty.BOOLEAN_TYPE, true),
			new ProviderConfigProperty(ApiSmsConstants.API_ENDPOINT, "SMS API Endpoint", "The complete HTTP POST API Endpoint for sending the SMS Message", ProviderConfigProperty.STRING_TYPE, "http://localhost:3412/api/sms")

		);
	}

	@Override
	public Authenticator create(KeycloakSession session) {
		return SINGLETON;
	}

	@Override
	public void init(Config.Scope config) {
	}

	@Override
	public void postInit(KeycloakSessionFactory factory) {
	}

	@Override
	public void close() {
	}

}
