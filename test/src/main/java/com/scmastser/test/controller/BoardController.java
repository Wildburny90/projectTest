package com.scmastser.test.controller;

import com.scmastser.test.dao.BoardDAO;
import com.scmastser.test.vo.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
@RestController
public class BoardController {

    @Autowired
    BoardDAO dao;

    @RequestMapping(value = "boardSave", method = RequestMethod.POST)
    public int boardSave(Board board){
        System.out.println(board);
        board.setMem_id("123");
        int result = dao.boardSave(board);
        System.out.println(result);
        return result;
    }

}
