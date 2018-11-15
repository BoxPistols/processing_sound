import processing.sound.*;

// Add Sound
SoundFile sd1;
SoundFile sd2;
SoundFile sd3;

int scene;

float speedX;

// 半径の値
float radius = 180;

void setup() {
  size(1240, 768, P3D);
  // for Retina
  //pixelDensity(displayDensity());

  sd1 = new SoundFile(this, "org.mp3");
  sd2 = new SoundFile(this, "veil.mp3");  
  sd3 = new SoundFile(this, "elec01.mp3");

  scene = 0;
  speedX = 20;

  sd3.play();
  sd3.loop();
}

void draw() {
  background(0);
  fill(0);
  translate(width/2, height/2, 0);
  // 回転
  rotate(frameCount * 0.002);

  /*
   - 円の半径をr
   - 角度をφ(ファイ)
   - 円周上の点の位置
   - x座標 = r * cos φ
   - y座標 = r * sin φ
   */
  // 360° 10°刻み

  for (int dPhi = 0; dPhi < 360; dPhi += 10) {
    // cos sin を 弧度ラジアンに渡す
    float phi = radians(dPhi);// φ = ラジアン(角度)
    float x = radius * cos(phi); // x = 半径 * cos(φ)
    float y = radius * sin(phi); // y = 半径 * sin(φ)

    //rect(dPhi/ 2, dPhi /2, dPhi / 2, dPhi / 2);

    stroke(100, 200, 180); // 色
    ellipse(x, y, random(180, 360), random(180, 360));

    // 模様
    stroke(200, 100, 0); // 色
    strokeWeight(2); // 太さ
    ellipse(x, y, height/2, height/2);
    //point(x,y,0); // 点: x座標 y座標 > 10+10〜360 z座標:0

    if (scene == 1) {
      if (180 <= dPhi) {
        noFill();
        println(dPhi);
        stroke(60, 180, 200);
        ellipse(x, y, random(480, 720*1.5), random(480, 720*1.5));
      };
    } else if (scene == 2) {
      background(127);
      if (180 <= dPhi) {
        noFill();
        println(dPhi);
        stroke( 140, 180, 200);  
        strokeWeight(2); // 太
        ellipse(x, y, width/ random(3, 5) + dPhi, height/random(3, 5));
      };
    } else if (scene == 3) {
      stroke(100, 100, 50); // 色
      ellipse(x, y, random(140, 160), random(140, 160));
      stroke(200, 100, 0); // 色
      strokeWeight(2); // 太
      ellipse(x, y, height/2, height/2);
    } else if (scene == 4) {

      if (180 >= dPhi) {
        noFill();
        println(dPhi);
        stroke( 200, 120, 180);  
        strokeWeight(6); // 太
        ellipse(x, y, random(360*2, 720*2), random(360*2, 720*2));
      };
    }
  }
}// Key
void keyPressed() {
  if (key == 'a') {
    sd1.play();
    scene = 4;
    sd2.stop();
  }
  if (key == 's') {
    scene = 1;
    sd2.play();
    sd1.stop();
  }
  if (key == 'd') { 
    sd1.stop();
    sd2.stop();
    scene = 3;
  }
  if (key == 'f') {
    sd1.stop();
    sd2.stop();
  }
}
