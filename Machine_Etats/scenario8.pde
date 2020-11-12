import java.time.*;
import java.time.format.*;
import java.util.*;
import java.time.LocalDateTime;
import java.lang.Math;

// Échanger des messages avec les voisins/collègues (même si celui ci n'est pas
// connecté à la table)
// L'utilisateur et son voisin sont connectés à la table
// ou à un autre collègue qui peut ne pas etre connecté à la table à ce moment.
// L'utilisateur souhaite échanger des données avec son voisin/collègue
// L'utilisateur appuie sur le bouton de partage situé sur la table
// La liste des contacts liés à l'utilisateur est affichée
// L'utilisateur appuie sur le contact avec qui il souhaite partager ses données
// Les données sont envoyées au destinataire au moyen de la table

ETATS_SCENARIO_8 etape = ETATS_SCENARIO_8.INTRO;

void drawScenario8() {
  switch (etape) {
    case INTRO:
      drawBackground();
      break;

    case END:
      background(51);
      text("Fin du Scénario 8", 600, 530,500,20);
      break;

    default:
      break;
  }
}

void mousePressedScene8() {
  switch (etape){
    case INTRO:
      break;
    
    default:
      break;
  }
}

void keyTypedScene8() {
  switch (etape){
    case INTRO:
      break;
    
    default:
      break;
  }
}

private void drawBackground() {
  background(255);
  fill(0);
  textAlign(LEFT);
  text("Scénario 8", 25, 25);
  
  // Séparation verticale
  stroke(0);
  strokeWeight(16);
  line(width / 2, 0, width / 2, height);

  // Draw users
  noStroke();

  // Draw t-shirts
  fill(177, 228, 250);
  rect(width / 4 - 150, height - 100 - 40, 300, 80, 40);

  fill(177, 228, 250);
  rect(3 * width / 4 - 150, height - 100 - 40, 300, 80, 40);

  // Draw heads
  fill(102, 51, 17);
  circle(width / 4, height - 100, 150);

  fill(247, 217, 119);
  circle(3 * width / 4, height - 100, 150);

  // Draw desks
  fill(250, 231, 177);

  rect(50, 200, width / 2 - 100, height - 200 - 250, 20);

  rect(width / 2 + 50, 200, width / 2 - 100, height - 200 - 250, 20);

  
  // fill(255);
  // stroke(255,0,0);
  // strokeWeight(3);
  // rect(70,height-220,200,150,20);
  
  // // Les cartes à déplacer
  // fill(255,150,25);
  // stroke(0);
  
  // rect(xCarte1,yCarte1,70,120,2);
  // rect(xCarte2,yCarte2,70,120,2);
  // rect(xCarte3,yCarte3,70,120,2);
  
  // fill(0);
  // textAlign(CENTER);
  // text("Stats",xCarte1+35,yCarte1+60);
  // text("Autre",xCarte2+35,yCarte2+60);
  // text("Autre2",xCarte3+35,yCarte3+60);
  
  // // Ecran mural
  // fill(220);
  // stroke(0, 200, 50);
  // rect(50, 50, (width / 2) - 100, (height / 2) - 100, 5);
  // fill(0);
  // noStroke();
  // rect((width / 4) - 40, (height / 2) - 50, 80, 50);
  
  // //Informations
  // xBloc1 = lerp(xBloc1, xBloc1Dest, 0.15);
  // yBloc1 = lerp(yBloc1, yBloc1Dest, 0.15);
  // xBloc2 = lerp(xBloc2, xBloc2Dest, 0.15);
  // yBloc2 = lerp(yBloc2, yBloc2Dest, 0.15);
  // xBloc3 = lerp(xBloc3, xBloc3Dest, 0.15);
  // yBloc3 = lerp(yBloc3, yBloc3Dest, 0.15);

  // rect(xBloc1, yBloc1, (width / 4) - 100, (height / 2) - 150);
  // rect(xBloc2, yBloc2, (width / 4) - 100, (height / 2) - 150);
  // rect(xBloc3, yBloc3, (width / 4) - 100, (height / 2) - 150);

  strokeWeight(3);
}
