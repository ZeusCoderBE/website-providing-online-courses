package vn.iotstar.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

@Configuration
public class ConfigUpLoadFile {

	  @Bean(name = "multipartResolver")
	    public StandardServletMultipartResolver multipartResolver() {
	        return new StandardServletMultipartResolver();
	    }
}
