package com.damtuh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.damtuh.support.notice.vo.Criteria;
import com.damtuh.support.notice.vo.NoticeBoardVO;



public interface SupportMapper {

	//@Select("select * from tbl_notice where bno > 0")
	public List<NoticeBoardVO> getList();
	
	public void insert(NoticeBoardVO board);
	
	public NoticeBoardVO read(Long bno);
	
	public List<NoticeBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
