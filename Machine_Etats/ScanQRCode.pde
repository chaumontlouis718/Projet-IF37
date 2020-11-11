/********************** 
 * QR Code recogniser
 */
 
import processing.video.*;
import com.google.zxing.*;
import java.awt.image.BufferedImage;


com.google.zxing.Reader reader = new com.google.zxing.MultiFormatReader();

String rsltQRcode;
void setupScene7() {

 //printArray(Capture.list());
 // c'est possible ça crash ici de facon aléatoire...
 cam = new Capture(this, Capture.list()[0]);
 cam.start(); // démarrer la caméra

}


void scanQRCode() {
   background(51);
   text("Vous pouvez scanner votre QRCode", 600,40);
   image(cam, 600, 100);
   try
   {
     LuminanceSource source = new BufferedImageLuminanceSource((BufferedImage)cam.getImage());
     BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));    
     Result result = reader.decode(bitmap); 
     
     if (result.getText() != null) 
     { 
       affichInfo7 = true;;
      rsltQRcode = result.getText();
      cam.stop();
      etapeScenario7= ETATSCENARIO7.AFFINFO;
       
       
     }
   } 
   catch (Exception e) {
    
   }   
}
