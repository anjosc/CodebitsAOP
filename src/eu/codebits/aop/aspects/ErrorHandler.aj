package eu.codebits.aop.aspects;

import android.app.Activity;
import android.widget.Toast;
import eu.codebits.aop.annotations.Background;

public aspect ErrorHandler {

	pointcut backgroundOps() : execution (@Background void *.*(..))  ;

	void around(final Activity activity): backgroundOps() && this (activity) {
		try {
			proceed(activity);
		} catch (Exception e) {
			activity.runOnUiThread(new Runnable() {
				
				@Override
				public void run() {
					Toast.makeText(activity, "Sorry, there was a problem", Toast.LENGTH_LONG).show();
				}
			});
		}
	}
	
	declare soft : Exception : backgroundOps() ;
}
