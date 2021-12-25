package com.kh.mvc.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionBoard {
	private int otoNo;
	
	private int rowNum;	
	
	private int writerNo;
	
	private String writerId;
	
	private String otoTitle;
	
	private int readCount;

	private String otoContent;
	
	private String otoFilename;

	private String otoStatus;
	
	private Date otoDate;
	
	private String renamedFileName;	

}
