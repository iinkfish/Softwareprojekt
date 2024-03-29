
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import java.io.*;
import java.net.*;

public class MainFrame extends JFrame {
    final private Font mainFont = new Font("Segoe print", Font.BOLD, 18);
    JTextField tfFirstName, tfLastName;
    JLabel lbWelcome;
    public static String movement = "TEST";
    private Timer trigger;
    private Timer trigger2;
    private Timer trigger3;
    private Timer trigger4;

    public void initialize() {
        /***************** Form Panel **************************/
        JLabel lbFirstName = new JLabel("First Name");
        lbFirstName.setFont(mainFont);

        tfFirstName = new JTextField();
        tfFirstName.setFont(mainFont);

        JLabel lbLastName = new JLabel("Last Name");
        lbLastName.setFont(mainFont);

        tfLastName = new JTextField();
        tfLastName.setFont(mainFont);

        JPanel formPanel = new JPanel();
        formPanel.setLayout(new GridLayout(4, 1, 5, 5));
        formPanel.add(lbFirstName);
        formPanel.add(tfFirstName);
        formPanel.add(lbLastName);
        formPanel.add(tfLastName);

        /***************** Welcome Label *********************/
        lbWelcome = new JLabel();
        lbWelcome.setFont(mainFont);

        /************* Buttons Panel **************************/
        JButton btnOK = new JButton("OK");
        btnOK.setFont(mainFont);
        btnOK.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                String firstName = tfFirstName.getText();
                String lastName = tfLastName.getText();
                lbWelcome.setText("Hello" + firstName + " " + lastName);

            }

        });

        JButton btnClear = new JButton("Clear");
        btnClear.setFont(mainFont);
        btnClear.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                tfFirstName.setText("");
                tfLastName.setText("");
                lbWelcome.setText("");

            }

        });

        // JButton btnFW = new JButton("FW");
        // btnFW.setFont(mainFont);
        // btnFW.addActionListener(new ActionListener() {

        // @Override
        // public void actionPerformed(ActionEvent e) {
        // lbWelcome.setText("Move Forward");
        // movement = "FW";

        // }

        // });

        JButton btnFW = new JButton("FW");
        btnFW.setFont(mainFont);
        trigger = new Timer(50, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                lbWelcome.setText("Move Forward");
                Main.movement = "FW";

            }
        });
        btnFW.addChangeListener(new ChangeListener() {

            @Override
            public void stateChanged(ChangeEvent e) {
                JButton btnFW2 = (JButton) e.getSource();
                ButtonModel model = btnFW2.getModel();
                if (model.isPressed() && !trigger.isRunning()) {
                    trigger.start();
                } else if (!model.isPressed() && trigger.isRunning()) {
                    trigger.stop();
                }

            }

        });

        JButton btnL = new JButton("ML");
        btnFW.setFont(mainFont);
        trigger2 = new Timer(50, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                lbWelcome.setText("Move Left");
                Main.movement = "ML";

            }
        });
        btnL.addChangeListener(new ChangeListener() {

            @Override
            public void stateChanged(ChangeEvent e) {
                JButton btnML2 = (JButton) e.getSource();
                ButtonModel model = btnML2.getModel();
                if (model.isPressed() && !trigger2.isRunning()) {
                    trigger2.start();
                } else if (!model.isPressed() && trigger2.isRunning()) {
                    trigger2.stop();
                }

            }

        });

        JButton btnBW = new JButton("BW");
        btnFW.setFont(mainFont);
        trigger3 = new Timer(50, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                lbWelcome.setText("Move Backward");
                Main.movement = "BW";

            }
        });
        btnBW.addChangeListener(new ChangeListener() {

            @Override
            public void stateChanged(ChangeEvent e) {
                JButton btnBW2 = (JButton) e.getSource();
                ButtonModel model = btnBW2.getModel();
                if (model.isPressed() && !trigger3.isRunning()) {
                    trigger3.start();
                } else if (!model.isPressed() && trigger3.isRunning()) {
                    trigger3.stop();
                }

            }

        });

        JButton btnR = new JButton("MR");
        btnFW.setFont(mainFont);
        trigger4 = new Timer(50, new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                lbWelcome.setText("Move Right");
                Main.movement = "MR";

            }
        });
        btnR.addChangeListener(new ChangeListener() {

            @Override
            public void stateChanged(ChangeEvent e) {
                JButton btnMR2 = (JButton) e.getSource();
                ButtonModel model = btnMR2.getModel();
                if (model.isPressed() && !trigger4.isRunning()) {
                    trigger4.start();
                } else if (!model.isPressed() && trigger4.isRunning()) {
                    trigger4.stop();
                }

            }

        });

        // JButton btnBW = new JButton("BW");
        // btnBW.setFont(mainFont);
        // btnBW.addActionListener(new ActionListener() {

        // @Override
        // public void actionPerformed(ActionEvent e) {
        // lbWelcome.setText("Move Backward");
        // movement = "BW";

        // }

        // });

        // JButton btnL = new JButton("L");
        // btnL.setFont(mainFont);
        // btnL.addActionListener(new ActionListener() {

        // @Override
        // public void actionPerformed(ActionEvent e) {
        // lbWelcome.setText("Move Left");
        // movement = "ML";

        // }

        // });

        // JButton btnR = new JButton("R");
        // btnR.setFont(mainFont);
        // btnR.addActionListener(new ActionListener() {

        // @Override
        // public void actionPerformed(ActionEvent e) {
        // lbWelcome.setText("Move Right");
        // movement = "MR";

        // }

        // });

        JPanel buttonsPanel = new JPanel();
        buttonsPanel.setLayout(new GridLayout(1, 4, 5, 5)); // define position of buttons
        // buttonsPanel.add(btnOK); // add buttons
        // buttonsPanel.add(btnClear);
        buttonsPanel.add(btnL);
        buttonsPanel.add(btnFW);
        buttonsPanel.add(btnBW);
        buttonsPanel.add(btnR);

        JPanel mainPanel = new JPanel(); // initialize main panel
        mainPanel.setLayout(new BorderLayout()); // set layout style
        mainPanel.setBackground(new Color(128, 128, 255)); // set background color
        // mainPanel.add(formPanel, BorderLayout.NORTH); // add input text fields +
        // labels to the north panel (top part)
        mainPanel.add(lbWelcome, BorderLayout.CENTER); // add text output field to the
        // center
        mainPanel.add(buttonsPanel, BorderLayout.SOUTH); // add buttons to the south panel (bottom one)

        add(mainPanel);

        setTitle("Controls");
        setSize(500, 150); // set dimensions to the entire window
        setMinimumSize(new Dimension(300, 100));
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setVisible(true);
    }

}