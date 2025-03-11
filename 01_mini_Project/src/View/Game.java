package View;

import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.Timer;

import Model.mini_DAO;
import Model.Account;


public class Game extends JFrame{
    
	//버튼 리스트
    ArrayList<JButton> buttons = new ArrayList<>(); 
    
    // 1부터 클릭
    int Number = 1;
    
    //게임 시간
    long startTime; 
    
    //타이머 라벨
    JLabel timerLabel;
    
    JLabel countdownLabel;
    
    boolean gameStart = false;
    
    Timer countdownTimer;
    int count = 3;
    
    
    String choice = null;
    
    Timer gameTimer;
    Account user;

    public Game(String choice, Account user) {
    	startCountdown();
        System.out.println("1");
    	this.choice = choice;
    	this.user = user;

    	System.out.println("게임하는 사람" + user.getNAME());
    	
        setTitle("숫자 클릭 게임");
        setSize(500, 550); //창 크기
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        JPanel panel = new JPanel();
        
        //그리드 레이아웃
        if (choice.equals("Hard")) {
        	panel.setLayout(new GridLayout(5, 5)); 
        }else {
        	panel.setLayout(new GridLayout(4, 4)); 
        }
        
        //패널 중앙 배치
        add(panel, BorderLayout.CENTER); 

        timerLabel = new JLabel("시간: 0.0 초", SwingConstants.CENTER);
        add(timerLabel, BorderLayout.NORTH);
        timerLabel.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        
        countdownLabel = new JLabel("게임 시작까지: " + count, SwingConstants.CENTER);
        countdownLabel.setFont(new Font("맑은 고딕", Font.BOLD, 20));
        add(countdownLabel, BorderLayout.SOUTH);

        // 16 or 25까지의 숫자 버튼 생성 후 섞기
        ArrayList<Integer> numbers = new ArrayList<>();
        for (int i = 1; i <= (choice.equals("Hard") ? 25 : 16); i++) {
        	numbers.add(i);
        }
        //숫자 섞기
        Collections.shuffle(numbers); 

        for (int num : numbers) {
            JButton button = new JButton(String.valueOf(num));
            
            // 폰트 설정
            button.setFont(new Font("맑은 고딕", Font.BOLD, 20));
            button.addActionListener(new ButtonClickListener());
            buttons.add(button);
            panel.add(button);
            
            button.setEnabled(false);
        }
        

        setVisible(true);
        setResizable(false);
        setLocationRelativeTo(null);

        
    }
  //카운트다운 메소드
    private void startCountdown() {
        countdownTimer = new Timer(1000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                if (count >= 0) {
                    countdownLabel.setText("게임 시작까지: " + count);
                    count--;
                } else {
                   ((Timer)e.getSource()).stop();
                    countdownLabel.setText("게임 시작!");
                    gameStart = true;
                    
                    for (JButton button : buttons) {
                       button.setEnabled(true);
                    }
                    
                
                    // 카운트다운이 끝나면 게임진행시간을 알려주는 메소드 호출
                    startGameTimer();
                }
            }
        });
        //카운트다운 시작!
        countdownTimer.setInitialDelay(0);
        countdownTimer.start();
    }
    
 // 게임진행시간 측정하는 메소드
    private void startGameTimer() {
        startTime = System.currentTimeMillis();
        gameTimer = new Timer(100, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                long elapsedTime = System.currentTimeMillis() - startTime;
                timerLabel.setText("시간: " + (elapsedTime / 1000.0) + " 초");
            }
        });
        gameTimer.start();
    }
    
    private class ButtonClickListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            JButton clickedButton = (JButton) e.getSource();
            int number = Integer.parseInt(clickedButton.getText());

            if (number == Number) {
                if (Number == 1 && gameTimer == null) {
                	// 타이머 시작
                	startGameTimer();
//                    startTime = System.currentTimeMillis(); 
                }

                clickedButton.setEnabled(false);
                Number++;

                if (Number > (choice.equals("Hard") ? 25 : 16)) {
                    long endTime = System.currentTimeMillis();
                    double Hard_tm = (endTime - startTime) / 1000.0;
                    setVisible(false);
                    JOptionPane.showMessageDialog(null, "게임 완료! 시간: " + Hard_tm + " 초");
                    mini_DAO save = new mini_DAO();
                    save.Save(user.getNAME(), Hard_tm, choice);
                    
                    // 재시작 여부 예 = 0 아니오 = 1
                    int ans = JOptionPane.showConfirmDialog(null, "다시 시작하시겠습니까?", "재시작 여부", JOptionPane.YES_NO_OPTION, JOptionPane.PLAIN_MESSAGE);
                    if (ans == 0) {
                    	new choice(user);
                    }
                }
            }
        }
    }

}
