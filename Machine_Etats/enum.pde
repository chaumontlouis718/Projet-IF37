public enum FSM {
  INITIAL, /* Etat Initial : Menu des différents scénarios ?*/ 
  PAUSE, /* Quand on fait échap, on affiche un menu pour revenir à l'état initial ou reprendre l'état en cours */ 
  SCENARIO1,
  SCENARIO2,
  SCENARIO3,
  SCENARIO4,
  SCENARIO5,
  SCENARIO6,
  SCENARIO7,
  SCENARIO8
}

// enumération pour le scénario 5
public enum ETAT{
  
  INTRO,
  ENRPROJET,
  AFFIQR, 
  END

}

public enum ETATSCENARIO7{
  
  INTRO,
  SCANQR,
  AFFINFO, 
  END

}

public enum ENTREESELCTIONNEE{

  UTILISATEUR,
  SAUVEGARDE, 
  NONE // quand rien est renseigné
}
