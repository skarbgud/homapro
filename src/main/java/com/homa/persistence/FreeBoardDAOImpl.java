package com.homa.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.Criteria;
import com.homa.domain.FreeBoardVO;
import com.homa.domain.SearchCriteria;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	// 마이바티스
	@Inject
	private SqlSession sql;

	// 매퍼
	private static String namespace = "com.homa.mappers.freeBoardMapper";

	// 작성
	@Override
	public void write(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}

	// 조회
	@Override
	public FreeBoardVO read(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".read", fb_num);
	}

	// 수정
	@Override
	public void update(FreeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.selectOne(namespace + ".update", vo);
	}

	// 삭제
	@Override
	public void delete(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", fb_num);
	}

	// 목록
	@Override
	public List<FreeBoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}

	// 목록+페이징
	@Override
	public List<FreeBoardVO> listPage(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".listPage", cri);
	}

	// 게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace + ".listCount");
	}

	// 목록 + 페이징 + 검색
	@Override
	public List<FreeBoardVO> listSearch(SearchCriteria scri) throws Exception {
		return sql.selectList(namespace + ".listSearch", scri);
	}

	// 검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) throws Exception {
		return sql.selectOne(namespace + ".countSearch", scri);
	}

	//게시판 조회수
	@Override
	public void readCountUpdate(int fb_num) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".updateReadCount",fb_num);
	}

	//댓글수
	@Override
	public void updateCommentCnt(int fb_num, int amount) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("fb_num",fb_num);
		paramMap.put("amount",amount);
		
		sql.update(namespace+".updateCommentCnt",paramMap);
	}

}
