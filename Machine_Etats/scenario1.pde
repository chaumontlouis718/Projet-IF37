PImage imageUtilisateur;
PImage imageMegaphone;
PImage imageMeteo;
PImage imagePosition;
PImage imageNuage;
PImage imageSoleil;
PImage imageSuite;
PImage imageEmail;
ETATSCENARIO1 etatScenario = ETATSCENARIO1.PRINCIPAL;

void chargerImagesScenario1() {
  imageUtilisateur = loadImage("ressources/icone_utilisateur.png");
  imageMegaphone = loadImage("ressources/icone_megaphone.png");
  imageMeteo = loadImage("ressources/image_meteo.png");
  imagePosition = loadImage("ressources/icone_position.png");
  imageNuage = loadImage("ressources/icone_nuage.png");
  imageSoleil = loadImage("ressources/icone_soleil.png");
  imageSuite = loadImage("ressources/icone_suite.png");
  imageEmail = loadImage("ressources/icone_email.png");
}

void drawScenario1() {
  switch (etatScenario) {
    case PRINCIPAL:
      drawMainScenario1();
      break;
    case METEO:
      drawMeteoScenario1();
      break;
  }
}

void mousePressedScene1() {
  if (overRect(640, 90, 32, 32)) {
    etatScenario = ETATSCENARIO1.METEO;
  }
  else {
    etatScenario = ETATSCENARIO1.PRINCIPAL;
  }
}

void drawMainScenario1() {
  background(220);
  fill(0);
  textAlign(LEFT);
  
  drawPartieUtilisateur(0, 0);
  drawPartieMeteo(0, 40);
  drawPartieInformations(0, 200);
  drawPartieEmails(0, 420);
}

void drawMeteoScenario1() {
  background(220);
  fill(0);
  
  drawPartieUtilisateur(0, 0);
  drawPartieMeteo(0, 40);
  drawPartieMeteoComplet(700, 40);
  drawPartieInformations(0, 200);
  drawPartieEmails(0, 420);
}

private void drawPartieUtilisateur(int origineX, int origineY) {
  image(imageUtilisateur, origineX+5, origineY+5, 32, 32);
  textSize(19);
  text("Jean-Jacques", origineX+50, origineY+25);
}

private void drawPartieMeteo(int origineX, int origineY) {
  textSize(28);
  image(imageMeteo, origineX, origineY, 128, 128);
  text("Météo du jour", origineX+150, origineY+55);
  image(imagePosition, origineX+145, origineY+65, 32, 32);
  textSize(19);
  text("Paris, France", origineX+185, origineY+90);
  
  textAlign(RIGHT);
  text("Matin", origineX+470, origineY+55);
  image(imageNuage, origineX+500, origineY+30, 32, 32);
  text("9°C", origineX+600, origineY+55);
  text("Après-midi", origineX+470, origineY+90);
  image(imageSoleil, origineX+500, origineY+70, 32, 32);
  text("15°C", origineX+600, origineY+90);
  image(imageSuite, origineX+640, origineY+50, 32, 32);
}

private void drawPartieMeteoComplet(int origineX, int origineY) {
  rect(origineX, origineY, 10, 10);
}

private void drawPartieInformations(int origineX, int origineY) {
  textAlign(LEFT);
  textSize(28);
  text("Informations du " + day() + " / " + month() + " / " + year(), origineX+10, origineY+20);
  textSize(19);
  image(imageMegaphone, origineX+10, origineY+40, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+60);
  image(imageMegaphone, origineX+10, origineY+80, 32, 32);
  text("Joe Biden en tête de l'élection présidentielle américaine", origineX+60, origineY+100);
  image(imageMegaphone, origineX+10, origineY+120, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+140);
  image(imageMegaphone, origineX+10, origineY+160, 32, 32);
  text("Joe Biden en tête de l'élection présidentielle américaine", origineX+60, origineY+180);
}

private void drawPartieEmails(int origineX, int origineY) {
  textAlign(LEFT);
  textSize(28);
  text("E-mails récents", origineX+10, origineY+20);
  textSize(19);
  image(imageEmail, origineX+10, origineY+40, 32, 32);
  text("Planification de la réunion hebdomadaire", origineX+60, origineY+60);
  image(imageEmail, origineX+10, origineY+80, 32, 32);
  text("Analyse du marché", origineX+60, origineY+100);
  image(imageEmail, origineX+10, origineY+120, 32, 32);
  text("Planification de la réunion hebdomadaire", origineX+60, origineY+140);
  image(imageEmail, origineX+10, origineY+160, 32, 32);
  text("Analyse du marché", origineX+60, origineY+180);
  
  textSize(14);
  text("de Jean Dupond", origineX+450, origineY+60);
  text("de Pierre Martin", origineX+250, origineY+100);
  text("de Juan Lopez", origineX+450, origineY+140);
  text("de Maxime Lapierre", origineX+250, origineY+180);
}
