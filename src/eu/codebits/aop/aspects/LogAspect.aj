package eu.codebits.aop.aspects;

import java.util.Arrays;

import android.app.Activity;
import android.util.Log;
import eu.codebits.aop.Utils;

public aspect LogAspect {

	public String ATAG = "LogAspect";

	String around() : call(String Utils.getURLasString(String)) {
		String result = proceed();
		Log.d(ATAG, "===============url=" + Arrays.toString(thisJoinPoint.getArgs()) + ", result = " + result);
		return result;
	}

	pointcut tolog1() : execution(* Activity+.*(..)) ;

	before() : tolog1() {
		String method = thisJoinPoint.getSignature().toShortString();
		Log.d(ATAG, "===============entering " + method + ",parms=" + Arrays.toString(thisJoinPoint.getArgs()));
	}

}