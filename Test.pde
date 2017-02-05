
// RectButton but;
// CheckBox ch;
 Keyboard kb;
 //RectButton[] bts = new RectButton [9];
 //RectButton [] btil = new RectButton  [2];
 boolean b;
 float ti;
 boolean til [] = new boolean [2];

void setup () {
  //but = new RectButton (300, 200, 1500, 1000, "Test");
  //ch = new CheckBox  (300, 1200, 600, 1500);
  kb = new Keyboard ();
  kb.SetHide(false);
  /*
  for (int i = 0; i < 3; i++) bts[i] = new RectButton ((i+1)*300, 300, (i+2)*300-20, 580, str (i+1));
  for (int i = 3; i < 6; i++) bts[i] = new RectButton ((i-2)*300, 600, (i-1)*300-20, 880, str (i+1));
  for (int i = 6; i < 9; i++) bts[i] = new RectButton ((i-5)*300, 900, (i-4)*300-20, 1180, str (i+1));
  btil [0] = new RectButton (300, 1600, 600, 1900, "til2");
  btil [1] = new RectButton (650, 1600, 950, 1900, "til4");
  til [0] = false;
  til [1] = false;
  */
  //background (0);
}

void draw () {
  background (0);
  /*
  for (int i = 0; i < 9; i++) bts [i].display ();
  for (int i = 0; i < 2; i++) {
    btil [i].display ();
    if (til [i]) btil [i].SetHide(false);
    if (!til [i]) btil [i].SetHide(true);
  }
  for (int i = 0; i < 9; i++) {
    if (bts [i].onFirstFramePressed ()) {
      if (i == 1 || i == 4) {
        ti = millis ();
      }
      // Condición de salida.
      for (int j = 0; j < 2; j++) {
        til [j] = false;
      }
    }
  }
  for (int i = 0; i < 9; i++) {
    if (bts [i].pressed ()) {
      if (i == 1 || i == 4) {
        if (millis () > ti + 400) {
          if (i == 1) til [0] = true;
          if (i == 4) til [1] = true;
        }
      }
    }
  }
  */
  // Condición de salida:
  
  
  //ch.display ();
  kb.display ();
  //b = kb.GetSeg();
  /*
  if (kb.til [0]) {
    text ("til 0 verdadero", 50, 100); 
  } else {
    text ("til 0 falso", 50, 100);
  }
  */
}

void mousePressed () {
  /*
  if (but.pressed ()) {
    if (!b) {
      background  (0,0,200);
      b = true;
    } else {
      background (0);
      b = false;
    }
  }
  */
  //ch.pressed ();
}

void mouseReleased () {
  kb.released ();
}