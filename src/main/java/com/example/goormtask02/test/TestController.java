package com.example.goormtask02.test;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping()
    public String getBoards() {
        return "board";
    }


}
