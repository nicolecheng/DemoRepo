boolean moveOn; // is the user allowed to move onto next scene?
boolean hangman = false; //  still in the game?
boolean kitten = false;
int environ = 0;

void setup(){
  size(800,600);
  if (environ==0){
    tutorialSetup();
  }else if(environ==1){
    desktopSetup();
  }else if(environ==2){
    kittenSetup();
  }else if(environ==3){
    hangmanSetup();
  }
}

void mouseClicked(){
  if(moveOn){
    s++;
  }
    if (s==1){
    s1Setup();
    scene1();
  }else if (s==4){
    environ = 1;
    desktopSetup();
  }  
  if(overHangman){
    hangman = true;
    environ = 2;
    overHangman = false;
  }else if(overKittendrop){
    kitten = true;
    environ = 3; 
    moveOn=true;
    overKittendrop=false;
  }else if(environ==2 && moveOn && hangman){
    hangmanSetup();
    moveOn = false;
  //}else if(environ==3 && !(kitten)){
  //  environ=1;
  //  desktopSetup();
  //  s=4;
  }else if(environ==3 && moveOn && kitten){
    kittenSetup();
    moveOn = false;
  }
  //if (gameClicks>=2){
  //  if(overHangman){
  //    environ = 2;
  //  }else if(overKittendrop){
  //      environ = 3; 
  //  }
  //}
}

void draw(){
  
  if (s==2){
    scene2();
  }else if (s==3){
    scene3();
  }else if (environ==1){
    desktopDraw();
  }else if(environ==2 && hangman){
    hangmanDraw();
  }else if(environ==3 && kitten){
    kittenDraw();
  }
  
}