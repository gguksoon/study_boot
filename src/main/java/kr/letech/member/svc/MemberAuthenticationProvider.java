package kr.letech.member.svc;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import kr.letech.member.vo.MemberVo;

public class MemberAuthenticationProvider implements AuthenticationProvider {

	private static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationProvider.class);
	
	@Autowired
	private MemberSVC memberSVC;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	
		logger.debug("*****MemberAuthenticationProvider 진입");
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		MemberVo member = (MemberVo) memberSVC.loadUserByUsername(username);
		
		if(!password.equals(member.getMem_pass())) {
			throw new BadCredentialsException(username);
		}
		
		if(!member.isEnabled()) {
			throw new BadCredentialsException(username);
		}
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("MEMBER"));
		if(member.getGrade() == 0) roles.add(new SimpleGrantedAuthority("ADMIN"));
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(username, password, roles);
		result.setDetails(member);
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
