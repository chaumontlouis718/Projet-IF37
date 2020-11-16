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

public enum ETATSCENARIO1 {
  PRINCIPAL,
  METEO,
  INFORMATION,
  EMAIL,
  METEO_INFORMATION,
  METEO_EMAIL,
}

// enumération pour le scénario 4
public enum ETATS_SCENARIO_4 {
  INTRO,
  ASKED_FOR_METEO,
  ASKED_FOR_METEO_DATED,
}

public enum WEATHER_DATE {
  TODAY,
  TOMORROW,
  AFTER_TOMORROW,
  NEWT_WEEK,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

// enumération pour le scénario 5
public enum ETAT{
  INTRO,
  ENRPROJET,
  AFFIQR, 
  END
}

// enumération pour le scénario 7
public enum ETATSCENARIO7 {
  INTRO,
  SCANQR,
  RECUPINFO,
  AFFINFO,
  END
}

// enumération pour le scénario 8
public enum ETATS_SCENARIO_8 {
  INTRO,
  SHARE_LEFT_LOADING,
  SHARE_LEFT_LOADED,
  SHARE_RIGHT_LOADING,
  SHARE_RIGHT_LOADED
}

public enum ENTREESELCTIONNEE {
  UTILISATEUR,
  SAUVEGARDE,
  NONE // quand rien est renseigné
}
