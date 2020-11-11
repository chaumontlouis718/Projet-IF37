


ETATSCENARIO7 etapeScenario7= ETATSCENARIO7.INTRO;
ENTREESELCTIONNEE select7;


boolean affichInfo7 = true;
String svt7, svt7_1,nomDate ="";
boolean isValide = true;


void drawScenario7() {
  
  switch (etapeScenario7){
    
    case INTRO:
      //on introduit le scénario
      if (affichInfo7){
        svt7 = "J'ai un QrCode";
        svt7_1 = "Je n'ai pas de Qrcode";
        affichInfo7 = false;
        background(51);
        introText7();
      }
       
      fill(#ffffff); 
    break;
    
    case SCANQR:
      svt7_1 = "Essayer de se connecter sans le QRCode";
      svt7= "";
      scanQRCode();
    break;
    case RECUPINFO:
      svt7_1="";
      svt7 = "Valider";
      recupInfo();
    break;
    case AFFINFO:
      if(affichInfo7){
        svt7_1="";
        svt7 = "Continuer";
        background(51);
        affichInfo7 = false;
        affichInfo();
      }  
    break;
    case END:
     if(affichInfo7){
        background(51);
        affichInfo7 = false;
        svt7 = "Retour menu Principal";
        svt7_1= "";
        finScenario7();
     }
    break;
    default:
    break;
    
  }
  
  // bouton "suivant" en bas à droite
  if(changeButton7()){ 
    cursor(HAND);
  }else{ 
    cursor(ARROW);
  }
  // bouton à gauche
  if(overRect(600, 600,500,60)){
        fill(#a8a8a8);   
      }else{
        fill(#ffffff);  
  }
  text(svt7_1, 600, 600,500,60);
  // bouton à droite
  if(overRect(1200, 600,150, 20)){
    fill(#a8a8a8);   
  }else{
    fill(#ffffff);  
  }
  text(svt7, 1200, 600,500,60);
  fill(#ffffff);  
  
}
 
  void mousePressedScene7()
{
  
  
  
  switch (etapeScenario7){
    case INTRO:
  
     if(overRect(1200, 600,500,60)){
       // we click on the button step 2
       setupScene7();
       etapeScenario7 = ETATSCENARIO7.SCANQR;
       cursor(ARROW);
       background(#000000);
     }
     if(overRect(600, 600,500,60)){
       
       etapeScenario7 = ETATSCENARIO7.RECUPINFO;
     }
    break;
    case SCANQR:
      if(overRect(600, 600,500,60)){
       etapeScenario7 = ETATSCENARIO7.RECUPINFO;
     }
    break;
    case RECUPINFO:
      nomUtilisateur = nomUtilisateur.replace("|", "");
      nomSav = nomSav.replace("|", "");
      if(overRect(110, 180, 550,20)){
           nomUtilisateur += "|";
           select = ENTREESELCTIONNEE.UTILISATEUR;
       }
       if(overRect(110, 220, 550,20)){
         nomSav += "|";
         select = ENTREESELCTIONNEE.SAUVEGARDE;
       }
       if(overRect(1200, 600,500,60)){
         if(nomUtilisateur.length() >2 && nomSav.length() >2){
           // we click on the button step 4
           affichInfo7 = true;
           etapeScenario7 = ETATSCENARIO7.END;
         }else{
           affichErreur = true;
         }
       }
  
    break;
    case AFFINFO:
    if(overRect(1200, 600,500,60)){
       // we click on the button step 4 
       affichInfo7 = true;
       etapeScenario7 = ETATSCENARIO7.END;
       }
    break;
    case END:
      
       if(overRect(1200, 600,500,60)){
       // fin du scénario  
       reinitialisation();
       stateMachine = FSM.INITIAL;
       
       }
    break;
    
    default:
    break;
  }
}   


  
public void introText7(){

  textSize(19);
  text("Scénario 7 : Reprendre son activité avec un enregistrement de QR Code",550, 30, 700, 50);
  textSize(15);
  text("Vous êtes donc un utilisateur, qui veut continuer son travail à partir d'un QRcode généré à partir des infos de sauvegarde qu'il avait recu lors de sa derniere connection (voir scénario 5)."+
       "Pour le vrai programme il disposra d'une application sur son smartphone qui pourra le lui sauvegarder, pour le revoir directement, sinon il aura juste à recopier l'id du QRcode pour se reconnecter", 500,200, 600,500);
  
  if(!isValide){
    fill(#ff0000);     
    text("QRcode non valide veuillez réessayer", 1200,20);
    // pour la prochaine tentative
    isValide = true;
  }
  fill(#ffffff);
}
public void recupInfo(){
  background(51);
  textSize(19);
  text("Se Connecter sans QRCode : \n",550, 30, 700, 50);
  textSize(15);
  text("Nom de l'utilisateur : " + nomUtilisateur, 110, 180, 550,20);
  text("Nom de la sauvegarde : " + nomSav, 110, 220, 640,140);
  text("Nb : sur la vraie application, il y aura bien sur un mdp pour se connecter", 400, 530,600,20);
  if(affichErreur){
   fill(#FF0000);
   text("Veuillez remplir les infos demandées", 20,300); 
  }
} 

public void affichInfo(){
  
    textSize(19);
    text("Voici donc les informations récupérées par le QRCode : ",550, 30, 700, 50);
    textSize(15);
    text(rsltQRcode,500,200, 600,500);
    // on récupere le nom utilisateur et de sauvgarde;
    
    // on regarde si le QRcode correspond au format attendu, ici on regarde juste s'il commence par 'id';
    if(rsltQRcode.substring(0,2).toLowerCase().equals("id") == true){
      // QRcode ok
      
      int indexUtiNom = rsltQRcode.indexOf("Utilisateur :");
      int indexSav = rsltQRcode.indexOf("Sauvegarde :");
      int indexDate = rsltQRcode.indexOf("Date sav :");
      int indexUrl = rsltQRcode.indexOf("URL sav :");
      nomUtilisateur= rsltQRcode.substring(indexUtiNom + "Utilisateur :".length(), indexSav -1);
      nomSav = rsltQRcode.substring(indexSav + "Sauvegarde :".length(), indexDate -1);
      nomDate = rsltQRcode.substring(indexDate + "Date sav :".length(), indexUrl -1);
    }else{
      // on renvoie à l'étape précédente
      isValide = true;
      etapeScenario7= ETATSCENARIO7.INTRO;
     
    
    }
    
}
public void finScenario7(){
  
    background(51);
    textSize(19);
    text("Connecté : ",550, 30, 700, 50);
    textSize(15);
    if(nomDate != ""){
      nomDate = "\nDernière Sauvegarde :" + nomDate;
    }
    text("En tant que \nUtilisateur : " + nomUtilisateur +"\net avec\nla Sauvegarde :" + nomSav + nomDate + 
         "\n\n Vous pouvez donc reprendre sereinement votre travail comme vous l'avez laissé.", 300,200,640,550);
    
    text("Fin du Scénario 7", 600, 600,500,20);
    
  
}

public boolean changeButton7(){
  
  if(svt7 != "" && overRect(1200, 600,150, 20)){
    return true;
  }
  if(svt7_1 != "" && overRect(600, 600,500,60)){
   return true; 
  }
  return false;
}
 
