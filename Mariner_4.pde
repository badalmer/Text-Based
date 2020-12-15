///////////////////////////////////
// Brandon A. Dalmer - 2019
// Image transcode - image to text
///////////////////////////////////
int fileNum = 2; // number of files in data
///////////////////////////////////

PImage file[] = new PImage[fileNum];
float code = 0; // color tint 0-255
PrintWriter output;

void setup(){
  size(200,200);
  textSize(32);
  textAlign(CENTER);
  fill(0);
  text("processing", width/2, height/2);
  text("do not close", width/2, height/2+40);
  for(int i = 0; i < fileNum; i++) {
    file[i] = loadImage(i+".jpg");
  }
}

void draw(){
  for(int i = 0; i < fileNum; i++){
    output = createWriter("Mariner_4_output"+i+".txt");
    file[i].loadPixels();
    for(int y = 0; y < file[i].height; y++){
      for(int x = 0; x < file[i].width; x++){
        int loc = x + y*file[i].width;
        float r = red(file[i].pixels[loc]);
        float g = green(file[i].pixels[loc]);
        float b = blue(file[i].pixels[loc]);
        code = (r+g+b)/3; // B&W average
        println(code);
        String txt = nf((int)code, 3);
        output.print(txt+" ");
      }
      output.println();
      output.println();
    }
    output.flush();
    output.close();
  }
  exit();
}
