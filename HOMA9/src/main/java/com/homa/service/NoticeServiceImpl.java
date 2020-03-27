package com.homa.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.homa.domain.Criteria;
import com.homa.domain.NoticeVO;
import com.homa.domain.SearchCriteria;
import com.homa.persistence.NoticeDAO;
@Repository
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;
	
	@Override
	public void write(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public NoticeVO read(int no_num) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(no_num);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int no_num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(no_num);
	}

	@Override
	public List<NoticeVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
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
