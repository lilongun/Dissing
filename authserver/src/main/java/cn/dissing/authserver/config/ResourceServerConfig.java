package cn.dissing.authserver.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by lilongyun on 2018/5/10.
 */
@Configuration
@EnableResourceServer
public class ResourceServerConfig extends ResourceServerConfigurerAdapter{
    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .exceptionHandling()
                .authenticationEntryPoint((request, response, authException) -> response.sendError(HttpServletResponse.SC_UNAUTHORIZED))
                .and()
                .authorizeRequests().antMatchers("/registerUser").permitAll()
                .antMatchers("/currentUser").permitAll()
                .antMatchers("/getPostUserName").permitAll()
                .antMatchers("/getCommentUserName").permitAll()
                .antMatchers("/getUserInfoById/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .httpBasic();
    }
}
