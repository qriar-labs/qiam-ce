package qriarlabs.keycloak.authenticator.gateway;

import java.util.Objects;

public class VonageSMS {
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	private String from;
	private String to;
	private String text;

	@Override
	public String toString() {
		return "VonageSMS{" +
			"from='" + from + '\'' +
			", to='" + to + '\'' +
			", text='" + text + '\'' +
			'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		VonageSMS vonageSMS = (VonageSMS) o;
		return Objects.equals(from, vonageSMS.from) && Objects.equals(to, vonageSMS.to) && Objects.equals(text, vonageSMS.text);
	}

	@Override
	public int hashCode() {
		return Objects.hash(from, to, text);
	}
}
