package View;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.*;
import javax.swing.*;


import Controller.mini_Controller;
import Model.Account;
import Model.mini_DTO;

public class Form extends JDialog {
	
	mini_Controller con = new mini_Controller();
	
	public void signup() {
		int width = 300, height = 300;
		// 메인 프레임, 버튼 선언
		JFrame frame = new JFrame();
		JPanel ID_Panel = new JPanel();
		JPanel PW_Panel = new JPanel();
		JPanel NAME_Panel = new JPanel();
		
		// ID
		JLabel idLabel = new JLabel("ID");
		JTextField idField = new JTextField(10);
		ID_Panel.add(idLabel);
		ID_Panel.add(idField);
		ID_Panel.setBackground(Color.white);
		ID_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 34, 32));
		ID_Panel.setBounds(0, 0, width, height/5);

		// PW
		JLabel passwordLabel = new JLabel("PW");
		JPasswordField passwordField = new JPasswordField(10);
		PW_Panel.add(passwordLabel);
		PW_Panel.add(passwordField);
		PW_Panel.setBackground(Color.white);
		PW_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 26, 24));
		PW_Panel.setBounds(0, height/5, width, height/5);

		// NAME
		JLabel nameLabel = new JLabel("NAME");
		JTextField nameField = new JTextField(10);
		NAME_Panel.add(nameLabel);
		NAME_Panel.add(nameField);
		NAME_Panel.setBackground(Color.white);
		NAME_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 14, 15));
		NAME_Panel.setBounds(0, (height/5)*2, width, height/5);
		
		// Btn
		JButton signUpBtn = new JButton("가입하기");
		signUpBtn.setLayout(new FlowLayout(FlowLayout.CENTER));
		signUpBtn.setBounds(width/4, height/20 + (height/5)*3, width/2, height/10);


		// 프레임에 적용
        frame.add(ID_Panel);
        frame.add(PW_Panel);
        frame.add(NAME_Panel);
		frame.add(signUpBtn);


		// 이벤트 처리
		ActionListener printPWListener = new ActionListener() { // 이벤트 호출
            @Override
            public void actionPerformed(ActionEvent e) {  // 이벤트 선언? 동작하는 구간
    			String id = idField.getText();
    			String pw = new String(passwordField.getPassword());
    			String name = nameField.getText();
    			
    			mini_DTO dto = new mini_DTO(id, pw, name);
    			con.regist(dto);

    			frame.dispose(); // 창 닫기
            }
        };
        // 비밀번호 치고 엔터 OR 확인버튼 눌렀을때 동작 부분
        nameField.addActionListener(printPWListener);
        signUpBtn.addActionListener(printPWListener);
        
        
        
        // set JFrame
		frame.setLayout(null);
        frame.setTitle("회원가입"); // frame name
		frame.setSize(width, height-height/10);
        frame.getContentPane().setBackground(Color.white); // frame Color
        frame.setVisible(true); // 화면 띄우기?
		frame.setResizable(false); // 크기조절 불가
		frame.setLocationRelativeTo(null); // 화면 중앙 배치

	}

	public void login(JFrame ScreenFrame) {
		int width = 300, height = 250;
		// 메인 프레임, 버튼 선언
		JFrame frame = new JFrame();
		JPanel ID_Panel = new JPanel();
		JPanel PW_Panel = new JPanel();

		// ID
		JLabel idLabel = new JLabel("ID");
		JTextField idField = new JTextField(10);
		ID_Panel.add(idLabel);
		ID_Panel.add(idField);
		ID_Panel.setBackground(Color.white);
		ID_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 34, 32));
		ID_Panel.setBounds(0, 0, width, height/3);

		// PW
		JLabel passwordLabel = new JLabel("PW");
		JPasswordField passwordField = new JPasswordField(10);
		PW_Panel.add(passwordLabel);
		PW_Panel.add(passwordField);
		PW_Panel.setBackground(Color.white);
		PW_Panel.setLayout(new FlowLayout(FlowLayout.CENTER, 26, 24));
		PW_Panel.setBounds(0, height/4, width, height/3-10);

		// Btn
		JButton signUpBtn = new JButton("가입하기");
		signUpBtn.setLayout(new FlowLayout(FlowLayout.CENTER));
		signUpBtn.setBounds(width/4, height/20 + (height/6)*3, width/2, height/10+height/20);


		// 프레임에 적용
		frame.add(ID_Panel);
		frame.add(PW_Panel);
		frame.add(signUpBtn);


		// 이벤트 처리
		ActionListener printPWListener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) { 
    			String id = idField.getText();
    			String pw = new String(passwordField.getPassword());
    			
    			mini_DTO dto = new mini_DTO(id,pw);
    			Account user = con.login(dto); // 로그인 계정 저장

				if(user != null){
					frame.dispose(); // 로그인 창 닫기
					ScreenFrame.setVisible(false); // 초기 화면 가리기
				 	new MAIN_window(user); // 메인 창 열기 (사용자 계정 정보)
				}
            }
        };
        // 비밀번호 치고 엔터 OR 확인버튼 눌렀을때 동작 부분
        passwordField.addActionListener(printPWListener);
        signUpBtn.addActionListener(printPWListener);		
        
		
        // set JFrame
		frame.setLayout(null);
		frame.setTitle("로그인"); // frame name
		frame.setSize(width, height-height/10);
		frame.getContentPane().setBackground(Color.white); // frame Color
		frame.setResizable(false); // 크기조절 불가
		frame.setLocationRelativeTo(null); // 화면 중앙 배치
		frame.setVisible(true); // 화면 띄우기?
	}
	
}
