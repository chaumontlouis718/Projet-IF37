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

private ETATS_SCENARIO_8 step = ETATS_SCENARIO_8.INTRO;

private int hitBoxPadding = 8;

private int deskWidth = windowWidth / 2 - 100;
private int deskHeight = windowHeight - 100 - 200;

private int modalWidth = 300;
private int modalHeight = 300;

private boolean handCursor = false;

private boolean leftShared = false;

private boolean rightShared = false;
private String rightSharedMessage = "Salut Antoine";
private String rightSharedmessageText;

private long loadingStartTime;

private PImage imageKeyboard;
private PImage imageWord;
private PImage imageShare;
private PImage imageMessage;
private PImage imageLoading;

void chargerImagesScenario8() {
  imageKeyboard = loadImage("ressources/keyboard.png");
  imageWord = loadImage("ressources/word.png");
  imageShare = loadImage("ressources/share.png");
  imageMessage = loadImage("ressources/message.png");
  imageLoading = loadImage("ressources/loading.png");
}

private boolean overWithHitBoxPadding(int x, int y, int width, int height) {
  return overRect(
    x - hitBoxPadding,
    y - hitBoxPadding,
    width + 2 * hitBoxPadding,
    height + 2 * hitBoxPadding
  );
}

private void rectWithHitBoxPadding(
  int x,
  int y,
  int width,
  int height,
  int radius
) {
  rect(
    x - hitBoxPadding,
    y - hitBoxPadding,
    width + 2 * hitBoxPadding,
    height + 2 * hitBoxPadding,
    radius
  );

  return;
}

void reset8() {
  step = ETATS_SCENARIO_8.INTRO;

  leftShared = false;

  rightShared = false;
  rightSharedMessage = "Salut Antoine";
}

void drawScenario8() {
  handCursor = false;

  switch (step) {
    case INTRO:
      drawBackground();

      break;

    case SHARE_LEFT_LOADING:
      /** Fake loading timeout */
      if (System.currentTimeMillis() - loadingStartTime > 800) {
        step = ETATS_SCENARIO_8.SHARE_LEFT_LOADED;
      }

      drawBackground();

      drawLeftModal();

      /** Spinner */
      image(
        imageLoading,
        50 + ((deskWidth) - modalWidth) / 2 + modalWidth / 2 - 32 / 2,
        100 + ((deskHeight) - modalHeight) / 2 + modalHeight / 2 - 32 / 2,
        32,
        32
      );

      break;

    case SHARE_LEFT_LOADED:
      drawBackground();

      drawLeftModal();

      fill(0);
      if (overWithHitBoxPadding(
        50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 150 - 18,
        modalWidth - 16 * 2,
        18
      )) {
        fill(31, 109, 255);
        handCursor = true;
      }
      textSize(18);
      textAlign(LEFT);
      text(
        "Mélanie",
        50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 150
      );

      break;

    case SHARE_RIGHT_LOADING:
      /** Fake loading timeout */
      if (System.currentTimeMillis() - loadingStartTime > 800) {
        step = ETATS_SCENARIO_8.SHARE_RIGHT_LOADED;
      }

      drawBackground();

      drawRightModal();

      /** Spinner */
      image(
        imageLoading,
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + modalWidth / 2 - 32 / 2,
        100 + ((deskHeight) - modalHeight) / 2 + modalHeight / 2 - 32 / 2,
        32,
        32
      );

      break;

    case SHARE_RIGHT_LOADED:
      drawBackground();

      drawRightModal();

      fill(0);
      textSize(18);
      textAlign(LEFT);

      text(
        "Message :",
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 100
      );

      rightSharedmessageText = rightSharedMessage;

      if ((System.currentTimeMillis() / 500) % 2 == 0) {
        rightSharedmessageText = rightSharedmessageText + "|";
      }

      text(
        rightSharedmessageText,
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 120,
        modalWidth - 16 * 2,
        100
      );

      text(
        "Choisir le destinataire :",
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 240
      );

      fill(0);
      if (overWithHitBoxPadding(
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 270 - 18,
        modalWidth - 16 * 2,
        18
      )) {
        fill(31, 109, 255);
        handCursor = true;
      }
      textSize(18);
      textAlign(LEFT);
      text(
        "Antoine",
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 270
      );

      break;

    case END:
      background(51);
      text("Fin du Scénario 8", 600, 530, 490, 20);
      break;

    default:
      break;
  }

  if (handCursor) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }

  strokeWeight(3);
}

