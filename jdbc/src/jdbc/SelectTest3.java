package jdbc;

import java.util.ArrayList;

import dao.MemberDAO;
import vo.MemberVO;

public class SelectTest3 {
public static void main(String[] args) {


	//MemberVO 객체 저장 
	//selectMember 메소드
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.selectMember();
	
	for (MemberVO vo : list) {
		System.out.println(vo);
	}
	
	

}
} 
