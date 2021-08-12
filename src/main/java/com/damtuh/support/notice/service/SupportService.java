package com.damtuh.support.notice.service;

import java.util.List;

import com.damtuh.support.notice.vo.AttachFileDTO;
import com.damtuh.support.notice.vo.BoardAttachVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface SupportService {

	public NoticeBoardVO get(Long bno);

	public List<NoticeBoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

	public void insert(NoticeBoardVO vo);

	public int updateNotice(NoticeBoardVO vo);

	public void deleteNotice(Long bno);

	public List<AttachFileDTO> findByBno(Long bno);

	public void insertAttach(BoardAttachVO vo);

	public void updateAttachFile(Long bno);

	public void updateAttachNone(Long bno);

	public void deleteAttach(Long bno);

}
