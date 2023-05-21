package kr.co.noveljoa.admin.dao;

import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import kr.co.noveljoa.admin.domain.MemberManageDomain;
import kr.co.noveljoa.admin.domain.MemberManageInfoDomain;
import kr.co.noveljoa.admin.vo.UpdateMemVO;

public class ManagerDAO1 {
	
	public List<MemberManageDomain> selectMemberManage(String id) throws SQLException {
		List<MemberManageDomain> mmList = null;  
		//1. MyBatis Handler 얻기
		SqlSession ss = ManagerMyBatisHandler.getInstance().getMyBatisHandler(false);
		
		//2. 쿼리 수행 후 결과 얻기
		if(id!=null && id!="" ) {
			mmList=ss.selectList("kr.co.noveljoa.admin.Mapper.selectOneMember",id);
		}else {
			mmList=ss.selectList("kr.co.noveljoa.admin.Mapper.selectAllMember");
		}
		
		ss.commit();
		//3. MyBatis Handler 닫기
				if(ss != null) {
					ss.close();
				}//end if

		
		return mmList;
	}//selectLogin
	
	
	
	public MemberManageInfoDomain selectmemberInfoAll(String id) {
		MemberManageInfoDomain mmiDomain = null;
		
		//1. MyBatis Handler 얻기
		SqlSession ss = ManagerMyBatisHandler.getInstance().getMyBatisHandler(false);
		//2. 쿼리 수행 후 결과 얻기
		mmiDomain = ss.selectOne("kr.co.noveljoa.admin.Mapper.selectMemInfo",id);
		
		ss.commit();
		//3. MyBatis Handler 닫기
		if(ss!=null) {
			ss.close();
		}
		
		
	    return mmiDomain;
	}
	
	//정지
	public int updateStop(String id) {
		int cnt = 0;
		
		//1. MyBatis Handler 얻기
		SqlSession ss = ManagerMyBatisHandler.getInstance().getMyBatisHandler(false);
		//2. 쿼리 수행 후 결과 얻기
		cnt = ss.update("kr.co.noveljoa.admin.Mapper.updateStop",id);
		if( cnt==1 ) {
		ss.commit();
		}//end if
		//3. MyBatis Handler 닫기
		if(ss!=null) {
			ss.close();
		}
		
		
		return cnt;
	}
	
	//정지해제
	public int updateUnStop(String id) {
		int cnt = 0;
		
		//1. MyBatis Handler 얻기
		SqlSession ss = ManagerMyBatisHandler.getInstance().getMyBatisHandler(false);
		//2. 쿼리 수행 후 결과 얻기
		cnt = ss.update("kr.co.noveljoa.admin.Mapper.updateUnStop",id);
		if( cnt==1 ) {
		ss.commit();
		}//end if
		//3. MyBatis Handler 닫기
		if(ss!=null) {
			ss.close();
		}
		
		return cnt;
	}
	
	public int updateMemInfo(UpdateMemVO uVO) {
		int cnt = 0;
		
		//1. MyBatis Handler 얻기
		SqlSession ss = ManagerMyBatisHandler.getInstance().getMyBatisHandler(false);
		//2. 쿼리 수행 후 결과 얻기
		cnt = ss.update("kr.co.noveljoa.admin.Mapper.updateMemInfo",uVO);
		if( cnt==1 ) {
		ss.commit();
		}//end if
		//3. MyBatis Handler 닫기
		if(ss!=null) {
			ss.close();
		}
		
		return cnt;
	}
	
	
//	//테스트
//	 public static void main(String[] args) throws SQLException {
//		  
//			  ManagerDAO1 mDAO = new ManagerDAO1(); 
//			  
//			  UpdateMemVO uVO = new UpdateMemVO(3, "testfirst", "테스트1번", "01012341515", "test@naver.com");
//		  
//			
//				  int cnt = mDAO.updateMemInfo(uVO); 
//				  System.out.println(cnt);
//				 
//		
//		  
//		  }//main
	

}
