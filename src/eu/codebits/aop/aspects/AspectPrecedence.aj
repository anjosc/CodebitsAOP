package eu.codebits.aop.aspects;

public aspect AspectPrecedence {

	declare precedence: RunInBackground, ShowProgress, ErrorHandler ; 
}
