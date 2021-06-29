package com.damtuh.support.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.damtuh.support.notice.dao.SupportDAO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService {

	private SupportDAO supportDao;
	

	@Override
	public List<NoticeBoardVO> getList(Criteria cri) {
		log.info("getList........");
		List<NoticeBoardVO> boardList = supportDao.view(cri);
		return boardList;
	}
	
	@Override
	public NoticeBoardVO get(Long bno) {
		log.info("read........");
		NoticeBoardVO board = supportDao.viewArticle(bno);
		board.setHits(supportDao.countHits(bno));
		return board;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get Total......");
		int count = supportDao.getTotal(cri); 
		System.out.println("service total" + count);
		return count;
	}

<<<<<<< HEAD
	@Override
	public void insert(NoticeBoardVO vo) {
		supportDao.insertNotice(vo);
	}

=======
>>>>>>> 9171caaede43bca28dce6d3fa4d511e24ad137e7

}
