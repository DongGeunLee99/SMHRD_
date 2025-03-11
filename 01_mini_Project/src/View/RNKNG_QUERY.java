package View;

import java.util.List;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import Controller.mini_Controller;

public class RNKNG_QUERY extends JDialog {
    
    mini_Controller con = new mini_Controller();
    DefaultTableModel model;
    
    public void up_Date(String level) {
        
        model.setRowCount(0); // 초기화
        String[] columnNames = {level, "Name", "Time", "Date"};  // 새 컬럼 이름 배열 설정
        model.setColumnIdentifiers(columnNames);  // 컬럼 이름을 설정

    	List<List<Object>> list = con.list(level); // DB데이터 불러옴

        // 한 행씩 add
        for (List<Object> data : list) {
            model.addRow(data.toArray());
        }
    }


    public RNKNG_QUERY() {
        int width = 550, height = 300;

        //  테이블 생성
        model = new DefaultTableModel(0, 0){ //  (컬럼 : 0, 데이터 : 0) 초기화
            public boolean isCellEditable(int row, int column) { // 데이터 조작 불가 기능
        		return false;
        	}
        };
        JTable table = new JTable(model);
        table.getTableHeader().setReorderingAllowed(false);


        //  스크롤 기능을 제공하는 컴포넌트
        JScrollPane scrollPane = new JScrollPane(table); // 스크롤 기능
        scrollPane.setPreferredSize(new Dimension(width, height)); // 사이즈 설정
        scrollPane.setBounds(0, 0, width, height - 40); // 배치 설정
        

        // 버튼 생성
        JPanel btn_Panel = new JPanel();
        JButton Hard_Btn = new JButton("Hard");
        JButton Normal_Btn = new JButton("Normal");
        btn_Panel.add(Hard_Btn);
        btn_Panel.add(Normal_Btn);
        btn_Panel.setLayout(new FlowLayout(FlowLayout.CENTER));
        btn_Panel.setBounds(0, height - 40, width, 40);   
        

        add(scrollPane);
        add(btn_Panel);

        
        Hard_Btn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                up_Date("Hard");
            }
        });
        
        Normal_Btn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                up_Date("Normal");
            }
        });

        // set JFrame
        setModal(true); // 이 창이 우선
		setLayout(null);
        setTitle("랭킹 조회"); // frame name
		setSize(width, height+40);
        getContentPane().setBackground(Color.white); // frame Color
		setLocationRelativeTo(null); // 화면 중앙 배치
        setVisible(true); // 화면 띄우기?        
    }

    


}
