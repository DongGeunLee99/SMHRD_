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
	
	// 추상 메소드의 구현체를 만드는 역할은
	// spring container 안에 있는 mybatis 객체들이 구현체를 만들고, 연결해준다

	public List<Board> selectAll();	
	
	// mybatis 사용하는 3가지 방식
	// DAO클래스를 사용 -> xml 파일이랑 분리 -> mapping
	// interface를 사용 -> xml 파일이랑 분리 -> mapping
	// annotation을 사용
	
	// 비교적 간단한 구문일 때 사용
	@Select("select * from board where IDX=#{idx}")
	public Board selectOne(int idx);

    //@Update("UPDATE board SET count = count+1 WHERE IDX=#{idx}")
	@Update("UPDATE board SET count = #{cnt} WHERE IDX=#{idx}")
	public boolean countUp(int cnt, int idx);

	public List<Board> selectData(SearchCriteria criteria);

	public boolean upDate(Board board);

	@Delete("DELETE FROM BOARD WHERE IDX=#{idx}")
	public boolean del(int idx);	
}