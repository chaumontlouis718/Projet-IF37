import org.apache.batik.dom.util.*;
import processing.video.*;
import com.google.zxing.*;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.io.FileOutputStream;
import com.google.zxing.client.j2se.*;


BarcodeFormat qrCodeType = BarcodeFormat.QR_CODE;

PImage QrCode;

private void affichQRCODE(){
    
  if(affichInfo){
      // on fait ca pour que ca affiche tout qu'une seule fois et pas à chaque rafraichissement de draw(), ca fait moche et aussi des pertes de performances

      affichInfo = false;
      background(51);
      // ici c'est une url factice, en realité cette url mène vers le liens du projet pour que l'utilisateur puisse le récuperer n'importe ou
      String URL = "https://exampleCloud.com";
      double id = randonNumber(1,Math.pow(10,7));
      // ici on le genere aléatoirement mais pour le vrai programme ca sera l'id unique de chaque sauvegarde pour que le programme puisse le récupérer rapidement
          
      String ctnQRCode =  "Id :" + String.valueOf(id) + "\n"+  
                          "Utilisateur :" + nomUtilisateur +  "\n"+
                          "Sauvegarde :" + nomSav + "\n"+
                          "Date sav :" + dateSav + "\n"+
                          "URL sav :" + URL + "\n"; 
     QRCode(ctnQRCode);                     
      
    text(ctnQRCode,50,120, 640, 100);
    text("Vous pouvez scanner le QRCode", 700, 100, 640, 120);
    image(QrCode, 700,200);
  }               
}

void QRCode(String data) {
  
  int size =400;
  String path = "./QRCode.png";
  
  try{
  
   BitMatrix bitMatrix = new QRCodeWriter().encode(data, BarcodeFormat.QR_CODE, size*3, size*3);
   
   FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
   MatrixToImageWriter.writeToStream(bitMatrix, "png", fileOutputStream);
   fileOutputStream.close(); 
    
  }catch (WriterException e) {
        System.out.println("Could not generate QR Code, WriterException :: " + e.getMessage());
  }catch (IOException e) {
            System.out.println("Could not generate QR Code, IOException :: " + e.getMessage());
  }
  
  QrCode = loadImage(path);
  QrCode.resize( size, size) ;
  
}
double randonNumber(double min, double max){
  return (Math.random()*(max + min -1)+min);  
}

// pour le scénario 7 permet de scanner un Qrcode grace à la Caméra;
