package com.damtuh.support.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damtuh.support.notice.dao.SupportDAO;
import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SupportServiceImpl implements SupportService {

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

	@Transactional
	@Override
	public void insert(NoticeBoardVO vo) {
		supportDao.insertNotice(vo);
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		log.info(vo.getBno());
		
		vo.getAttachList().forEach(attach -> {
			attach.setBno(vo.getBno());
			supportDao.insertAttach(attach);
		});
	}

	@Override
	public void updateNotice(NoticeBoardVO vo) {
		supportDao.updateNotice(vo);
	}
	
	@Override
	public void deleteNotice(Long bno) {
		supportDao.deleteNotice(bno);
	}

	@Override
	public List<AttachFileDTO> findByBno(Long bno) {
		return supportDao.findByBno(bno);
	}


}
