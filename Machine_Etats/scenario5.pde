import java.time.*;
import java.time.format.*;
import java.util.*;
import java.time.LocalDateTime;
import java.lang.Math;

ETAT etapeScenario5 = ETAT.INTRO;
ENTREESELCTIONNEE select;


String nomUtilisateur =" ", nomSav = " ";
String dateSav, ctnQRCode ="";
boolean affichInfo = true, affichErreur = false;
String svt = "Continuer";


void drawScenario5() {
  
  
  switch (etapeScenario5){
    
    case INTRO:
      //on introduit le scénario
      background(51);
      introText();
    break;
    case ENRPROJET:
      // demande les coordonnées de l'utilisateur
      background(51);
      infoUtilisateur();
    break;
    case AFFIQR:
      // on affiche le QRcode pour qu'il puisse le scanner
      /*
        le Qrcode contient le nomUser, idUser, le nom de la sauvgarde/du fichier, un Url pour y avoir acces depuis n'importe quelle machine
        s'il va sur l'url son mot de passe de user lui sera demandé (pour des raisons de sécurité)
      */
      affichQRCODE();
    break;
    case END:
      finScenario5();
    break;
    default:
    break;
    
  }
  // bouton "suivant" en bas à droite
  if(changeCursor()){ 
    cursor(HAND);
  }else{ 
    cursor(ARROW);
  }
  
  if(overRect(1200, 530,150, 20)){
    fill(#a8a8a8);   
  }else{
    fill(#ffffff);  
  }
  text(svt, 1200, 530,150,20);
  fill(#ffffff); 
}


void mousePressedScene5()
{
  
  nomUtilisateur = nomUtilisateur.replace("|", "");
  nomSav = nomSav.replace("|", "");
  switch (etapeScenario5){
    
    case INTRO:
  
     if(overRect(1200, 530,150, 20)){
       // we click on the button step 2
       affichInfo = true;
       // on récupere la date exacte et un nombre aléatoire entre 1 et 10^7)
       dateSav = getDate();
       etapeScenario5 = ETAT.ENRPROJET;
       cursor(ARROW);
       background(#000000);
     }
    break;
    case ENRPROJET:
       if(overRect(110, 180, 550,20)){
         nomUtilisateur += "|";
         select = ENTREESELCTIONNEE.UTILISATEUR;
       }
       if(overRect(110, 220, 550,20)){
         nomSav += "|";
         select = ENTREESELCTIONNEE.SAUVEGARDE;
       }
       
       if(overRect(1200, 530,150, 20)){  
         if(nomUtilisateur.length() >2 && nomSav.length() >2){
           // we click on the button step 3
           etapeScenario5 = ETAT.AFFIQR;
           cursor(ARROW);
           background(#000000);
         }else{
           affichErreur = true;
          }
       }
    break;
    case AFFIQR:
     if(overRect(1200, 530,150, 20)){
       // we click on the button step 4 and the end
      etapeScenario5 = ETAT.END;
     }
    break;
    case END:
      if(overRect(1200, 530,150, 20)){
        reinitialisation();
        stateMachine = FSM.INITIAL;
      }
      break;
    default:
    break;
    
  }


}

void keyTypedScene5() {
 
  switch(select){
    
    case UTILISATEUR:
    
      nomUtilisateur = nomUtilisateur.replace("|", "");
      if (key == BACKSPACE){
        if(nomUtilisateur.length() >0){
          nomUtilisateur = nomUtilisateur.substring(0, nomUtilisateur .length()-1);
          nomUtilisateur += "|";
        }
      }else{
        if(nomUtilisateur.length() <50){
          nomSav = nomSav.replace("|", "");
          nomUtilisateur += key +"|";
        }
      }
      
    break;
    case SAUVEGARDE:
     if (key == BACKSPACE){
        if(nomSav.length() >0){
          nomSav = nomSav.substring(0, nomSav .length()-1);
          nomSav += "|";
        }
    }else{
      if(nomSav.length() <50){
        nomSav = nomSav.replace("|", "");
        nomSav += key + "|";
      }
     }
    break;
    
    case NONE:
      
    break;
    
    default:
    break;

  }
}

public String getDate(){
  
  LocalDateTime date = LocalDateTime.now(); 
  //DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH mm ss dd MM yyyy");
  DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
  
  String dateSav = dateTimeFormatter.format(date);
 // LocalDate dateSav = LocalDate.parse(stringDate, dateTimeFormatter);
  return dateSav;
}

public boolean changeCursor(){
  
  
  // for the button "continuer"
  if(overRect(1200, 530,150, 20)){
    return true;
  }else{
  
    if (etapeScenario5 == ETAT.ENRPROJET){    
      if(overRect(10, 80, 550,20) || overRect(10, 120,550,20) ){   
        return true;
      }
    }   
  }
  return false;
}




private void introText(){

    textSize(19);
    text("Scénario 5 : Enregistrer son activité depuis son smartphone via un QR Code",600, 30, 600, 50);
    textSize(15);
    text("Vous êtes donc un utilisitateur, qui vient de finir son travail et qui souhaite l'enregistrer sur le cloud de l'entreprise et d\'en récupérer une \"clé\" afin de pouvoir le continuer plus tard et/ou ailleurs. ", 400,200, 600,100);
   
}

private void infoUtilisateur(){
  
  textSize(15);
   // on utilise ces rectangles pour mettre à jour ce que l'utilisateur ecrit (sinon il y a toujours l"ancienne chaine de caracteres)
  fill(51);
  noStroke();
  rect(260, 180, 550,20);
  rect(280, 220, 550,20);
  fill(#ffffff);
  
  text("Entrez les informations nécessaire afin d'effectuer une sauvegarde de votre projet", 110,50,640,550);
  text("Nom de l'utilisateur : " + nomUtilisateur, 110, 180, 550,20);
  text("Nom de la sauvegarde : " + nomSav, 110, 220, 640,140);
  text("Date : " + dateSav,110, 350, 640, 270);
  
  if(affichErreur){
   fill(#FF0000);
   text("Veuillez remplir les infos demandées", 10,530); 
  }
  
}

private void finScenario5(){

 background(51);
 svt = "Retour menu Principale"; 
 text("Vous avez donc pu récuperer la sauvegarde grace au QRCode,\nVous pourrez donc continuer votre travail plus tard.", 300,200,640,550);
 text("Fin du Scénario 5", 600, 530,500,20);
}

private void reinitialisation(){
  // on reinitialise toutes les variables globales pour pouvoir refaire le scénario depuis le début sans devoir rouvrir l'application
  etapeScenario5 = ETAT.INTRO;
  etapeScenario7 = ETATSCENARIO7.INTRO;
  nomUtilisateur =" ";
  nomSav = " ";
  ctnQRCode ="";
  affichInfo = true;
  affichInfo7 = true;
  affichErreur = false;
  svt = "Continuer";
  cam.stop();
}
