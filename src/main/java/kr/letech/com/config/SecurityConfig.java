package kr.letech.com.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import kr.letech.member.svc.MemberAuthenticationProvider;
import kr.letech.member.svc.MemberSVC;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
	
	@Autowired
	private MemberSVC memberSVC;
	
	@Bean
	public MemberAuthenticationProvider authenticationProvider() {
		MemberAuthenticationProvider authenticationProvider = new MemberAuthenticationProvider();
//		authenticationProvider.setUserDetailsService(memberSVC);
		return authenticationProvider;
	}
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		// 기본 메모리 내 인증 구성을 설정
//		auth.inMemoryAuthentication()
//				.withUser("mem_id").password("mem_pass").roles("MEMBER")
//			.and()
//				.withUser("mem_id").password("mem_pass").roles("MEMBER", "ADMIN");
//	}

	
	
	/*
		- anonymous(): 인증되지 않은 사용자가 접근할 수 있습니다.
		- authenticated(): 인증된 사용자만 접근할 수 있습니다.
		- fullyAuthenticated(): 완전히 인증된 사용자만 접근할 수 있습니다(?)
		- hasRole() or hasAnyRole(): 특정 권한을 가지는 사용자만 접근할 수 있습니다.
		- hasAuthority() or hasAnyAuthority(): 특정 권한을 가지는 사용자만 접근할 수 있습니다.
		- hasIpAddress(): 특정 아이피 주소를 가지는 사용자만 접근할 수 있습니다.
		- access(): SpEL 표현식에 의한 결과에 따라 접근할 수 있습니다.
		- not(): 접근 제한 기능을 해제합니다.
		- permitAll() or denyAll(): 접근을 전부 허용하거나 제한합니다.
		- rememberMe(): 리멤버 기능을 통해 로그인한 사용자만 접근할 수 있습니다.
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		logger.debug("********configure(web)");
		web.ignoring().antMatchers("/css/**", 
									"/Flattern/**",
									"/gentelella/**",
									"/js/**",
									"/login/**");
	}

	// http 보안
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 애플리케이션에 대한 모든 요청이 양식 기반 로그인 또는 HTTP 기본 인증으로 인증되도록 설정
		// The above default configuration makes sure any request to the application is authenticated with form based login or HTTP basic authentication.
//		http.authorizeRequests()
//				.anyRequest().authenticated()
//			.and().httpBasic();
		
		logger.debug("********configure(http)");
		http.authorizeRequests()
				.antMatchers("/manageBoard").hasRole("ADMIN")
//				.antMatchers("/myinfo").hasRole("MEMBER")
				.antMatchers("/**").permitAll()
//				.antMatchers("/login", "/").permitAll()
			.and()
				.formLogin()
//				.loginPage("/login")
//				.loginProcessingUrl("/loginProcessing")
				.defaultSuccessUrl("/postList/1/1")
				.usernameParameter("mem_id")
				.passwordParameter("mem_pass")
//				.permitAll()
			.and()
				.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/")
				.invalidateHttpSession(true);
//			.and() // 403 예외처리
//				.exceptionHandling().accessDeniedPage("/");
	}

	
}
