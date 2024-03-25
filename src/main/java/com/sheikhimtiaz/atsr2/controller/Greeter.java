package com.sheikhimtiaz.atsr2.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Greeter {
    @GetMapping(value ="/greet")
    public String index() {
        return "Hello world! test build on new commit/push";
    }
}
