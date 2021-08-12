package com.damtuh.mapper;

import java.util.List;

import com.damtuh.support.notice.vo.BoardAttachVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;

public interface SupportMapper {

	//@Select("select * from tbl_notice where bno > 0")
	public List<NoticeBoardVO> getList();
	
	public void insert(NoticeBoardVO board);
	
	public NoticeBoardVO read(Long bno);
	
	public List<NoticeBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void updateNotice(NoticeBoardVO vo);
	
	public void deleteNotice(Long bno);
	
	public void insertAttach(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);
	
	public void updateAttach1(Long bno);
	
	public void updateAttach2(Long bno);
	
	public void deleteAttach(Long bno);
	
}
