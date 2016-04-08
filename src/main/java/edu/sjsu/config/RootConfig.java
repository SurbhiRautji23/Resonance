
package edu.sjsu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import edu.sjsu.helpers.EmailNotification;

@Configuration
@ComponentScan(basePackages = { "edu.sjsu" }, excludeFilters = {
		@Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class) })
@Import(JpaConfig.class)
public class RootConfig {
	
    @Bean
    public EmailNotification getEmailNotification(){
        return new EmailNotification();
    }

}