package com.damtuh.support.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface SupportDAO {
	public List<NoticeBoardVO> view(Criteria cri) throws DataAccessException;
	
	public NoticeBoardVO viewArticle(Long bno) throws DataAccessException;
	
	public int getTotal(Criteria cri) throws DataAccessException;
	
	public Long countHits(Long bno);
}
