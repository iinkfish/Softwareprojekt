public class Main {
    public static String movement = "";

    public static void main(String[] args) {

        MainFrame myFrame = new MainFrame();
        myFrame.initialize();

        communication myComms = new communication();
        myComms.startCom();
    }
}
