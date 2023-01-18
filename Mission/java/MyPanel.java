package Mission.java;

import java.awt.*;
import javax.swing.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyPanel extends JPanel implements ActionListener {

    int xCorrdinates[] = { 500, 500, 300, 0 };
    int yCorrdinates[] = { 0, 300, 500, 400 };

    Timer timer;
    int centerX = 250;
    int centerY = 250;

    MyPanel() {
        this.setPreferredSize(new Dimension(500, 500));
        timer = new Timer(5000, this);
    }

    public void paint(Graphics g) {

        Graphics2D g2D = (Graphics2D) g;

        g2D.setPaint(Color.blue);
        g2D.setStroke(new BasicStroke(2));

        g2D.drawLine(0, 0, xCorrdinates[1], yCorrdinates[1]);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        xCorrdinates[1] = xCorrdinates[2];
        yCorrdinates[1] = yCorrdinates[2];
        repaint();
    }

}
