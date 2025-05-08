package kr.bigdata.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.bigdata.web.entity.Board;
import kr.bigdata.web.entity.SearchCriteria;

@Mapper
public interface BoardMapper {
	
	public List<Board> selectAll();	
	
	@Select("select * from board where IDX=#{idx}")
	public Board selectOne(int idx);

	@Update("UPDATE board SET count = #{cnt} WHERE IDX=#{idx}")
	public boolean countUp(int cnt, int idx);

	public List<Board> selectData(SearchCriteria criteria);

	public boolean upDate(Board board);

	@Delete("DELETE FROM BOARD WHERE IDX=#{idx}")
	public boolean del(int idx);	
}