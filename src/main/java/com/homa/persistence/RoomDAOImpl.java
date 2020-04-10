package com.homa.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.RoomVO;
import com.homa.domain.SearchCriteria;
import com.homa.domain.SearchListCriteria;

@Repository
public class RoomDAOImpl implements RoomDAO{

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.roomMapper";
	
	//게시물의 총개수
	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".listCount");
	}
	
	//방목록
	@Override
	public List<RoomVO> list(SearchListCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list",scri);
	}
	
	
	
	//검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) throws Exception{
		return sql.selectOne(namespace+".countSearch",scri);
	}

	//방등록
	@Override
	public void regist(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".regist",vo);
	}
	
	//방 조회
	@Override
	public RoomVO read(int r_num) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".read",r_num);
	}
		
	//방 수정
	@Override
	public void update(RoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".update",vo);
	}
		
	//방 삭제
	@Override
	public void delete(int r_num) throws Exception {
		// TODO Auto-generated method stub
			sql.delete(namespace+".delete",r_num);
	}
}
