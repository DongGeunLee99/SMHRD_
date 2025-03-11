package View;

import java.awt.*;
import javax.swing.*;

public class FIRST_SCREEN extends JFrame {
	int width = 500, height = 550;
	int btn_width = 120, btn_height = 40;


	public FIRST_SCREEN(){
		// 메인 프레임, 버튼 선언
		JFrame frame = new JFrame();
		JPanel btnPanel = new JPanel();
		
		// 라벨(이미지) 선언 및 이미지를 라벨에 넣기
		ImageIcon icon = new ImageIcon("C:\\Java Study\\0_mini_Project\\src\\imgs\\Title.png"); // 이미지 호출출
		JLabel imageLabel = new JLabel(icon); // 이미지를 라벨에 넣기
		imageLabel.setBounds(100,100, icon.getIconWidth(), icon.getIconHeight());
		

		// 버튼 작업 ----------------------------------------------------------------------------

		JButton signInBtn = new JButton("로그인");
		JButton signUpBtn = new JButton("회원가입");
		JButton exitBtn = new JButton("종료");

		// 사이즈 선언, 적용
		Dimension buttonSize = new Dimension(btn_width, btn_height);
		signInBtn.setPreferredSize(buttonSize);
		signUpBtn.setPreferredSize(buttonSize);
		exitBtn.setPreferredSize(buttonSize);
		
		// 패널에 넣기
		btnPanel.add(signInBtn);
		btnPanel.add(signUpBtn);
		btnPanel.add(exitBtn);
		btnPanel.setBackground(Color.white);
		btnPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 20, 10));
		btnPanel.setBounds(0, height-btn_height*4, 500, 60);
		
		// ---------------------------------------------------------------------------------------
		
		// 프레임에 이미지, 버튼 적용
		frame.add(imageLabel);
		frame.add(btnPanel);
		
		// 이벤트 처리 < 각 버튼을 누르면 그에 맞는 메소드로 이동 >
		Form join = new Form();
		// 로그인 성공 시 Title Screen을 끄기 위해 Title Screen의 프레임(프레임 권한?)을 전송
		signInBtn.addActionListener(e -> join.login(frame));
		signUpBtn.addActionListener(e -> join.signup());
		exitBtn.addActionListener(e -> System.exit(0));
		
        // set JFrame
		frame.setLayout(null);
        frame.setTitle("Title Screen"); // frame name
		frame.setSize(width, height);
        frame.getContentPane().setBackground(Color.white); // frame Color
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 종료버튼(x) 눌렀을때 코드 종료
        frame.setVisible(true); // 화면 띄우기?
		frame.setResizable(false); // 크기조절 불가
		frame.setLocationRelativeTo(null); // 화면 중앙 배치



	}
	
	public static void main(String[] args) {
		new FIRST_SCREEN();
	}
}