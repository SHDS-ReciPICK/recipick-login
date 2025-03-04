package kr.co.recipick.oauth;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.beans.factory.annotation.Autowired;

@Configuration
@EnableResourceServer
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {
    
    @Autowired
    private TokenStore tokenStore;
    
    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
        resources
            .resourceId("recipick-api")
            .tokenStore(tokenStore);
    }
    
    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
            .requestMatchers()
                .antMatchers("/api/**")
                .and()
            .authorizeRequests()
                .antMatchers("/api/userinfo").access("#oauth2.hasScope('read') or #oauth2.hasScope('profile')")
                .antMatchers("/api/orders/**").access("#oauth2.hasScope('purchase_history')")
                .anyRequest().authenticated();
    }
}