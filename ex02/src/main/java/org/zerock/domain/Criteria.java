package org.zerock.domain;

import lombok.Data;

@Data
public class Criteria {
	//검색의 기준을 의미

	private int pageNum; //페이지번호 
	private int amount;	//한페이지당 몇개의 데이터 
	
	
	public Criteria () {
		//기본생성자 1페이지 10개 지정 
		
		this(1,10);
		
	}
	
	
	public Criteria (int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	
	
}
