PImage imageSimulation;
PImage imageHorloge;
private ETATSCENARIO3 etatScenario3 = ETATSCENARIO3.PRINCIPAL;

void chargerImagesScenario3() {
  imageSimulation = loadImage("ressources/icone_simulation.png");
  imageHorloge = loadImage("ressources/icone_horloge.png");
}

void drawScenario3() {
  background(220);
  fill(0);
  textSize(19);
  
  fill(150);
  rect(30, 50, width-175, height-100, 20);
  
  drawBoutonNotification(50, 100);
  
  if (etatScenario3 == ETATSCENARIO3.NOTIFICATION) {
    drawNotification(1200, 70);
  }
  
  fill(255);
  stroke(255,0,0);
  strokeWeight(3);
}

private void drawBoutonNotification(int origineX, int origineY) {
  fill(0);
  text("Simuler la notification", origineX+40, origineY+22);
  image(imageSimulation, origineX, origineY, 32, 32);
}

private void drawNotification(int origineX, int origineY) {
  stroke(250);
  strokeWeight(1);
  fill(230);
  rect(origineX, origineY, 400, 110, 10);
  
  image(imageHorloge, origineX+20, origineY+11, 24, 24);
  
  fill(0);
  textSize(19);
  text(hour() + ":" + minute(), origineX+55, origineY+30);
  text("Prochaine réunion dans 5 minutes\nSalle 32", origineX+20, origineY+60);
}

void mousePressedScene3() {
  if (overRect(50, 100, 250, 40)) {
    etatScenario3 = ETATSCENARIO3.NOTIFICATION;
  }
  else if (overRect(1200, 70, 400, 110)) {
    etatScenario3 = ETATSCENARIO3.PRINCIPAL;
  }
}
