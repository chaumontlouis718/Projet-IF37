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

private ETATS_SCENARIO_8 step8 = ETATS_SCENARIO_8.INTRO;

private int deskWidth8 = windowWidth / 2 - 100;
private int deskHeight8 = windowHeight - 100 - 200;

private int modalWidth8 = 300;
private int modalHeight8 = 300;

private boolean handCursor8 = false;

private boolean leftShared8 = false;

private boolean rightShared8 = false;
private String rightSharedMessage8 = "Salut Antoine";
private String rightSharedmessageText8;

private long loadingStartTime8;

private PImage imageKeyboard8;
private PImage imageWord8;
private PImage imageShare8;
private PImage imageMessage8;
private PImage imageLoading8;

void chargerImagesScenario8() {
  imageKeyboard8 = loadImage("ressources/keyboard.png");
  imageWord8 = loadImage("ressources/word.png");
  imageShare8 = loadImage("ressources/share.png");
  imageMessage8 = loadImage("ressources/message.png");
  imageLoading8 = loadImage("ressources/loading.png");
}

void setup8() {
  step8 = ETATS_SCENARIO_8.INTRO;

  leftShared8 = false;

  rightShared8 = false;
  rightSharedMessage8 = "Salut Antoine";
}

void drawScenario8() {
  handCursor8 = false;

  switch (step8) {
    case INTRO:
      drawBackground8();

      break;

    case SHARE_LEFT_LOADING:
      /** Fake loading timeout */
      if (System.currentTimeMillis() - loadingStartTime8 > 800) {
        step8 = ETATS_SCENARIO_8.SHARE_LEFT_LOADED;
      }

      drawBackground8();

      drawLeftModal8();

      /** Spinner */
      image(
        imageLoading8,
        50 + ((deskWidth8) - modalWidth8) / 2 + modalWidth8 / 2 - 32 / 2,
        100 + ((deskHeight8) - modalHeight8) / 2 + modalHeight8 / 2 - 32 / 2,
        32,
        32
      );

      break;

    case SHARE_LEFT_LOADED:
      drawBackground8();

      drawLeftModal8();

      fill(0);
      if (overWithHitBoxPadding(
        50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 150 - 18,
        modalWidth8 - 16 * 2,
        18
      )) {
        fill(31, 109, 255);
        handCursor8 = true;
      }
      textSize(18);
      textAlign(LEFT);
      text(
        "Mélanie",
        50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 150
      );

      break;

    case SHARE_RIGHT_LOADING:
      /** Fake loading timeout */
      if (System.currentTimeMillis() - loadingStartTime8 > 800) {
        step8 = ETATS_SCENARIO_8.SHARE_RIGHT_LOADED;
      }

      drawBackground8();

      drawRightModal8();

      /** Spinner */
      image(
        imageLoading8,
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + modalWidth8 / 2 - 32 / 2,
        100 + ((deskHeight8) - modalHeight8) / 2 + modalHeight8 / 2 - 32 / 2,
        32,
        32
      );

      break;

    case SHARE_RIGHT_LOADED:
      drawBackground8();

      drawRightModal8();

      fill(0);
      textSize(18);
      textAlign(LEFT);

      text(
        "Message :",
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 100
      );

      rightSharedmessageText8 = rightSharedMessage8;

      if ((System.currentTimeMillis() / 500) % 2 == 0) {
        rightSharedmessageText8 = rightSharedmessageText8 + "|";
      }

      text(
        rightSharedmessageText8,
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 120,
        modalWidth8 - 16 * 2,
        100
      );

      text(
        "Choisir le destinataire :",
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 240
      );

      fill(0);
      if (overWithHitBoxPadding(
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 270 - 18,
        modalWidth8 - 16 * 2,
        18
      )) {
        fill(31, 109, 255);
        handCursor8 = true;
      }
      textSize(18);
      textAlign(LEFT);
      text(
        "Antoine",
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 270
      );

      break;

    default:
      break;
  }

  if (handCursor8) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  strokeWeight(3);
}

void mousePressedScene8() {
  switch (step8) {
    case INTRO:
      if (!leftShared8 && overWithHitBoxPadding(400, 150, 32, 32)) {
        step8 = ETATS_SCENARIO_8.SHARE_LEFT_LOADING;
        loadingStartTime8 = System.currentTimeMillis();
      }

      if (!rightShared8 && overWithHitBoxPadding(1000, 150, 32, 32)) {
        step8 = ETATS_SCENARIO_8.SHARE_RIGHT_LOADING;
        loadingStartTime8 = System.currentTimeMillis();
      }
      break;

    case SHARE_LEFT_LOADED:
      if (overWithHitBoxPadding(
        50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 150 - 18,
        modalWidth8 - 16 * 2,
        18
      )) {
        step8 = ETATS_SCENARIO_8.INTRO;
        leftShared8 = true;
      }
      break;

    case SHARE_RIGHT_LOADED:
      if (overWithHitBoxPadding(
        windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2 + 16,
        100 + ((deskHeight8) - modalHeight8) / 2 + 270 - 18,
        modalWidth8 - 16 * 2,
        18
      )) {
        step8 = ETATS_SCENARIO_8.INTRO;
        rightShared8 = true;
      }
      break;
    
    default:
      break;
  }
}

