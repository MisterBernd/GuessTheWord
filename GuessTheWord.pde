/**
* @author MisterBernd
*/

String word;
String dummy = "";
int attempts;

void setup() {
  size(800, 600);
  frameRate(30);
  
  boolean useWordlist = (PopUp.confirm("Wollen Sie die JSON-Wortliste nutzen?") == 0) ? true : false;
  
  if (useWordlist) {
    JSONObject json = loadJSONObject("data/words.json");
    JSONArray values = json.getJSONArray("words");
    word = values.getString(int(random(values.size())));
    attempts = int(random(ceil(word.length() * 1.5), word.length() * 2));
    attempts = (attempts > 25) ? 25 : attempts;
  } else {
    word = PopUp.readLine("zu erratendes Wort").trim().toLowerCase();
    attempts = PopUp.readInt("Versuche (Mind. " + ceil(word.length() * 1.5) + " empfohlen)");
  }

  // Wort inspizieren
  for (int i = 0; i < word.length(); i++) {
    dummy += "_";
  }

  loadScreen();
}

void keyPressed(KeyEvent e) {
  String input = String.valueOf(e.getKey()).toLowerCase();
  int index = 0;

  if (word.contains(input)) {
    try {
      while (index > -1) {
        index = word.indexOf(input, index);
        dummy = replaceChar(dummy, e.getKey(), index);
        index++;
      }
    } 
    catch (StringIndexOutOfBoundsException exception) {
      println(exception);
    }
  }

  attempts--;
}

void loadScreen() {
  background(#cccccc);
  fill(#000000);
  textSize(30);
  textAlign(CENTER);
  text("Du hast " + attempts + " Versuche", width/2, 50);
  text(dummy, width/2, 250);
}

void draw() {
  loadScreen();
  
  if (dummy.equals(word)) {
    background(#00ff00);
    text(attempts + " Versuch(e) wurden nicht verbraucht", width/2, 50);
    text("Das Wort war: " + word, width/2, height/2);
  }
  
  if (attempts <= 0) {
    background(#ff0000);
    text("Verloren!", width/2, 50);
    text("Das Wort war: " + word, width/2, height/2);
  }
}

String replaceChar(String s, char ch, int index) {
  StringBuilder str = new StringBuilder(s);
  str.setCharAt(index, ch);
  return str.toString();
}
