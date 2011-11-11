package eu.codebits.aop.aspects;

import java.io.PrintStream;

public aspect LogEnforce {
	declare warning : 
	    call ( * PrintStream.*(..) ) 
	    || ( call ( * android.util.Log.*(..)) && !within (pt.sapo.sapokit.common.Log) ) 
	    || call ( * java.lang.Throwable+.printStackTrace() ) 
	     : "You should use Sapokit Log" ;
}