package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoaordService{

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		
		//나중에 생성된 게시물의 번호를 확인
//		log.info("regiset...................."+board);
		mapper.insetSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
//		log.info("get.............");
		
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
//		log.info("modify.........."+board);
		
		
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
//		log.info("remove........."+bno);
		
		
		return mapper.delete(bno)==1;
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		
//		log.info("getList...............");
//		
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
//		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		
		
		
		return mapper.getTotalCount(cri);
	}

	
	
}