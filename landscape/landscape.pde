// imported a mouse camera! :D
import peasy.*;
import processing.opengl.*;

PImage img;
int[][] values;
float angle;
PeasyCam cam;

void setup() {
  size(1024, 768, OPENGL);
  noFill();
  
  values = new int[width][height];
  cam = new PeasyCam(this, width/2, height/2, 0, 600);
  cam.setMinimumDistance(1);
  cam.setMaximumDistance(2000);

  // Extract the brightness of each pixel in the image
  // and store in the "values" array
  img = loadImage("delta.jpg");
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color pixel = img.pixels[i*img.width + j];
      values[j][i] = int(brightness(pixel));
    }
  }
}

void draw() {
  
  background(0);                     // Set black background
  translate(width/2, height/2, 0);   // Move to the center
  
  // Update the angle
//  angle += 0.025;
//  rotateX(angle);  
  
  // Display the image mass
  for (int i = 0; i < img.height; i += 2) {
    for (int j = 0; j < img.width; j += 2) {
      stroke(values[j][i], 153);
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = -values[j][i]/2;
      float x2 = j-img.width/2;
      float y2 = i-img.height/2;
      float z2 = -values[j][i]/2-4;
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}
