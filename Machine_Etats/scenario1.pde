private PImage imageUtilisateur;
private PImage imageMegaphone;
private PImage imageMeteo;
private PImage imagePosition;
private PImage imageNuage;
private PImage imagePluie;
private PImage imageSoleil;
private PImage imageSuite;
private PImage imageEmail;
private PImage imageCoronavirus;
private ETATSCENARIO1 etatScenario1 = ETATSCENARIO1.PRINCIPAL;

void chargerImagesScenario1() {
  imageUtilisateur = loadImage("ressources/icone_utilisateur.png");
  imageMegaphone = loadImage("ressources/icone_megaphone.png");
  imageMeteo = loadImage("ressources/image_meteo.png");
  imagePosition = loadImage("ressources/icone_position.png");
  imageNuage = loadImage("ressources/icone_nuage.png");
  imagePluie = loadImage("ressources/icone_pluie.png");
  imageSoleil = loadImage("ressources/icone_soleil.png");
  imageSuite = loadImage("ressources/icone_suite.png");
  imageEmail = loadImage("ressources/icone_email.png");
  imageCoronavirus = loadImage("ressources/image_coronavirus.jpg");
}

void drawScenario1() {
  background(220);
  fill(0);
  drawPartieUtilisateur(0, 0);
  drawPartieMeteo(0, 40);
  drawPartieInformations(0, 200);
  drawPartieEmails(0, 420);
  switch (etatScenario1) {
    case METEO:
      drawPartieMeteoComplet(750, 20);
      break;
    case INFORMATION:
      drawPartieDetailInformations(750, 20);
      break;
    case EMAIL:
      drawPartieDetailEmails(750, 20);
      break;
    case METEO_INFORMATION:
      drawPartieMeteoComplet(750, 20);
      drawPartieDetailInformations(750, 230);
      break;
    case METEO_EMAIL:
      drawPartieMeteoComplet(750, 20);
      drawPartieDetailEmails(750, 230);
  }
}

void mousePressedScene1() {
  if (overRect(640, 90, 32, 32)) { // météo
    if (etatScenario1 == ETATSCENARIO1.INFORMATION)
      etatScenario1 = ETATSCENARIO1.METEO_INFORMATION;
    else if (etatScenario1 == ETATSCENARIO1.EMAIL)
      etatScenario1 = ETATSCENARIO1.METEO_EMAIL;
    else
      etatScenario1 = ETATSCENARIO1.METEO;
  }
  else if (overRect(10, 230, 570, 170)) { // information
    if (etatScenario1 == ETATSCENARIO1.METEO || etatScenario1 == ETATSCENARIO1.METEO_EMAIL)
      etatScenario1 = ETATSCENARIO1.METEO_INFORMATION;
    else
      etatScenario1 = ETATSCENARIO1.INFORMATION;
  }
  else if (overRect(10, 460, 630, 160)) { // email
    if (etatScenario1 == ETATSCENARIO1.METEO || etatScenario1 == ETATSCENARIO1.METEO_INFORMATION)
      etatScenario1 = ETATSCENARIO1.METEO_EMAIL;
    else
      etatScenario1 = ETATSCENARIO1.EMAIL;
  }
  else {
    etatScenario1 = ETATSCENARIO1.PRINCIPAL;
  }
}

private void drawPartieUtilisateur(int origineX, int origineY) {
  textAlign(LEFT);
  image(imageUtilisateur, origineX+5, origineY+5, 32, 32);
  textSize(19);
  text("Jean-Jacques", origineX+50, origineY+25);
}

private void drawPartieMeteo(int origineX, int origineY) {
  textAlign(LEFT);
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
  fill(230);
  rect(origineX, origineY, 910, 200, 5);
  
  fill(0);
  textAlign(LEFT);
  textSize(28);
  text("Prévisions météo pour les prochains jours", origineX+20, origineY+40);
  
  textSize(19);
  text(day()+1 + " / " + month(), origineX+50, origineY+80);
  image(imageSoleil, origineX+60, origineY+100, 48, 48);
  text("15°C", origineX+60, origineY+180);
  
  text(day()+2 + " / " + month(), origineX+200, origineY+80);
  image(imageNuage, origineX+210, origineY+100, 48, 48);
  text("13°C", origineX+210, origineY+180);
  
  text(day()+3 + " / " + month(), origineX+350, origineY+80);
  image(imagePluie, origineX+360, origineY+100, 48, 48);
  text("12°C", origineX+360, origineY+180);
  
  text(day()+4 + " / " + month(), origineX+500, origineY+80);
  image(imageSoleil, origineX+510, origineY+100, 48, 48);
  text("9°C", origineX+518, origineY+180);
  
  text(day()+5 + " / " + month(), origineX+650, origineY+80);
  image(imageNuage, origineX+660, origineY+100, 48, 48);
  text("9°C", origineX+668, origineY+180);
  
  text(day()+6 + " / " + month(), origineX+800, origineY+80);
  image(imageNuage, origineX+810, origineY+100, 48, 48);
  text("10°C", origineX+810, origineY+180);
}

