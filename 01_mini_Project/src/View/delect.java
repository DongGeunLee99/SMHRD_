package View;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;

import Controller.mini_Controller;
import Model.Account;
import Model.mini_DTO;

public class delect extends JDialog {
	mini_Controller con = new mini_Controller();
	
	public delect(JFrame Main_frame, Account user) {
        int width = 400, height = 150;
        JFrame frame = new JFrame();
        JPanel PW_Panel = new JPanel();

		// PW
		JLabel PwLabel = new JLabel("PW    인증");
		JPasswordField PwIn = new JPasswordField(10);
		JButton OKBtn = new JButton("OK");
		PW_Panel.add(PwLabel);
		PW_Panel.add(PwIn);
        PW_Panel.add(OKBtn);
        PW_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 30, 40));
		PW_Panel.setBounds(0, 0, width, height);
//        add(PW_Panel);
        frame.add(PW_Panel);

                
        // 비밀번호 치고 엔터 OR 확인버튼 눌렀을때 메소드같은 느낌
        ActionListener printPWListener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) { 
                String PW = new String(PwIn.getPassword());
                mini_DTO dto = new mini_DTO(PW);
                con.delete(dto, user); // dto = PW , user = ID
                
                frame.setVisible(false); // 로그아웃 창 가리기
                Main_frame.setVisible(false); // 회원탈퇴 후 메인창 나가기
                new FIRST_SCREEN(); // 초기화면 열기
            }
        };
        // 비밀번호 치고 엔터 OR 확인버튼 눌렀을때 동작 부분
        PwIn.addActionListener(printPWListener);
        OKBtn.addActionListener(printPWListener);
        
        
        
        // set JFrame
//        frame.setModal(true); // 이 창이 우선
        frame.setLayout(null);
        frame.setTitle("회원 탈퇴.."); // frame name
        frame.setSize(width, height);
        frame.getContentPane().setBackground(Color.white); // frame Color
        frame.setResizable(false); // 크기조절 불가
        frame.setLocationRelativeTo(null); // 화면 중앙 배치
        frame.setVisible(true); // 화면 띄우기?
        
        
    }
}
