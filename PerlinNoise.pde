int cols,rows;// number of points
int scl = 40;//Space between points(divisor)



//Number of points calculation(dividend)----------------
int w = 6000;
int h = 6000;
//-----------------------
  
float[][] terrain;
float flying;
float flyingx;
float rotate_cam = 0;



void setup(){
  size(600,600,P3D);

  cols = w/scl;
  rows= h/scl;
  
  
  terrain = new float[cols][rows];//"Tilemap"
  

  frameRate(30);
}



void draw(){
  if(keyPressed){
    if(key == 'A'||key=='a'){
      flyingx-=0.1;
      }
    if (key == 'D'||key =='d'){
      flyingx+=0.1;
      }
    if(key == 'W'||key=='w'){
      flying -=0.1;
      }
    if(key=='S'||key=='s'){
      flying +=0.1;
      }
    if(key == CODED){
      if(key == RIGHT){
        rotate_cam++;
      }
    }
}
  float yoff = flying;
    for(int y = 0; y<rows;y++){
      float xoff=flyingx;
      for(int x = 0; x< cols; x++){
          terrain[x][y] = map(noise(xoff,yoff),0,1,-200,200);
          xoff+=0.1;
      }
    yoff+=0.1;
  }
  
  
  background(0,200,255);
  stroke(255);
  fill(#2ED800);
  translate(width/2,height/2+50);
  rotateX(PI/3);
  
  
  translate(-w/2,-h/2);//centers camera
  for(int y = 0; y<rows-1;y++){//Draws the mountains
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scl, y * scl, terrain[x][y]);
      vertex(x*scl, (y+1) * scl, terrain[x][y + 1]);
    }
    endShape();
  }
  
}




void keyPressed(){
  //switch(key){
  //  case'A':
  //  flyingx-=0.1;
  //  break;
  //  case'S':
  //  flying +=0.1;
  //  break;
  //  case'D':
  //  flyingx-=0.1;
  //  break;
  //  case'W':
  //  flying -=0.1;
  //  break;
  //  case'a':
  //  flyingx-=0.1;
  //  break;
  //  case's':
  //  flying +=0.1;
  //  break;
  //  case'd':
  //  flyingx-=0.1;
  //  break;
  //  case'w':
  //  flying -=0.1;
  //  break;

  //}
}
