package com.kh.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SaleBoard {
	private int no;
	
	private int rowNum;
	
	private int writerNo;
	
	private String writerId;
	
	private String title;
	
	private String price;
	
	private String category;
	
	private String content;
	
	private String fileName;
	
	private String fileSystemName;
	
	private String boardStatus;
	
	private String wishStatus;
	
	private String goodsStatus;
	
	private String dealStatus;
	
	private Date createDate;
	
}
