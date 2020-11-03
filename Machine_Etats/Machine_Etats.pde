import processing.video.*;

Capture cam;
FSM stateMachine;
FSM holdingStatePause;

void setup(){
  size(1800, 850); 
  stateMachine = FSM.INITIAL;
  
  textSize(20);
  stroke(255);
  noFill();
}


void draw() {  
  switch (stateMachine) {
    
    // MENU DE L'APPLICATION
    case INITIAL:
      background(51);
      text("INITIAL", 25,25);
    
      // 1ère ligne
      rect(50,50,350,200,5);
      text("Scénario 1 : Consulter des informations diverses",55,55,345,195);
      rect(500,50,350,200,5);
      text("Scénario 2 : Interagir avec des supports physique types cartes à jouer",505,55,345,195);
      rect(950,50,350,200,5);
      text("Scénario 3 : Synchronisation avec l'agenda de l'utilisateur",955,55,345,195);
      rect(1400,50,350,200,5);
      text("Scénario 4 : Commander l'interface à la voix",1405,55,345,195);
  
      // 2nd ligne
      rect(50,300,350,200,5);
      text("Scénario 5 : Enregistrer son activité depuis son smartphone via un QR Code",55,305,345,195);
      rect(500,300,350,200,5);
      text("Scénario 6 : Transfert de données vers différent support",505,305,345,195);
      rect(950,300,350,200,5);
      text("Scénario 7 : Reprendre son activité avec un enregistrement de QR Code",955,305,345,195);
      rect(1400,300,350,200,5);
      text("Scénario 8 : Échanger des messages avec les voisins/collègues",1405,305,345,195);
      
      break;
    case PAUSE:
      background(51);
      text("PAUSE", 25,25);
      
      rect(50,50,350,100,5);
      text("Revenir au menu initial",65,65,335,85);
      
      break;
      
    case SCENARIO1:
      background(255,0,0);
      text("SCENARIO 1", 25,25);
      
      break;
    case SCENARIO2:
      background(255,0,0);
      text("SCENARIO 2", 25,25);
      
      break;
    case SCENARIO3:
      background(255,0,0);
      text("SCENARIO 3", 25,25);
      
      break;
    case SCENARIO4:
      background(255,0,0);
      text("SCENARIO 4", 25,25);
      
      break;
    case SCENARIO5:
      background(255,0,0);
      text("SCENARIO 5", 25,25);
      
      break;
    case SCENARIO6:
      background(255,0,0);
      text("SCENARIO 6", 25,25);
      
      break;
    case SCENARIO7:
      background(255,0,0);
      text("SCENARIO 7", 25,25);
      
      break;
    case SCENARIO8:
      background(255,0,0);
      text("SCENARIO 8", 25,25);
      
      break;
    default:
      break;
  }
}

void keyPressed(){
  if (key == ESC && stateMachine != FSM.PAUSE && stateMachine != FSM.INITIAL) {
    holdingStatePause = stateMachine;
    stateMachine = FSM.PAUSE;
  } else if (key == ESC && stateMachine == FSM.PAUSE) {
    stateMachine = holdingStatePause;
  }
  key = 0;
}

void mousePressed(){
  switch (stateMachine) {
    case INITIAL:
      if (mouseX > 50 && mouseX < 400 && mouseY > 50 && mouseY < 250) {
        stateMachine = FSM.SCENARIO1;
      } else if (mouseX > 500 && mouseX < 850 && mouseY > 50 && mouseY < 250) {
        stateMachine = FSM.SCENARIO2;
      } else if (mouseX > 950 && mouseX < 1300 && mouseY > 50 && mouseY < 250) {
        stateMachine = FSM.SCENARIO3;
      } else if (mouseX > 1400 && mouseX <1750 && mouseY > 50 && mouseY < 250) {
        stateMachine = FSM.SCENARIO4;
      } else if (mouseX > 50 && mouseX < 400 && mouseY > 300 && mouseY < 500) {
        stateMachine = FSM.SCENARIO5;
      } else if (mouseX > 500 && mouseX < 850 && mouseY >300 && mouseY < 500) {
        stateMachine = FSM.SCENARIO6;
      } else if (mouseX > 950 && mouseX < 1300 && mouseY > 300 && mouseY < 500) {
        stateMachine = FSM.SCENARIO7;
      } else if (mouseX > 1400 && mouseX < 1750 && mouseY > 300 && mouseY < 500) {
        stateMachine = FSM.SCENARIO8;
      }
      
      break;
    case PAUSE:
      if (mouseX > 50 && mouseX < 400 && mouseY > 50 && mouseY < 250) {
        stateMachine = FSM.INITIAL;
      }
      break;
    default:
      break;
  }
}

void captureEvent(Capture c) 
{
  c.read();
}
