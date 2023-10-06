package qriarlabs.keycloak.authenticator.gateway;

import java.io.IOException;

/**
 * @author Edgar Silva - QriarLabs
 */
public interface ApiSmsService {

	void send(String phoneNumber, String message) throws IOException;

}
