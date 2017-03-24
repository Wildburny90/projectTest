package com.scmastser.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

    @RequestMapping(value = "boardWrite", method = RequestMethod.GET)
    public String boardWrite(){
        return "boardWrite";
    }
}