void mousePressedScene8() {
  switch (step) {
    case INTRO:
      if (!leftShared && overWithHitBoxPadding(400, 150, 32, 32)) {
        step = ETATS_SCENARIO_8.SHARE_LEFT_LOADING;
        loadingStartTime = System.currentTimeMillis();
      }

      if (!rightShared && overWithHitBoxPadding(1000, 150, 32, 32)) {
        step = ETATS_SCENARIO_8.SHARE_RIGHT_LOADING;
        loadingStartTime = System.currentTimeMillis();
      }
      break;

    case SHARE_LEFT_LOADED:
      if (overWithHitBoxPadding(
        50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 150 - 18,
        modalWidth - 16 * 2,
        18
      )) {
        step = ETATS_SCENARIO_8.INTRO;
        leftShared = true;
      }
      break;

    case SHARE_RIGHT_LOADED:
      if (overWithHitBoxPadding(
        windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2 + 16,
        100 + ((deskHeight) - modalHeight) / 2 + 270 - 18,
        modalWidth - 16 * 2,
        18
      )) {
        step = ETATS_SCENARIO_8.INTRO;
        rightShared = true;
      }
      break;
    
    default:
      break;
  }
}

void keyTypedScene8() {
  switch (step) {
    case SHARE_RIGHT_LOADED:
      if (key == BACKSPACE) {
        if (rightSharedMessage.length() > 0) {
          rightSharedMessage = rightSharedMessage.substring(
            0,
            rightSharedMessage.length() - 1
          );
        }
      } else {
        if (rightSharedMessage.length() < 50) {
          rightSharedMessage += key;
        }
      }
      break;
    
    default:
      break;
  }
}

private void drawBackground() {
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

  rect(50, 100, deskWidth, deskHeight, 20);

  rect(width / 2 + 50, 100, deskWidth, deskHeight, 20);

  /** Left desk */
  image(imageWord, 100, 100, 300, 420);
  image(imageKeyboard, 100, 520, 300, 111);

  if (rightShared) {
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
      rightSharedMessage,
      500,
      240
    );
  }

  fill(135, 221, 255);
  if (
    step == ETATS_SCENARIO_8.INTRO &&
    overWithHitBoxPadding(400, 150, 32, 32)
  ) {
    fill(177, 228, 250);
    handCursor = true;
  }
  rectWithHitBoxPadding(400, 150, 32, 32, 6);
  image(imageShare, 400, 150, 32, 32);

  /** Right desk */
  if (leftShared) {
    fill(0, 79, 227);
    textSize(18);
    textAlign(CENTER);
    text(
      "Document partagé par Antoine",
      width / 2 + 500 + 300 / 2,
      200
    );

    image(imageWord, width / 2 + 500, 200, 300, 420);
  }

  fill(135, 221, 255);
  if (
    step == ETATS_SCENARIO_8.INTRO &&
    overWithHitBoxPadding(1000, 150, 32, 32)
  ) {
    fill(177, 228, 250);
    handCursor = true;
  }
  rectWithHitBoxPadding(1000, 150, 32, 32, 6);
  image(imageMessage, 1000, 150, 32, 32);
}

private void drawLeftModal() {
  /** Shadow */
  fill(0, 128);
  rect(50, 100, deskWidth, deskHeight, 20);

  /** Share modal */
  fill(255);
  rect(
    50 + ((deskWidth) - modalWidth) / 2,
    100 + ((deskHeight) - modalHeight) / 2,
    modalWidth,
    modalHeight,
    16
  );

  /** Modal title */
  fill(0);
  textSize(22);
  textAlign(CENTER);
  text(
    "Partager le document",
    50 + ((deskWidth) - modalWidth) / 2,
    100 + ((deskHeight) - modalHeight) / 2 + 26,
    modalWidth,
    100
  );
}

private void drawRightModal() {
  /** Shadow */
  fill(0, 128);
  rect(windowWidth / 2 + 50, 100, deskWidth, deskHeight, 20);

  /** Share modal */
  fill(255);
  rect(
    windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2,
    100 + ((deskHeight) - modalHeight) / 2,
    modalWidth,
    modalHeight,
    16
  );

  /** Modal title */
  fill(0);
  textSize(22);
  textAlign(CENTER);
  text(
    "Envoyer un message",
    windowWidth / 2 + 50 + ((deskWidth) - modalWidth) / 2,
    100 + ((deskHeight) - modalHeight) / 2 + 26,
    modalWidth,
    100
  );
}
