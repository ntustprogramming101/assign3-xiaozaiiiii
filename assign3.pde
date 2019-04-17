final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;
int grid = 80;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg;
PImage soil0, soil1, soil2, soil3, soil4, soil5;
PImage stone1, stone2;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	
  title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		for(int x = 0; x < width; x += grid){
      for(int y = 160; y < grid*6 ; y += grid){image(soil0, x, y);}
      for(int y = grid*6; y < grid*10 ; y += grid){image(soil1, x, y);}
      for(int y = grid*10; y < grid*14 ; y += grid){image(soil2, x, y);}
      for(int y = grid*14; y < grid*18 ; y += grid){image(soil3, x, y);}
      for(int y = grid*18; y < grid*22 ; y += grid){image(soil4, x, y);}
      for(int y = grid*22; y < grid*26 ; y += grid){image(soil5, x, y);}
    }
    
    //Stone1-8
    for(int x = 0, y = 160, i = 0; i < 8; i++){
      x = i*grid;
      image(stone1,x,y);
      y += grid;
    }
    //Stone9-16
    for(int x = 0, y = 960, i = 0; i < 6; i+=1){
      x = i*grid;
      image(stone1,x,y);
      image(stone1,width-grid-x,y);
      y += grid;
    }
    for(int x = 160, y = 800, i = 0; i < 6; i+=1){
      x = 160 + i*grid;
      image(stone1,x,y);
      image(stone1,width-grid-x,y);
      y += grid;
    }
    for(int x = 0, y = 1280, i = 0; i < 2; i+=1){
      x = i*grid;
      image(stone1,x,y);
      image(stone1,width-grid-x,y);
      y += grid;
    }
    for(int x = 480, y = 800, i = 0; i < 2; i+=1){
      x = 480 + i*grid;
      image(stone1,x,y);
      image(stone1,width-grid-x,y);
      y += grid;
    }
    //Stone17-24
    for(int x = 480, y = 800, i = 0; i < 2; i+=1){
      x = 480 + i*grid;
      image(stone1,x,y);
      image(stone1,width-grid-x,y);
      y += grid;
    }
		// Player

		// Health UI

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
