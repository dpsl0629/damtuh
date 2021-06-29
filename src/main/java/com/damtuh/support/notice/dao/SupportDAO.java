package com.damtuh.support.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface SupportDAO {
	public List<NoticeBoardVO> view(Criteria cri) throws DataAccessException;
	
	public NoticeBoardVO viewArticle(Long bno) throws DataAccessException;
	
	public int getTotal(Criteria cri) throws DataAccessException;
	
<<<<<<< HEAD
	public Long countHits(Long bno) throws DataAccessException;
	
	public void insertNotice(NoticeBoardVO vo) throws DataAccessException;
=======
	public Long countHits(Long bno);
>>>>>>> 9171caaede43bca28dce6d3fa4d511e24ad137e7
}
