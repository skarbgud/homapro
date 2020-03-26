package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.Criteria;
import com.homa.domain.NoticeVO;
import com.homa.domain.SearchCriteria;
@Repository
public class NoticeDAOImpl implements NoticeDAO {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.noticeMapper";
	
	@Override
	public void write(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".write",vo);
	}

	@Override
	public NoticeVO read(int no_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".read",no_num);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.selectOne(namespace+".update",vo);
	}

	@Override
	public void delete(int no_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace+".delete",no_num);
	}

	@Override
	public List<NoticeVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
	}

	@Override
	public List<NoticeVO> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listPage",cri);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".listCount");
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listSearch",scri);
	}

	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".countSearch",scri );
	}

}
