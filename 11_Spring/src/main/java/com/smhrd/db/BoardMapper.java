package com.smhrd.db;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.model.BoardDTO;

@Mapper
public interface BoardMapper {
	public void insert(BoardDTO dto);
	
	public ArrayList<BoardDTO> boardSelect();

	public BoardDTO detail(int num);

	public void delete(int num);
}
