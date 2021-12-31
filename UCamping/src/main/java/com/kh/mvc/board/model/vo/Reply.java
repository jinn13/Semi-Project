package com.kh.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	private int no;
	
	private int saleNo;
	
	private int writerNo;
	
	private String writerId;
	
	private String content;	
	
	private Date createDate;
	
	private Date modifyDate;

}
