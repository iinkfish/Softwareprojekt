package Mission.java;

import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class LineDashes1 extends JPanel {

    public void paintComponent(Graphics g) {

        int xPos[] = { 40, 60, 55, 66, 50, 40 };
        int yPos[] = { 40, 0, 250, 100, 20, 270 };

        super.paintComponent(g);

        Graphics2D g2d = (Graphics2D) g;

        float[] dash1 = { 2f, 0f, 2f };

        // g2d.drawLine(0, 0, 280, 270);

        // g2d.drawOval(40, 40, 5, 5);

        for (int i = 0; i < xPos.length; i++) {
            g2d.drawLine(0, 0, xPos[i], yPos[i]);
        }

        BasicStroke bs1 = new BasicStroke(1,
                BasicStroke.CAP_BUTT,
                BasicStroke.JOIN_ROUND,
                1.0f,
                dash1,
                2f);
        g2d.setStroke(bs1);
        g2d.drawLine(20, 80, 250, 80);

    }

    public static void main(String[] args) {
        LineDashes1 lines = new LineDashes1();
        JFrame frame = new JFrame("Lines");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(lines);
        frame.setSize(280, 270);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);

    }
}
