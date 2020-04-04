package com.project.mydoctor;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

//@Configurable
//@EnableWebSecurity
public class WebSecurityConfig  extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.out.println("실행됨");
	http.
	formLogin().loginPage("/login").defaultSuccessUrl("/main")
	.and()
	.logout().logoutUrl("/logout").logoutSuccessUrl("/main").invalidateHttpSession(true)
	.and().
	httpBasic();
	}

}
