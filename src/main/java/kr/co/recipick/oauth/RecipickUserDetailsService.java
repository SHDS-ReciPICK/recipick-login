package kr.co.recipick.oauth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.recipick.member.MemberMapper;
import kr.co.recipick.member.MemberVO;

@Service
public class RecipickUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        MemberVO vo = new MemberVO();
        vo.setEmail(email);
        MemberVO member = memberMapper.login(vo);
        
        if (member == null) {
            throw new UsernameNotFoundException("User not found with email: " + email);
        }
        
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        if (member.getAdmin() != null && member.getAdmin().equals("Y")) {
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        } else {
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        }
        
        return new User(
            member.getEmail(),
            member.getPwd(),
            true, // enabled
            true, // accountNonExpired
            true, // credentialsNonExpired
            true, // accountNonLocked
            authorities
        );
    }
}