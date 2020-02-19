package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoaordService {

	
	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
//	public List<BoardVO> getList();
	
	//페이징 추가 리스트
	public List<BoardVO> getList(Criteria cri);
	
	//전체데이터 개수 처리 
	public int getTotal(Criteria cri);
	
	
	
	
}
