package com.damtuh.mapper;

import com.damtuh.support.notice.vo.BoardAttachVO;
import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//@Mapper("SupportMapper")
public interface SupportMapper {

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

	public void deleteAttach(Long bno);

}
