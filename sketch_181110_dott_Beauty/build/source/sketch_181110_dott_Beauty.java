import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_181110_dott_Beauty extends PApplet {

// 半径の値
float radius = 180;

public void setup() {
  
  // for Retina
  // pixelDensity(displayDensity());
}

public void draw() {
  background(255);
  translate(width/2, height/2, 0);
  // 回転
  rotate(frameCount * 0.001f);
  //rotateX(frameCount * 0.02);
  /*
    - 円の半径をr
   - 角度をφ(ファイ)
   - 円周上の点の位置
   - x座標 = r * cos φ
   - y座標 = r * sin φ
   */

  // 360° 10°刻み
  for (int dPhi = 0; dPhi < 360; dPhi += 5) {
    // cos sin を 弧度ラジアンに渡す
    float phi = radians(dPhi);// φ = ラジアン(角度)
    float x = radius * cos(phi); // x = 半径 * cos(φ)
    float y = radius * sin(phi); // y = 半径 * sin(φ)

    //rect(dPhi/ 2, dPhi /2, dPhi / 2, dPhi / 2);

    //if (x <= 180) {
    //  println(x, y);
    //  ellipse(x, y, width/ random(3, 3.2) + dPhi, height/random(3, 3.2));
    //}

    stroke(100, 100, 50); // 色
    ellipse(x, y, random(140, 160), random(140, 160));

    ellipse(x, y, 150, 150);

    // 模様
    stroke(200, 100, 0); // 色
    strokeWeight(1); // 太さ
    ellipse(x, y, height/2, height/2);
    //point(x,y,0); // 点: x座標 y座標 > 10+10〜360 z座標:0
  }
}


// Cube 回転
//Y軸を中心に60度回転した立方体を描画
// void setup() {
//   size(400, 400, P3D);    //P3Dと書くことによって、3D空間であることを明示する
// }
//
// void draw() {
//   background(0);
//   noFill();
//   stroke(200);
//   translate(width/2, height/2);    //立体の中心を画面中央に移動
//   rotateY(frameCount * 0.02);    //Y軸に対して60度回転
//   box(150, 150, 150);    //150 x 150 x 150pxの立方体を描画
//   println();
//   //if(){
//   //}
// }
  public void settings() {  size(1240, 768, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_181110_dott_Beauty" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
