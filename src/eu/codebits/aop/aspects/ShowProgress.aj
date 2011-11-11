package eu.codebits.aop.aspects;

import android.app.Activity;
import android.view.Window;
import eu.codebits.aop.annotations.Background;

public aspect ShowProgress {

	before(Activity activity): call(* Activity+.setContentView(..)) && this(activity) {
		activity.requestWindowFeature(Window.FEATURE_INDETERMINATE_PROGRESS);
	}

	void around(final Activity activity) : execution(@Background void *.*(..)) && this (activity) {
		setProgress(activity,true);
		proceed(activity);
		setProgress(activity,false);
	}

	void setProgress(final Activity activity, final boolean show) {
		activity.runOnUiThread(new Runnable() {
			@Override
			public void run() {
				activity.setProgressBarIndeterminateVisibility(show);
			}
		});
	}

}
