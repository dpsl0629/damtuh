package com.damtuh.support.notice.service;

import java.util.List;

import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface NoticeBoardService {

	public NoticeBoardVO get(Long bno);
	
	public List<NoticeBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
