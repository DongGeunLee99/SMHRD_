package kr.bigdata.web.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int idx;
	private String title;
	private String writer;
	private String content;
	private int count;
	private Date indate;

}
