




ETATSCENARIO7 etapeScenario7= ETATSCENARIO7.INTRO;
ENTREESELCTIONNEE select7;


boolean affichInfo7 = true;
String svt7 = "Continuer";


void drawScenario7() {
  
  switch (etapeScenario7){
    
    case INTRO:
      //on introduit le scénario
      if (affichInfo7){
        affichInfo7 = false;
        background(51);
        introText7();
      }
    break;
    
    case SCANQR:
    break;
    case AFFINFO:

    break;
    case END:
     
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
  text(svt7, 1200, 530,150,20);
  fill(#ffffff); 
}
  
public void introText7(){

  textSize(19);
  text("Scénario 7 : Reprendre son activité avec un enregistrement de QR Code",550, 30, 700, 50);
  textSize(15);
  text("Vous êtes donc un utilisitateur, qui veut continuer son travail à partir d'un QRcode généré à partir des infos de sauvegarde qu'il avait recu lors de sa derniere connection (voir scénario 5)."+
       "Pour le vrai programme il disposra d'une application sur son smartphone qui pourra le lui sauvegarder, pour le revoir directement, sinon il aura juste à recopier l'id du QRcode pour se reconnecter", 500,200, 600,500);
  



}
