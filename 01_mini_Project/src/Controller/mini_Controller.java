package Controller;

import java.util.List;

import javax.swing.JOptionPane;

import Model.mini_DAO;
import Model.mini_DTO;
import Model.Account;

public class mini_Controller {

	mini_DAO dao = new mini_DAO();
	mini_DTO user = null;
	Account save;
	int cnt = 0;
	
	// 회원가입
	public void regist(mini_DTO dto) {
		cnt = dao.regist(dto);
		if(cnt > 0 ){
			 JOptionPane.showMessageDialog(null, "회원가입 성공!\n아이디 :  " + dto.getID() + "\n이름 :  " + dto.getNAME());
		} else {
			 JOptionPane.showMessageDialog(null, "회원가입 실패!\n ID, NAME 중복 or PW입력 x","회원가입 실패",JOptionPane.ERROR_MESSAGE);
		}
	}

	// 로그인
	public Account login(mini_DTO dto) {
		user = dao.login(dto);

		if (user != null) {
			JOptionPane.showMessageDialog(null, "로그인 성공!\n아이디 :  " + user.getID() + "\n닉네임 :  " + user.getNAME());
			save = new Account(user);
		} else {
			 JOptionPane.showMessageDialog(null, "로그인 실패!!!!!!!!!!!!\n아이디: " + dto.getID(),"로그인 실패",JOptionPane.ERROR_MESSAGE);
		}
		return save;
	}

	public int delete(mini_DTO dto, Account user) {
		cnt = dao.delete(dto, user);
		if(cnt > 0 ){
			JOptionPane.showMessageDialog(null, "회원탈퇴 성공!\n아이디 :  " + user.getID() + "\n이름 :  " + user.getNAME());
		} else {
			JOptionPane.showMessageDialog(null, "회원탈퇴 실패!            PW 불일치 \n 해킹위험!             로그아웃!","회원탈퇴 실패",JOptionPane.ERROR_MESSAGE);
		}
		
		return cnt;
	}

	public List<List<Object>> list(String hard) {
    	mini_DAO dao = new mini_DAO();
    	List<List<Object>> list = dao.list(hard);
    	return list;
	}

}