package qriarlabs.keycloak.authenticator.gateway;

public class SmsMessage {
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String geTotp() {
		return totp;
	}

	public void setTotp(String otp) {
		this.totp = otp;
	}

	public Boolean getUsed() {
		return used;
	}

	public void setUsed(Boolean used) {
		this.used = used;
	}

	String mobile;
	String totp;
	Boolean used;

}
