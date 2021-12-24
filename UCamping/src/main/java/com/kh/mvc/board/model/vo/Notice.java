package com.kh.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	private int rowNum;	
	private int writerNo;
	private String writerId;
	private String title;	
	private String content;	
	private int readCount;	
	private String status;	
	private Date createDate;	
	private Date modifyDate;
}
