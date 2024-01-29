package com.example.goormtask02;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class GoormTask02Application {

    public static void main(String[] args) {
        SpringApplication.run(GoormTask02Application.class, args);
    }

}
