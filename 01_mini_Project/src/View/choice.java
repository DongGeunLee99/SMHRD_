package View;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import Model.mini_DAO;
import Model.mini_DTO;
import Model.Account;

public class choice extends JFrame{

	public choice(Account user) {

		setTitle("난이도 선택 ");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		Container c = getContentPane();
		
		c.setBackground(Color.white);
		c.setLayout(new BorderLayout(30,20));
		
		// 패널 생성 
        JPanel button = new JPanel();
        
        // 가로 2개 배치, 간격 10px
        button.setLayout(new GridLayout(1, 2, 10, 0)); 

        // 버튼 크기 설정
        JButton NormalButton = new JButton("NORMAL");
        NormalButton.setPreferredSize(new Dimension(120, 40)); 
        NormalButton.setFont(new Font("맑은 고딕", Font.BOLD, 40));
        NormalButton.addActionListener(e -> {
            System.out.println("rr");
        	new Game("Normal", user);
        	setVisible(false);
        }); 
        
        // 버튼 크기 설정
        JButton HardButton = new JButton("HARD");
        HardButton.setPreferredSize(new Dimension(120, 40)); 
        HardButton.setFont(new Font("맑은 고딕", Font.BOLD, 40));
        HardButton.addActionListener(e -> {
        	new Game("Hard", user);
        	setVisible(false);
        }); 
        
        button.add(NormalButton);
        button.add(HardButton);

        // 중앙배치
        c.add(button, BorderLayout.CENTER);

        // CANCEL 버튼
        JButton cancelButton = new JButton("CANCEL");
        cancelButton.setPreferredSize(new Dimension(300, 100));
        cancelButton.setFont(new Font("맑은 고딕", Font.BOLD, 30));
        
        //아래 배치
        c.add(cancelButton, BorderLayout.SOUTH);
        
        // 종료버튼 클릭시 창 닫기
        cancelButton.addActionListener(e -> dispose()); 

        setSize(500, 550); 
        setVisible(true);
        setResizable(false);
        setLocationRelativeTo(null); 
		
	}
	
}
