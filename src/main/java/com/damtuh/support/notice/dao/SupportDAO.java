package com.damtuh.support.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.BoardAttachVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface SupportDAO {
	public List<NoticeBoardVO> view(Criteria cri) throws DataAccessException;

	public NoticeBoardVO viewArticle(Long bno) throws DataAccessException;

	public int getTotal(Criteria cri) throws DataAccessException;

	public Long countHits(Long bno) throws DataAccessException;

	public void insertNotice(NoticeBoardVO vo) throws DataAccessException;

	public int updateNotice(NoticeBoardVO vo) throws DataAccessException;

	public void deleteNotice(Long bno) throws DataAccessException;

	public void insertAttach(BoardAttachVO attach) throws DataAccessException;

	public List<AttachFileDTO> findByBno(Long bno) throws DataAccessException;

	public void updateAttachFile(Long bno) throws DataAccessException;

	public void updateAttachNone(Long bno) throws DataAccessException;

	public void deleteAttach(Long bno) throws DataAccessException;
}
