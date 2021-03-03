package com.damtuh.support.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.damtuh.mapper.SupportMapper;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

@Repository("SupportDAO")
@Transactional(propagation = Propagation.REQUIRED)
public class SupportDAOImpl implements SupportDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private SupportMapper mapper;
	
	@Override
	public List<NoticeBoardVO> view(Criteria cri) throws DataAccessException {
		List<NoticeBoardVO> boardList = sqlSession.selectList("com.damtuh.mapper.SupportMapper.getListWithPaging", cri);
		return boardList;
	}

	@Override
	public NoticeBoardVO viewArticle(Long bno) throws DataAccessException {
		NoticeBoardVO board = sqlSession.selectOne("com.damtuh.mapper.SupportMapper.read", bno);
		return board;
	}

	@Override
	public int getTotal(Criteria cri) throws DataAccessException {
		int count = sqlSession.selectOne("com.damtuh.mapper.SupportMapper.getTotalCount", cri);
		System.out.println("count : " + count);
		return count;
	}

	@Override
	public Long countHits(Long bno) {
		Long hits = sqlSession.selectOne("com.damtuh.mapper.SupportMapper.getCount", bno);
		return hits;
	}

}
