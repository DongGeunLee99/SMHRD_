package View;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.*;
import javax.swing.*;
import Model.Account;

public class MAIN_window extends JFrame {
    int width = 500, height = 550;
    int btn_width = 100, btn_height = 40;

    public MAIN_window(Account user) {
		// 메인 프레임, 버튼 선언
		JFrame frame = new JFrame();
		JPanel btnPanel = new JPanel();

        // 라벨(이미지) 선언 및 이미지를 라벨에 넣기
        ImageIcon icon = new ImageIcon("C:\\Java Study\\0_mini_Project\\src\\imgs\\Title.png"); // 이미지 호출출
		JLabel imageLabel = new JLabel(icon); // 이미지를 라벨에 넣기
		imageLabel.setBounds(100,100, icon.getIconWidth(), icon.getIconHeight());


		// 버튼 작업 ----------------------------------------------------------------------------
       
        JButton start = new JButton("게임 시작");
        JButton rnkInq = new JButton("랭킹 보기");
        JButton logOut = new JButton("로그 아웃");
        JButton delect = new JButton("회원 탈퇴");
        JButton end = new JButton("종료");

		// 사이즈 선언, 적용
        Dimension buttonSize = new Dimension(btn_width, btn_height);
        start.setPreferredSize(buttonSize);
		rnkInq.setPreferredSize(buttonSize);
		logOut.setPreferredSize(buttonSize);
		delect.setPreferredSize(buttonSize);
		end.setPreferredSize(buttonSize);

		// 패널에 넣기
        btnPanel.add(start);
        btnPanel.add(rnkInq);
        btnPanel.add(logOut);
        btnPanel.add(delect);
        btnPanel.add(end);
        btnPanel.setBackground(Color.white);
        btnPanel.setLayout(new FlowLayout(FlowLayout.CENTER, 40, 30));
		btnPanel.setBounds(0, height-btn_height*6, width, btn_height*4);

		// ---------------------------------------------------------------------------------------


		// 프레임에 이미지, 버튼 적용
		frame.add(imageLabel);
		frame.add(btnPanel);


        // 게임 시작 버튼 클릭 시 동작
        start.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
        		new choice(user); // 난이도 설정창 부르기(계정정보)
            }
        });

        rnkInq.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
        		new RNKNG_QUERY();
            }
        });

        logOut.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.setVisible(false); // 메인창 나가기
                new FIRST_SCREEN(); // 초기화면 열기
            }
        });

        delect.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
        		new delect(frame, user);
            }
        });

        end.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });


        // set JFrame
		frame.setLayout(null);
        frame.setTitle("Main Screen"); // frame name
		frame.setSize(width, height);
        frame.getContentPane().setBackground(Color.white); // frame Color
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 종료버튼(x) 눌렀을때 코드 종료
        frame.setVisible(true); // 화면 띄우기?
		frame.setResizable(false); // 크기조절 불가
		frame.setLocationRelativeTo(null); // 화면 중앙 배치




    }

    public static void main(String[] args) {
        new MAIN_window(null);
    }
}