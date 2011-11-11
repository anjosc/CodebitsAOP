package eu.codebits.aop.aspects;

import android.app.Activity;
import android.view.View;
import eu.codebits.aop.annotations.Background;
import eu.codebits.aop.annotations.UiThread;

privileged public aspect RunOnUiThread {

	pointcut uiOps() : execution (@UiThread void *.*(..))  ;
	pointcut viewOps() : call (void View+.*(..))  && withincode(@Background void *.*(..));

	void around(final Activity activity) : (uiOps() || viewOps()) && this(activity) {
		activity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				proceed(activity);
			}
		});
	}
	
}
