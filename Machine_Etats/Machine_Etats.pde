import processing.video.*;

Capture cam;
FSM stateMachine;
FSM holdingStatePause;

// Variable globale scénario 2
float xCarte1,yCarte1,xCarte2,yCarte2,xCarte3,yCarte3;
int draggingCard = 0;

void setup(){
  size(1800, 850); 

  stateMachine = FSM.INITIAL;


  textSize(20);
  stroke(255);
  noFill();
  
  // Variable globale scénario 2
  xCarte1 = width/4;
  yCarte1 = (height/2)+70;
  xCarte2 = width/4 + 90;
  yCarte2 = (height/2)+70;
  xCarte3 = width/4 + 180;
  yCarte3 = (height/2)+70;
}


void draw() { 
  
  
  switch (stateMachine) {
    
    // MENU DE L'APPLICATION
    case INITIAL:
      drawMain();
      break;
    case PAUSE:
      background(51);
      stroke(255);
      fill(255);
      textAlign(LEFT);
      text("PAUSE", 25,25);
      drawRect(50,50,350,100,"Revenir au menu initial");
 
      break;
      
    case SCENARIO1:
      background(255,0,0);
      text("SCENARIO 1", 25,25);
      
      break;
    case SCENARIO2:
      background(255);
      fill(0);
      textAlign(LEFT);
      text("SCENARIO 2", 25,25);
      
      // Séparation écran
      stroke(0);
      line(width/2,0,width/2,height);
      line(0,height/2,width/2,height/2);
      
      //Table
      fill(150);
      rect(50,(height/2)+50,(width/2)-100,(height/2)-100,20);
      
      fill(255);
      stroke(255,0,0);
      strokeWeight(3);
      rect(70,height-220,200,150,20);
      
      //Les cartes à déplacer
      fill(255,150,25);
      stroke(0);
      
      rect(xCarte1,yCarte1,70,120,2);
      rect(xCarte2,yCarte2,70,120,2);
      rect(xCarte3,yCarte3,70,120,2);
      
      fill(0);
      textAlign(CENTER);
      text("Stats",xCarte1+35,yCarte1+60);
      text("Autre",xCarte2+35,yCarte2+60);
      text("Autre2",xCarte3+35,yCarte3+60);
      
      //Ecran mural
      fill(220);
      stroke(0,200,50);
      rect(50,50,(width/2)-100,(height/2)-100,5);
      fill(0);
      noStroke();
      rect((width/4)-40,(height/2)-50,80,50);
      
      
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
      
      drawScenario5();
      
      break;
    case SCENARIO6:
      background(255,0,0);
      text("SCENARIO 6", 25,25);
      
      break;
    case SCENARIO7:
      drawScenario7();
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
  
   switch (stateMachine) {
    
    // keyPressedSceneXX
    // on nomme comme ca chaque fonction pour chaque scénario
    // comme ca il peut executer que le code la page sur laquelle il se trouve
    case INITIAL:
    break;
    case PAUSE:
    break;
    case SCENARIO1: 
      break;
    case SCENARIO2: 
      break;
    case SCENARIO3: 
      break;
     case SCENARIO4:
      break;
    case SCENARIO5:
      break;
    case SCENARIO6:  
      break;
    case SCENARIO7:  
      break;
    case SCENARIO8:   
      break;
    default:
      break;
   }    
    if (key == ESC && stateMachine != FSM.PAUSE && stateMachine != FSM.INITIAL) {
    holdingStatePause = stateMachine;
    stateMachine = FSM.PAUSE;
  } else if (key == ESC && stateMachine == FSM.PAUSE) {
    stateMachine = holdingStatePause;
  }
  key = 0;

}
void keyTyped(){
  
  switch (stateMachine) {
    
    // keyTypedSceneXX

    case INITIAL:
    break;
    case PAUSE:
    break;
    case SCENARIO1: 
      break;
    case SCENARIO2: 
      break;
    case SCENARIO3: 
      break;
     case SCENARIO4:
      break;
    case SCENARIO5:
     keyTypedScene5();
      break;
    case SCENARIO6:  
      break;
    case SCENARIO7:  
      break;
    case SCENARIO8:   
      break;
    default:
      break;
   }    
  
}



void mousePressed(){
  switch (stateMachine) {
    case INITIAL:
      if (overRect(50,50,350,200)) {
        cursor(ARROW);
        stateMachine = FSM.SCENARIO1;
      } else if (overRect(500,50,350,200)) {
        stateMachine = FSM.SCENARIO2;
      } else if (overRect(950,50,350,200)) {
        stateMachine = FSM.SCENARIO3;
      } else if ((overRect(1400,50,350,200))) {
        stateMachine = FSM.SCENARIO4;
      } else if (overRect(50,300,350,200)) {
        stateMachine = FSM.SCENARIO5;
      } else if (overRect(500,300,350,200)) {
        stateMachine = FSM.SCENARIO6;
      } else if (overRect(950,300,350,200)) {
        stateMachine = FSM.SCENARIO7;
      } else if (overRect(1400,300,350,200)) {
        stateMachine = FSM.SCENARIO8;
      }
      break;
    case PAUSE:
      if (overRect(50,50,350,100)) {
        stateMachine = FSM.INITIAL;
      }
      break;
     case SCENARIO1: 
      break;
    case SCENARIO2: 
      break;
    case SCENARIO3: 
      break;
     case SCENARIO4:
      break;
    case SCENARIO5:
      mousePressedScene5();
      break;
    case SCENARIO6:  
      break;
    case SCENARIO7:  
      break;
    case SCENARIO8:   
      break;
    default:
      break;
  }
}

void mouseReleased() {
  switch (stateMachine) {
    case SCENARIO2:
      if (draggingCard == 1 && xCarte1 > 70 && xCarte1 < 200 && yCarte1 > height-220 && yCarte1 < height-190) {
        
      } else if (draggingCard == 2 && xCarte2 > 70 && xCarte2 < 200 && yCarte2 > height-220 && yCarte2 < height-190) {
      
      } else if (draggingCard == 3 && xCarte3 > 70 && xCarte3 < 200 && yCarte3 > height-220 && yCarte3 < height-190) {
      
      }
      draggingCard = 0;
      break;
    default:
      break;
  }
}

void mouseDragged() {
  switch (stateMachine) {
    case SCENARIO2:
      if ((draggingCard == 1 || draggingCard == 0) && mouseX > xCarte1 && mouseX < xCarte1+70 && mouseY >yCarte1 && mouseY < yCarte1+120) {
        draggingCard = 1;
        xCarte1 = mouseX - 35;
        yCarte1 = mouseY - 60;
      } else if ((draggingCard == 2 || draggingCard == 0) && mouseX > xCarte2 && mouseX < xCarte2+70 && mouseY >yCarte2 && mouseY < yCarte2+120) {
        draggingCard = 2;
        xCarte2 = mouseX - 35;
        yCarte2 = mouseY - 60;
      } else if ((draggingCard == 3 || draggingCard == 0) && mouseX > xCarte3 && mouseX < xCarte3+70 && mouseY >yCarte3 && mouseY < yCarte3+120) {
        draggingCard = 3;
        xCarte3 = mouseX - 35;
        yCarte3 = mouseY - 60;
      }
      break;
    default:
      break;
  }
}

void drawMain(){
  // fonctionn qui dessine le menu principal
  background(51);      
  fill(255);
  textAlign(LEFT);
  text("INITIAL", 25,25);
  
  stroke(255);
       
  if (
       // 1ère ligne 
      drawRect(50,50,350,200, "Scénario 1 : Consulter des informations diverses")&     
      drawRect(500,50,350,200,"Scénario 2 : Interagir avec des supports physique types cartes à jouer")&     
      drawRect(950,50,350,200, "Scénario 3 : Synchronisation avec l'agenda de l'utilisateur")&
      drawRect(1400,50,350,200,"Scénario 4 : Commander l'interface à la voix")&
  
      /* 2nd ligne*/
      
      drawRect(50,300,350,200,"Scénario 5 : Enregistrer son activité depuis son smartphone via un QR Code")&
      drawRect(500,300,350,200,"Scénario 6 : Transfert de données vers différent support")&
      drawRect(950,300,350,200,"Scénario 7 : Reprendre son activité avec un enregistrement de QR Code")&
      drawRect(1400,300,350,200,"Scénario 8 : Échanger des messages avec les voisins/collègues"
     )){
      // si aucun rectangle n'est survolé on met le curseur de base
      cursor(ARROW);
  
  }
      
      
  
 
}






// pour dessiner les rectangles du menu et tester si la souris est dessus
boolean drawRect(int x, int y, int width, int height, String ctn){
      boolean onRect;
      noFill();
      // test si la souris est dessus
      onRect = rectHover(x, y, width, height, #9f9f9f);
      rect(x, y, width, height, 5);
      fill(255);
      text(ctn,x+5, y+5, width-5, height-5);
      return !onRect;
}

boolean rectHover(int x, int y, int width, int height, color hoverColor){
  if(overRect(x, y, width, height)){
    cursor(HAND);
    fill(hoverColor);
    return true;
  }
  return false;
  
}


// permet de tester si la souris est dans une zone ou non
boolean overRect(int x, int y, int width, int height)  {
   boolean isIn = (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height);
  return isIn ;   
}
void captureEvent(Capture c) 
{
  c.read();
}
