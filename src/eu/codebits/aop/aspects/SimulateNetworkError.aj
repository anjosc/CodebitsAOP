package eu.codebits.aop.aspects;

import java.io.IOException;

import eu.codebits.aop.Utils;

public aspect SimulateNetworkError {
	
//	before() throws IOException : call(* Utils.getURLasString(..)) {
//		throw new IOException("Simulated failure");
//	}

}
