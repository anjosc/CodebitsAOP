package eu.codebits.aop.aspects;

import android.app.Activity;
import eu.codebits.aop.annotations.Background;

privileged public aspect RunInBackground {

	pointcut backgroundOps() : execution (@Background void *.*(..))  ;

	void around(final Activity activity) : backgroundOps() && this(activity){
		new Thread() {
			public void run() {
				proceed(activity);
			}
		}.start();
	}

}