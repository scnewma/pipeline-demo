package org.scnewma.pipelinedemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class PipelineDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(PipelineDemoApplication.class, args);
	}

}
