package com.damtuh.support.notice.service;

import java.util.List;

import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface NoticeBoardService {

	public NoticeBoardVO get(Long bno);
	
	public List<NoticeBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
<<<<<<< HEAD
	
	public void insert(NoticeBoardVO vo);
=======
>>>>>>> 9171caaede43bca28dce6d3fa4d511e24ad137e7
}
