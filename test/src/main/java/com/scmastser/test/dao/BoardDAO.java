package com.scmastser.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmastser.test.vo.Board;

@Repository
public class BoardDAO {

    public BoardMapper mapper;

    @Autowired
    SqlSession session;

    public int boardSave(Board board){
        mapper = session.getMapper(BoardMapper.class);
        int result = mapper.boardSave(board);
        return result;
    }

}
