package test;

import beans.Video_24_UserBean;

/**
 * TestBeanValidation is a simple program that we will use to instantiate a Video_24_UserBean
 * using a variety of test arguments to become reasonably certain our Video_24_UserBean.java
 * is validating correctly.
 * 
 * @author Ross Studtman
 *
 */
public class TestBeanValidation {

	public static void main(String[] args) {
	
		// Make a bean for testing
		Video_24_UserBean userBean = new Video_24_UserBean();
		
		userBean.setEmail("ross.studtman@y.com");
		userBean.setPassword("aA123");
		
		// Test validation
		if(userBean.validate()){
			System.out.println("Bean is valid.");
		}else{
			System.out.println(userBean.getErrorMessage());
		}

	}

}
