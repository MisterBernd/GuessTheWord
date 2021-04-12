import javax.swing.*;

public class PopUp {
    
    static final long serialVersionUID = -445307629455571367L;
    final static private String ENTRY_ERROR = "---> Fehlerhafte Eingabe!";

    
    public static void print(String text) {
        JOptionPane.showMessageDialog(null, text, "Ausgabe", JOptionPane.PLAIN_MESSAGE);
    }
         
    public static int confirm(String text) { /* 0 = yes, 1 = no */
        return JOptionPane.showConfirmDialog(null, text, "Frage", JOptionPane.YES_NO_OPTION);
    }
     
    public static String readLine(String text) {
        String s = JOptionPane.showInputDialog(null, text, "Eingabe", JOptionPane.PLAIN_MESSAGE);
        return (s != null) ? s : "";
    }
    
    public static String readWord(String text) {
        return readLine(text).split("\\P{IsLatin}+")[0];
    }
    
    public static int readInt(String text) {
        String s = readLine(text);
        if (s == "") return 0;
        
        int i = 0;
        try {i = Integer.parseInt(s);}
        catch (NumberFormatException e) {
          return readInt(ENTRY_ERROR);
        }
        return i;
    }
    
    public static long readLong(String text) {
        String s = readLine(text);
        if (s == "") return 0L;
        
        long lng = 0L;
        try {lng = Long.parseLong(s);}
        catch (NumberFormatException e) {
            return readLong(ENTRY_ERROR);
        }
        return lng;
    }
    
    public static float readFloat(String text) {
        String s = readLine(text);
        if (s == "") return 0F;
        
        float flt = 0F;
        try {flt = Float.parseFloat(s);}
        catch (NumberFormatException e) {
            return readFloat(ENTRY_ERROR);
        }
        return flt;
    }
  
    public static double readDouble(String text) {
        String s = readLine(text);
        if (s == "") return 0D;
        
        double dbl = 0D;
        try {dbl = Double.parseDouble(s);}
        catch (NumberFormatException e) {
            return readDouble(ENTRY_ERROR);
        }
        return dbl;
    }

}
