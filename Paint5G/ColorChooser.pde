public class ColorChooser extends JPanel {
  public ColorChooser(JColorChooser cc) {
    cc = new JColorChooser();
    cc.getSelectionModel();
  }
  
  void openColorChooser() {
    JFrame frame = new JFrame("Color Chooser");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    JComponent newContentPane = new ColorChooser();
    newContentPane.setOpaque(true);
    frame.setContentPane(newContentPane);
    frame.pack();
    frame.setVisible(true);
  }
}
