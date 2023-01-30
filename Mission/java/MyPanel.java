package Mission.java;

import java.awt.*;
import javax.swing.*;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyPanel extends JPanel implements ActionListener {

    int distances[] = { 10, 6, 15, 20 };
    int distanceScaler = 10; // 10 cm is 100 pixels on screen

    Timer timer;
    int centerX = 250;
    int centerY = 250;

    MyPanel() {
        this.setPreferredSize(new Dimension(500, 500));
        this.setBackground(Color.black);
        timer = new Timer(200, this);
        timer.start();

    }

    public static int[] calculateX(int distance[], int scaler) {

        double[] x = new double[distance.length];
        final int[] values = new int[distance.length];
        for (int i = 0; i < distance.length; i++) {
            x[i] = (distance[i] * Math.cos(i * 0.436332) * scaler + 250);
            values[i] = (int) x[i];
            System.out.println("X: " + values[i]);

        }
        return values;
    }

    public static int[] calculateY(int distance[], int scaler) {

        double[] y = new double[distance.length];
        final int[] values = new int[distance.length];
        for (int i = 0; i < distance.length; i++) {
            y[i] = (-1 * (distance[i] * Math.sin(i * 0.436332)) * scaler + 250);
            values[i] = (int) y[i];
            System.out.println("Y: " + values[i]);
        }
        return values;
    }

    int[] xArr = calculateX(distances, distanceScaler);
    int[] yArr = calculateY(distances, distanceScaler);

    public void paint(Graphics g) {

        super.paint(g); // paint background

        Graphics2D g2D = (Graphics2D) g;

        g2D.setPaint(Color.red);
        g2D.setStroke(new BasicStroke(1));

        g2D.drawLine(250, 500, 250, 0);
        g2D.drawLine(0, 250, 500, 250);
        g2D.drawArc(150, 150, 200, 200, 0, 360);
        g2D.drawArc(100, 100, 300, 300, 0, 360);
        g2D.drawArc(50, 50, 400, 400, 0, 360);
        g2D.drawArc(0, 0, 500, 500, 0, 360);

        g2D.setPaint(Color.white);
        g2D.setStroke(new BasicStroke(2));

        // g2D.drawLine(centerX, centerY, xArr[0], yArr[0]);
        // g2D.drawLine(centerX, centerY, xArr[1], yArr[1]);
        // g2D.drawLine(centerX, centerY, xArr[2], yArr[2]);
        // g2D.drawLine(centerX, centerY, xArr[3], yArr[3]);

        for (int i = 0; i < distances.length; i++) {
            g2D.drawLine(centerX, centerY, xArr[i], yArr[i]);

        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {

        repaint();
    }

}