void keyTypedScene8() {
  switch (step8) {
    case SHARE_RIGHT_LOADED:
      if (key == BACKSPACE) {
        if (rightSharedMessage8.length() > 0) {
          rightSharedMessage8 = rightSharedMessage8.substring(
            0,
            rightSharedMessage8.length() - 1
          );
        }
      } else {
        if (rightSharedMessage8.length() < 50) {
          rightSharedMessage8 += key;
        }
      }
      break;
    
    default:
      break;
  }
}

private void drawBackground8() {
  background(255);
  fill(0);
  textSize(22);
  textAlign(LEFT);
  text("Scénario 8 : Échanger des messages et des documents avec les voisins/collègues", 25, 25);
  
  // Séparation verticale
  stroke(0);
  strokeWeight(16);
  line(width / 2, 0, width / 2, height);

  // Draw users
  noStroke();

  fill(0);
  textSize(18);
  textAlign(CENTER);

  text(
    "Antoine",
    width / 4,
    height - 20
  );

  text(
    "Mélanie",
    3 * width / 4,
    height - 20
  );

  // Draw t-shirts
  fill(177, 228, 250);
  rect(width / 4 - 150, height - 120 - 40, 300, 80, 40);

  fill(177, 228, 250);
  rect(3 * width / 4 - 150, height - 120 - 40, 300, 80, 40);

  // Draw heads
  fill(102, 51, 17);
  circle(width / 4, height - 120, 150);

  fill(247, 217, 119);
  circle(3 * width / 4, height - 120, 150);

  // Draw desks
  fill(250, 231, 177);

  rect(50, 100, deskWidth8, deskHeight8, 20);

  rect(width / 2 + 50, 100, deskWidth8, deskHeight8, 20);

  /** Left desk */
  image(imageWord8, 100, 100, 300, 420);
  image(imageKeyboard8, 100, 520, 300, 111);

  if (rightShared8) {
    fill(0, 79, 227);
    textSize(18);
    textAlign(LEFT);
    text(
      "Message envoyé par Mélanie",
      500,
      200
    );

    fill(0);
    textSize(20);
    textAlign(LEFT);
    text(
      rightSharedMessage8,
      500,
      240,
      280,
      200
    );
  }

  fill(135, 221, 255);
  if (
    step8 == ETATS_SCENARIO_8.INTRO &&
    overWithHitBoxPadding(400, 150, 32, 32)
  ) {
    fill(177, 228, 250);
    handCursor8 = true;
  }
  rectWithHitBoxPadding(400, 150, 32, 32, 6);
  image(imageShare8, 400, 150, 32, 32);

  /** Right desk */
  if (leftShared8) {
    fill(0, 79, 227);
    textSize(18);
    textAlign(CENTER);
    text(
      "Document partagé par Antoine",
      width / 2 + 500 + 300 / 2,
      200
    );

    image(imageWord8, width / 2 + 500, 200, 300, 420);
  }

  fill(135, 221, 255);
  if (
    step8 == ETATS_SCENARIO_8.INTRO &&
    overWithHitBoxPadding(1000, 150, 32, 32)
  ) {
    fill(177, 228, 250);
    handCursor8 = true;
  }
  rectWithHitBoxPadding(1000, 150, 32, 32, 6);
  image(imageMessage8, 1000, 150, 32, 32);
}

private void drawLeftModal8() {
  /** Shadow */
  fill(0, 128);
  rect(50, 100, deskWidth8, deskHeight8, 20);

  /** Share modal */
  fill(255);
  rect(
    50 + ((deskWidth8) - modalWidth8) / 2,
    100 + ((deskHeight8) - modalHeight8) / 2,
    modalWidth8,
    modalHeight8,
    16
  );

  /** Modal title */
  fill(0);
  textSize(22);
  textAlign(CENTER);
  text(
    "Partager le document",
    50 + ((deskWidth8) - modalWidth8) / 2,
    100 + ((deskHeight8) - modalHeight8) / 2 + 26,
    modalWidth8,
    100
  );
}

private void drawRightModal8() {
  /** Shadow */
  fill(0, 128);
  rect(windowWidth / 2 + 50, 100, deskWidth8, deskHeight8, 20);

  /** Share modal */
  fill(255);
  rect(
    windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2,
    100 + ((deskHeight8) - modalHeight8) / 2,
    modalWidth8,
    modalHeight8,
    16
  );

  /** Modal title */
  fill(0);
  textSize(22);
  textAlign(CENTER);
  text(
    "Envoyer un message",
    windowWidth / 2 + 50 + ((deskWidth8) - modalWidth8) / 2,
    100 + ((deskHeight8) - modalHeight8) / 2 + 26,
    modalWidth8,
    100
  );
}
