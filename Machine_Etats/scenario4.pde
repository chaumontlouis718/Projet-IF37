import java.time.*;
import java.time.format.*;
import java.util.*;
import java.util.regex.*;
import java.time.LocalDateTime;
import java.lang.Math;

import java.awt.Desktop;
import java.net.URI;

import websockets.*;

import guru.ttslib.*;

// Commander l'interface à la voix
// L'utilisateur se rend à la cafétéria interactive
// Il décide de vouloir connaître la météo de demain pour son rendez-vous à
// Troyes
// Il dit à haute voix "Je voudrais connaitre la météo de demain à Troyes"
// La cafétéria interactive traite la demande et affiche sur le mur interactif
// les détails de la météo de Troyes pour les prochains jours
// Le logiciel annonce depuis un haut parleur dans un langage naturel le temps
// qu'il fera demain à Troyes à l'utilisateur
// L'utilisateur quitte la salle

// Alternatifs :
//  3.1. Il dit à haute voix "Je voudrais connaitre la météo à Troyes"
//  4. La cafétéria interactive traite la demande et affiche sur le mur
// interactif les détails de la météo de Troyes pour les prochains jours
//  5. Elle demande à haute voix : "Pour quel jour souhaitez vous connaitre la
// météo de Troyes."
//  6. L'utilisateur répond "Pour demain."
//  7. La cafétéria traite la réponse
//  8. La cafétéria annonce à haute voix la météo de demain à Troyes

private ETATS_SCENARIO_4 step4 = ETATS_SCENARIO_4.INTRO;

private boolean handCursor4 = false;

private String currentSpeechMessage4 = "";
private String message4number1 = "";
private String message4number2 = "";
private String answer4number1 = "";
private String answer4number2 = "";

private WEATHER_DATE weatherDate = null;

private int messageLineHeight = 70;

private WebsocketServer socket4;

TTS tts;

private PImage imageMessage4;
private PImage imageLoading4;

void chargerImagesScenario4() {
  imageMessage4 = loadImage("ressources/message.png");
  imageLoading4 = loadImage("ressources/loading.png");
}

private void speak4(String message) {
  tts.speak(message);
}

void reset4() {
  step4 = ETATS_SCENARIO_4.INTRO;

  currentSpeechMessage4 = "";
  message4number1 = "";
  message4number2 = "";
  answer4number1 = "";
  answer4number2 = "";
  weatherDate = null;
}

void setup4() {
  socket4 = new WebsocketServer(this, 1337, "/Speechwebsocket");

  tts = new TTS();

  reset4();
}

private String makeWeatherSentence() {
  switch (weatherDate) {
    case TODAY:
      return "Aujourd'hui il fait 18°C et il y a quelques nuages.";
    case TOMORROW:
      return "Demain il fera 18°C et il y aura quelques nuages.";
    case AFTER_TOMORROW:
      return "Après-demain il fera 18°C et il y aura quelques nuages.";
    case NEWT_WEEK:
      return "La semaine prochaine il fera 18°C et il y aura quelques nuages.";
    case MONDAY:
      return "Lundi il fera 18°C et il y aura quelques nuages.";
    case TUESDAY:
      return "Mardi il fera 18°C et il y aura quelques nuages.";
    case WEDNESDAY:
      return "Mercredi il fera 18°C et il y aura quelques nuages.";
    case THURSDAY:
      return "Jeudi il fera 18°C et il y aura quelques nuages.";
    case FRIDAY:
      return "Vendredi il fera 18°C et il y aura quelques nuages.";
    case SATURDAY:
      return "Samedi il fera 18°C et il y aura quelques nuages.";
    case SUNDAY:
      return "Dimanche il fera 18°C et il y aura quelques nuages.";
    default:
      return "Désolé je n'ai pas trouvé la météo.";
  }
}

private WEATHER_DATE recognizeWeatherDate(String message) {
  if (Pattern.compile("(?i)aujourd'hui").matcher(message).find()) {
    return WEATHER_DATE.TODAY;
  }

  if (Pattern.compile("(?i)demain").matcher(message).find()) {
    if (Pattern.compile("(?i)après").matcher(message).find()) {
      return WEATHER_DATE.AFTER_TOMORROW;
    } else {
      return WEATHER_DATE.TOMORROW;
    }
  }

  if (
    Pattern.compile("(?i)semaine").matcher(message).find() &&
    Pattern.compile("(?i)prochaine").matcher(message).find()
  ) {
    return WEATHER_DATE.NEWT_WEEK;
  }

  if (Pattern.compile("(?i)lundi").matcher(message).find()) {
    return WEATHER_DATE.MONDAY;
  }

  if (Pattern.compile("(?i)mardi").matcher(message).find()) {
    return WEATHER_DATE.TUESDAY;
  }

  if (Pattern.compile("(?i)mercredi").matcher(message).find()) {
    return WEATHER_DATE.WEDNESDAY;
  }

  if (Pattern.compile("(?i)jeudi").matcher(message).find()) {
    return WEATHER_DATE.THURSDAY;
  }

  if (Pattern.compile("(?i)vendredi").matcher(message).find()) {
    return WEATHER_DATE.FRIDAY;
  }

  if (Pattern.compile("(?i)samedi").matcher(message).find()) {
    return WEATHER_DATE.SATURDAY;
  }

  if (Pattern.compile("(?i)dimanche").matcher(message).find()) {
    return WEATHER_DATE.SUNDAY;
  }

  return null;
}

