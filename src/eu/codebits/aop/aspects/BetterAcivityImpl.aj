package eu.codebits.aop.aspects;

import android.app.Activity;
import eu.codebits.aop.BetterActivityIf;
import eu.codebits.aop.Launcher;

public aspect BetterAcivityImpl {
	
	declare parents : Launcher implements BetterActivityIf;

	<T> T BetterActivityIf.findById(int id) {
		Activity a = (Activity) this;
		return (T)  a.findViewById(id);
	}

}