private void drawPartieInformations(int origineX, int origineY) {
  textAlign(LEFT);
  textSize(28);
  text("Informations du " + day() + " / " + month() + " / " + year(), origineX+10, origineY+20);
  
  textSize(19);
  image(imageMegaphone, origineX+10, origineY+40, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+60);
  image(imageMegaphone, origineX+10, origineY+80, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+100);
  image(imageMegaphone, origineX+10, origineY+120, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+140);
  image(imageMegaphone, origineX+10, origineY+160, 32, 32);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+60, origineY+180);
}

private void drawPartieDetailInformations(int origineX, int origineY) {
  fill(230);
  rect(origineX, origineY, 910, 600, 5);
  
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text("Nouvelles mesures sanitaires pour la lutte du Covid-19", origineX+450, origineY+30);
  
  textAlign(LEFT);
  textSize(19);
  text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper elit sapien, id\nmalesuada ex ultrices eget. Etiam ut arcu a elit molestie dignissim. Proin velultricies nisl. Sed\nauctor feugiat sapien, ac luctus sapien condimentum ac. Fusce quis accumsan ligula. \nDonec in nisi nec massa efficitur condimentum. Nullam nec lacus vel ipsum vestibulum porta\na vitae neque. Duis at rhoncus sem. Donec eget elementum erat, posuere consectetur lorem.", origineX+20, origineY+80);
  image(imageCoronavirus, origineX+230, origineY+240, 460, 240);
  text("Donec nisi ligula, consequat sit amet erat vitae, accumsan elementum arcu. Mauris ac felis ut\nmi laoreet varius. Sed feugiat pharetra nisl et bibendum.", origineX+20, origineY+520);
}

private void drawPartieEmails(int origineX, int origineY) {
  textAlign(LEFT);
  textSize(28);
  text("E-mails récents", origineX+10, origineY+20);
  textSize(19);
  image(imageEmail, origineX+10, origineY+40, 32, 32);
  text("Candidature pour le poste de vendeur de marrons", origineX+60, origineY+60);
  image(imageEmail, origineX+10, origineY+80, 32, 32);
  text("Candidature pour le poste de vendeur de marrons", origineX+60, origineY+100);
  image(imageEmail, origineX+10, origineY+120, 32, 32);
  text("Candidature pour le poste de vendeur de marrons", origineX+60, origineY+140);
  image(imageEmail, origineX+10, origineY+160, 32, 32);
  text("Candidature pour le poste de vendeur de marrons", origineX+60, origineY+180);
  
  textSize(14);
  text("de Jean Dupond", origineX+530, origineY+60);
  text("de Jean Dupond", origineX+530, origineY+100);
  text("de Jean Dupond", origineX+530, origineY+140);
  text("de Jean Dupond", origineX+530, origineY+180);
}

private void drawPartieDetailEmails(int origineX, int origineY) {
  fill(230);
  rect(origineX, origineY, 910, 600, 5);
  
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text("E-mail", origineX+450, origineY+30);
  
  textAlign(LEFT);
  textSize(19);
  text("De: jean.dupond@mail.net\nÀ: jean-jacques.jackson@mail.net", origineX+20, origineY+80);
  stroke(0);
  line(origineX+20, origineY+140, origineX+880, origineY+140);
  stroke(255);
  
  text("Bonjour,\n\nJe me permets de vous proposer aujourd’hui ma candidature au poste de XXX. Les\ncompétences en XXX, acquises lors de mon diplôme XXX correspondent au descriptif de votre\noffre. En effet, vous indiquez avoir besoin d’une personne maîtrisant XXX, une technique que\nj’ai longuement étudiée lors du module XXX. Mon expérience professionnelle n’est peut être\npas la plus importante. Mais durant mes 7 mois en entreprise, j’ai été amené à exploiter les\ntechniques susnommées avec succès. Cette expérience m’a en outre permis de développer ma\nrigueur, et mon esprit d’équipe. Le projet m’ayant été confié nécessitant de s’entendre\nà plusieurset ayant des enjeux importants pour l’entreprise. J’ai adoré partager, adapter mes\nméthodes pour mener à bien le projet en toute sérénité.\n\nJean Dupond", origineX+20, origineY+180);
}
