package eu.codebits.aop;

import org.json.JSONObject;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;
import eu.codebits.aop.annotations.Background;

public class Launcher extends Activity {

	static final String URL = "https://services.sapo.pt/Codebits/session/195";
	private TextView text;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.main);

		text = findById(android.R.id.text1);

		getTalkDescription();

	}

	@Background
	private void getTalkDescription() {
		JSONObject talk = new JSONObject(Utils.getURLasString(URL));
		text.setText(talk.optString("description"));
	}
	
}