void webSocketServerEvent(String message) {
  currentSpeechMessage4 = message;

  if (stateMachine == FSM.SCENARIO4) {
    switch (step4) {
      case INTRO:
        if (Pattern.compile("(?i)m[eé]t[ée]o").matcher(message).find()) {
          message4number1 = message;

          weatherDate = recognizeWeatherDate(message);

          if (weatherDate == null) {
            step4 = ETATS_SCENARIO_4.ASKED_FOR_METEO;
            answer4number1 = "Pour quel jour souhaitez-vous connaître la météo ?";
            speak4(answer4number1);
          } else {
            step4 = ETATS_SCENARIO_4.ASKED_FOR_METEO_DATED;
            answer4number1 = makeWeatherSentence();
            speak4(answer4number1);
          }
        }

        break;

      case ASKED_FOR_METEO:
        weatherDate = recognizeWeatherDate(message);

        if (weatherDate != null) {
          message4number2 = message;
          step4 = ETATS_SCENARIO_4.ASKED_FOR_METEO_DATED;
          answer4number2 = makeWeatherSentence();
          speak4(answer4number2);
        }
        break;

      default:
        break;
    }
  }
}

void drawScenario4() {
  handCursor4 = false;

  drawBackground4();

  fill(0);
  textSize(24);

  if (message4number1 != "") {
    image(
      imageMessage4,
      width - 32 - 32,
      50 + messageLineHeight * 1 - 20,
      32,
      32
    );

    textAlign(RIGHT);
    text(
      message4number1,
      width / 2 + 32 + 50,
      50 + messageLineHeight * 1 - 20,
      width / 2 - 32 * 2 - 50 * 2,
      messageLineHeight
    );
  }

  if (answer4number1 != "") {
    image(
      imageMessage4,
      width / 2 + 32,
      50 - 20 + messageLineHeight * 2,
      32,
      32
    );

    textAlign(LEFT);
    text(
      answer4number1,
      width / 2 + 32 + 50,
      50 + messageLineHeight * 2
    );
  }

  if (message4number2 != "") {
    image(
      imageMessage4,
      width - 32 - 32,
      50 + messageLineHeight * 3 - 20,
      32,
      32
    );

    textAlign(RIGHT);
    text(
      message4number2,
      width / 2 + 32 + 50,
      50 + messageLineHeight * 3 - 20,
      width / 2 - 32 * 2 - 50 * 2,
      messageLineHeight
    );
  }

  if (answer4number2 != "") {
    image(
      imageMessage4,
      width / 2 + 32,
      50 - 20 + messageLineHeight * 4,
      32,
      32
    );

    textAlign(LEFT);
    text(
      answer4number2,
      width / 2 + 32 + 50,
      50 + messageLineHeight * 4
    );
  }

  switch (step4) {
    case INTRO:
      break;

    case ASKED_FOR_METEO:
      
      break;

    case ASKED_FOR_METEO_DATED:

      break;

    default:
      break;
  }

  if (handCursor4) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  strokeWeight(3);
}

void mousePressedScene4() {
  if (overRect(32, 710, 180, 40)) {
    reset4();
  }

  switch (step4) {
    case INTRO:
      
      break;
    
    default:
      break;
  }
}

void keyTypedScene4() {
  switch (step4) {
    default:
      break;
  }
}

private void drawBackground4() {
  background(255);
  fill(0);
  textSize(22);
  textAlign(LEFT);
  text("Scénario 4 : Commander l'interface à la voix", 32, 50);
  text("Ouvrir dans Google Chrome la page suivante :", 32, 50 + 35 * 1);
  text("https://www.irit.fr/~Philippe.Truillet/stt.html", 32, 50 + 35 * 2);
  text("Et accepter l'accès au microphone", 32, 50 + 35 * 3);
  text("puis commencer à parler", 32, 50 + 35 * 4);
  text("(ne pas hésiter à raffraîchir la page web si nécessaire)", 32, 50 + 35 * 5);

  text("Exemple de dialogue n°1 :", 32, 50 + 35 * 7);
  text("- Je voudrais connaître la météo pour demain", 32, 50 + 35 * 8);

  text("Exemple de dialogue n°2 :", 32, 50 + 35 * 10);
  text("- Je voudrais connaître la météo", 32, 50 + 35 * 11);
  text("- Pour aujourd'hui", 32, 50 + 35 * 12);

  noStroke();
  fill(135, 221, 255);
  if (overRect(32, 710, 180, 40)) {
    fill(177, 228, 250);
    handCursor4 = true;
  }
  rect(32, 710, 180, 40, 6);
  fill(0);
  textSize(16);
  textAlign(CENTER);
  text("Réinitialiser", 32, 710 + 9, 180, 40);

  textSize(15);
  textAlign(LEFT);
  text("Ce que vous dites :", 32, windowHeight - 55);
  text(currentSpeechMessage4, 32, windowHeight - 35);

  stroke(0);
  strokeWeight(16);
  line(width / 2, 0, width / 2, height);

  image(imageMessage4, width / 2 + 32, 50 - 20, 32, 32);

  textSize(24);
  text("Je vous écoute.", width / 2 + 32 + 50, 50);
}
