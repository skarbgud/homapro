package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.Criteria;
import com.homa.domain.NoticeVO;
import com.homa.domain.SearchCriteria;

import com.homa.persistence.UserNoticeDAO;
@Repository
public class UserNoticeServiceImpl implements UserNoticeService{
	@Inject
	private UserNoticeDAO dao;
	
	@Override
	public NoticeVO read(int no_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(no_num);
	}

	
	
	@Override
	public List<NoticeVO> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listPage(cri);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(scri);
	}

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearch(scri);
	}

}
