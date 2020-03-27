package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.ReportVO;
import com.homa.domain.SearchCriteria;

@Repository
public class ReportDAOImpl implements ReportDAO {

	// 마이바티스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.homa.mappers.ReportMapper";

	// 목록
	@Override
	public List<ReportVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list", scri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace + ".listCount");
	}

	// 검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".countSearch", scri);
	}
	@Override
	public ReportVO read(int rp_num) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".read", rp_num);
	}

	@Override
	public void delete(int rp_num) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", rp_num);	
	}
	//글작성
	@Override
	public void regist(ReportVO vo) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".regist", vo);
	}
	
	//글수정
	@Override
	public void update(ReportVO vo) {
		// TODO Auto-generated method stub
		sql.selectOne(namespace + ".update", vo);
	}

	@Override
	   public void updateViewCnt(int fb_num) throws Exception {
	      // TODO Auto-generated method stub
	       sql.update(namespace + ".updateViewCnt", fb_num);
	   }
	
}
