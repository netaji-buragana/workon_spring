package com.netaji.config;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
@EnableWebSecurity
public class AppConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Bean
	public AuthenticationProvider authProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService);
		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance()); // this is for plain text
		// provider.setPasswordEncoder(new BCryptPasswordEncoder());//this is for BCrypt

		return provider;
	}

	/*
	 * @Bean SecurityWebFilterChain http(ServerHttpSecurity http) throws Exception {
	 * DelegatingServerLogoutHandler logoutHandler = new
	 * DelegatingServerLogoutHandler( new WebSessionServerLogoutHandler(), new
	 * SecurityContextServerLogoutHandler() );
	 * 
	 * http .authorizeExchange((exchange) -> exchange.anyExchange().authenticated())
	 * .logout((logout) -> logout.logoutHandler(logoutHandler));
	 * 
	 * return http.build(); }
	 * 
	 */

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().authorizeRequests().antMatchers("/login", "/register","/sendOtp", "/register", "/signUp","/forgotpassword","/sendOtp","/verifyOtp","/changePassword").permitAll()
		.anyRequest().authenticated()
	    .and()
	    .formLogin()
	    .loginPage("/login").permitAll().defaultSuccessUrl("/page")
	    .and()
	    .logout().invalidateHttpSession(true)
	    .clearAuthentication(true)
	    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	    .logoutSuccessUrl("/login").permitAll();
	}

	/*
	 * @Bean
	 * 
	 * @Override protected UserDetailsService userDetailsService() {
	 * 
	 * List<UserDetails> users=new ArrayList<>();
	 * users.add(User.withDefaultPasswordEncoder().username("netaji").password(
	 * "1234").roles("USER").build()); return new InMemoryUserDetailsManager(users);
	 * }
	 */
	
	
	
	
	
	
	
	
	
	
	

}
