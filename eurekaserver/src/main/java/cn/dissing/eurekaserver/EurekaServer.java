package cn.dissing.eurekaserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * Hello world!
 *
 */
@SpringBootApplication
@EnableEurekaServer
@EnableAutoConfiguration
public class EurekaServer
{
    public static void main( String[] args )
    {
        SpringApplication.run(EurekaServer.class);
    }
}
