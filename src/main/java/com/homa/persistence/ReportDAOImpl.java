package com.homa.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homa.domain.ReportVO;
@Repository
public class ReportDAOImpl implements ReportDAO{

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.homa.mappers.reportMapper";
	
	//작성
	@Override
	public void regist(ReportVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".regist",vo);
	}

}
