// Poner "capas" para que al pulsar tildes
// no pulse el botón de abajo.


  class Keyboard {
    // Orientado vertical
    boolean show;
    RectButton [] bt = new RectButton [1170];
    float w = float (width);
    float h = float (height);
    float he = 3*h/5;
    float hi = 2*h/5;
    int i1;
    int time;
    byte shift;
    boolean sym;
    boolean [] til = new boolean [5];
    
    Keyboard () {
      // 1a fila. Números.
      for (float i = 0; i < 10; i++) {
        i1 = int (i);
        if (i1 == 0) {
          bt [0] = new RectButton (int (2*w/(11*13)+9*(w/11+w/(11*13))), int (he + 2*hi/(6*11)), int (2*w/(11*13)+w/11+9*(w/11+w/(11*13))), int (he + 2*hi/(6*11) + hi/6), "0", 80);
        } else {
          bt [i1] = new RectButton (int (2*w/(11*13)+(i-1)*(w/11+w/(11*13))), int (he + 2*hi/(6*11)), int (2*w/(11*13)+w/11+(i-1)*(w/11+w/(11*13))), int (he + 2*hi/(6*11) + hi/6), str (i1), 80);
        }
      }
      char [] qwe = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','ñ','z','x','c','v','b','n','m'};
      char [] QWE = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Ñ','Z','X','C','V','B','N','M'};
      // Decido no poner los botones como en el teclado de Android.
      for (float i = 0; i < 10; i++) {
        i1 = int (i);
        bt [i1+10] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6), str (qwe [i1]), 80);
        bt [i1+20] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 2*hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 3*hi/6), str (qwe [i1+10]), 80);
        if (i < 7) bt [i1+30] = new RectButton (int (4*w/(11*13) + 19*w/143 + i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 3*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 4*hi/6), str (qwe [i1+20]), 80);
        bt [i1+44] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6), str (QWE [i1]), 80);
        bt [i1+54] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 2*hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 3*hi/6), str (QWE [i1+10]), 80);
        if (i < 7) bt [i1+64] = new RectButton (int (4*w/(11*13) + 19*w/143 + i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 3*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 4*hi/6), str (QWE [i1+20]), 80);
      }
      // Estos salen siempre.
      bt [37] = new RectButton (int (4*w/(11*13) + 19*w/143 + w/11 + w/(11*13)), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143 + 5*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 5*hi/6), "");
      bt [38] = new RectButton (int (w - (2*w/(11*13) + 19*w/143)), int (he + 7*hi/(6*11) + 4*hi/6), int (w - 2*w/(11*13)), int (he + 7*hi/(6*11) + 5*hi/6), "Intro", 50);
      
      
      bt [37] = new RectButton (int (2*w/(11*13)), int (he + 6*hi/(6*11) + 3*hi/6), int (2*w/(11*13) + 19*w/143), int (he + 6*hi/(6*11) + 4*hi/6), "Shift", 50);
      bt [38] = new RectButton (int (w - (2*w/(11*13) + 19*w/143)), int (he + 6*hi/(6*11) + 3*hi/6), int (w - 2*w/(11*13)), int (he + 6*hi/(6*11) + 4*hi/6), "《--", 70);
      bt [39] = new RectButton (int (2*w/(11*13)), int (he + 7*hi/(6*11) + 4*hi/6), int (2*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 5*hi/6), "Sym", 60);
      // shift = 0, !sym:
      bt [40] = new RectButton (int (4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 5*hi/6), ",", 100);
      // Pongo 40 y 42 juntos.
      bt [42] = new RectButton (int (4*w/(11*13) + 19*w/143 + 6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 5*hi/6), ".", 100);
      
      // En shift
      bt [71] = new RectButton (int (4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 5*hi/6), ";", 100);
      bt [72] = new RectButton (int (4*w/(11*13) + 19*w/143 + 6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 5*hi/6), ":", 100);
      char [] csym = {'+','×','÷','=','%','_','€','¡','!','-','@','#','$','/','^','&','*','¿','?','~','(',')','"','<','>','[',']','{','}'};
      // En symb
      for (float i = 0; i < 10; i++) {
        i1 = int (i);
        bt [i1+73] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6), str (csym [i1]), 80);
        bt [i1+83] = new RectButton (int (2*w/(11*13)+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 2*hi/6), int (2*w/(11*13)+w/11+i*(w/11+w/(11*13))), int (he + 5*hi/(6*11) + 3*hi/6), str (csym [i1+10]), 80);
        if (i < 7) bt [i1+93] = new RectButton (int (4*w/(11*13) + 19*w/143 + i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 3*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+i*(w/11+w/(11*13))), int (he + 6*hi/(6*11) + 4*hi/6), str (csym [i1+20]), 80);
      }
      bt [100] = new RectButton (int (4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 5*hi/6), str (csym [27]), 100);
      bt [101] = new RectButton (int (4*w/(11*13) + 19*w/143 + 6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 4*hi/6), int (w/11 + 4*w/(11*13) + 19*w/143+6*(w/11+w/(11*13))), int (he + 7*hi/(6*11) + 5*hi/6), str (csym [28]), 100);
      bt [102] = new RectButton (int (2*w/(11*13)), int (he + 7*hi/(6*11) + 4*hi/6), int (2*w/(11*13) + 19*w/143), int (he + 7*hi/(6*11) + 5*hi/6), "ABC", 60);
      bt [103] = new RectButton (int (2*w/(11*13)), int (he + 6*hi/(6*11) + 3*hi/6), int (2*w/(11*13) + 19*w/143), int (he + 6*hi/(6*11) + 4*hi/6), "", 50);
      // shift mayusc.
      // bt [146] = new RectButton (int (2*w/(11*13)), int (he + 6*hi/(6*11) + 3*hi/6), int (2*w/(11*13) + 19*w/143), int (he + 6*hi/(6*11) + 4*hi/6), "Shift", 50);
      // Tildes
      bt [104] = new RectButton (int (2*w/(11*13)), int (he + 5*hi/(6*11) + 2*hi/6 -10*hi/(6*11)), int (2*w/(11*13)+w/11), int (he + 5*hi/(6*11) + 3*hi/6 - 10*hi/(6*11)), "á", 80);
      bt [105] = new RectButton (int (2*w/(11*13)+2*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6 -10*hi/(6*11)), int (2*w/(11*13)+w/11+2*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6 -10*hi/(6*11)), "é", 80);
      bt [106] = new RectButton (int (2*w/(11*13)+7*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6 -10*hi/(6*11)), int (2*w/(11*13)+w/11+7*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6 -10*hi/(6*11)), "í", 80);
      bt [107] = new RectButton (int (2*w/(11*13)+8*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6 -10*hi/(6*11)), int (2*w/(11*13)+w/11+8*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6 -10*hi/(6*11)), "ó", 80);
      bt [108] = new RectButton (int (2*w/(11*13)+6*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + hi/6 -10*hi/(6*11)), int (2*w/(11*13)+w/11+6*(w/11+w/(11*13))), int (he + 4*hi/(6*11) + 2*hi/6 -10*hi/(6*11)), "ú", 80);
    }
    
    void display () {
      if (show) {
        background (0);
        for (int i = 0; i < 108; i++) bt [i].display ();
        
        for (int i = 0; i < 10; i++) bt[i].SetHide(false);
        for (int i = 37; i < 40; i++) bt [i].SetHide (false);
        bt [43].SetHide (false);
        if (shift == 0 && !sym) {
          for (int i = 10; i < 37; i++) bt [i].SetHide (false);
          for (int i = 40; i < 43; i++) bt [i].SetHide (true);
          for (int i = 44; i < 73; i++) bt [i].SetHide (true);
          for (int i = 73; i < 104; i++) bt [i].SetHide (true);
        } else if (shift == 1 && !sym) {
          for (int i = 10; i < 37; i++) bt [i].SetHide (true);
          for (int i = 44; i < 73; i++) bt [i].SetHide (false);
          for (int i = 73; i < 104; i++) bt [i].SetHide (true);
        } else {
          for (int i = 10; i < 37; i++) bt [i].SetHide (true);
          for (int i = 44; i < 73; i++) bt [i].SetHide (true);
          for (int i = 73; i < 104; i++) bt [i].SetHide (false);
        } 
        for (int i = 0; i < 5; i++) {
          if (til [i]) {
            bt [104+i].SetHide (false);
          } else {
            bt [104+i].SetHide (true);
          }
        }
        /*
        for (int i = 0; i < 10; i++) bt[i].display();
        if (shift == 0 && !sym) for (int i = 10; i < 37; i++) bt [i].display ();
        for (int i = 37; i < 44; i++) bt [i].display ();
        if (shift == 1 && !sym) for (int i = 44; i < 73; i++) bt [i].display ();
        if (sym) for (int i = 73; i < 104; i++) bt [i].display ();
        for (int i = 0; i < 5; i++) if (til [i]) bt [104+i].display ();
        */
        line (100, 3*height/5, width-100, 3*height/5);
      }
      // Ponerle los condicionales para
      // pulsarlos solo cuando se muestren.
      if (show) {
        for (int i = 0; i < 108; i++) {
          if (bt [i].onFirstFramePressed  ()) {
            time = millis ();
            // Desactiva los cuadros de tildes.
            if (i < 104) for (int j = 0; j < 5; j++) {
              if (til [j]) til [j] = false;
            }
          }
          if (bt [i].pressed ()) {
          // Activa los cuadros de tildes.
            if (i == 20 || i == 12) {
              if (millis () > time+400) {
                if (i == 20) til [0] = true;
                if (i == 12) til [1] = true;
              }
            }
             
          }
        }
          
          /*
          
          if (bt[20].pressed ()) {  // a
            if (!seg) {
              time = millis ();
            }
            seg = true;
            if (millis () > time+500) {
              til [0] = true;
              //bt [10].pressed () = false;
            }
        
          } else {
            if (!bt [104].pressed ()) {
              til [0] = false;
            } else {
              seg = false;
            }
          }
          if (bt[12].pressed ()) {  // e
            if (!seg) {
              time = millis ();
            }
            seg = true;
            if (millis () > time+500) til [1] = true;
          } else {
            if (!bt [105].pressed ()) {
              til [1] = false;
            } else {
              seg = false;
            }
          }
      
          if (bt [104].pressed ()) {  // á
            if (!seg) {
          
            }
          }
          */
          
       // }
      }
    }
    
    void released () {
      if (show) {
        if (bt [37].on ()) {
          if (shift == 0) {
            shift = 1;
          } else {
            shift = 0;
          }
        }
        if (bt [39].on ()) {
          sym = !sym;
          shift = 0;
        }
      }
      for (int i = 0; i < 5; i++) til [i] = false;
    }
    
    public void SetHide (boolean sbol) {
      show = !sbol;
    }
  }
