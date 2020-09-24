int count; int turn = 1; int stoneCounter = 4;
int blackCounter = 2; int whiteCounter = 2;
int[][][] stones = new int[10][10][2];//盤面外は0,1つ目は白黒,2つ目は真偽
int[][] directions = {{1,0},{1,-1},{0,-1},{-1,-1},{-1,0},{-1,1},{0,1},{1,1}};
int[] counters = new int[8];
boolean gameset; boolean pass;

void setup(){
  size(560,700);
  stones[4][5][0] = 1; stones[5][4][0] = 1; stones[4][4][0] = -1; stones[5][5][0] = -1;
  stones[3][4][1] = 1; stones[4][3][1] = 1; stones[5][6][1] = 1; stones[6][5][1] = 1;
}

void draw(){
  background(0,255,0);
  stroke(0);
  for(int i = 1; i <= 9; i++){line(70*i,70,70*i,630); line(0,70*i,560,70*i);}
  noStroke();
  for(int x = 1; x <= 8; x++){
    for(int y = 1; y <= 8; y++){
      switch(stones[x][y][0]){
        case 1: fill(0); break;
        case -1: fill(255); break;
        case 0:
          switch(stones[x][y][1]){
            case 1: fill(0,136,51); break;
            case 0: fill(0,255,0); break;
          }  
      }
      circle(x*70-35,y*70+35,65);
    }
  }
  fill(0); textSize(25); text(blackCounter,10,675);
  fill(255); textSize(25); text(whiteCounter,480,45);
  for(int i = 1; i <= 32-stoneCounter/2; i++){
    noStroke(); fill(255);ellipse(i*14,35,20,70);
    noStroke(); fill(0);ellipse(i*14+7,35,20,70);
  }
  for(int i = 1; i <= 32-(stoneCounter+1)/2; i++){
    noStroke(); fill(255);ellipse(560-i*14,665,20,70);
    noStroke(); fill(0);ellipse(560-i*14-7,665,20,70);
  }
  noStroke(); fill(255,255,0);
  switch(turn){
    case 1:
      ellipse(560-(32-(stoneCounter+1)/2)*14-9,665,20,70); break;
    case -1:
      ellipse((32-stoneCounter/2)*14+9,35,20,70); break;
  }
  if(pass){
    
  } 
  if(gameset){
    
  }
}

void mouseClicked(){
  int x = mouseX/70+1; int y = mouseY/70;
  if(y == 9 || y == 0){}
  else{
    if(pass){pass = false;}
    if(allDirectionJudge(x,y)){
      stones[x][y][0] = turn;
      for(int i = 0; i <= 7; i++){
        for(int j = 1; j <= counters[i]; j++){
          stones[x+directions[i][0]*j][y+directions[i][1]*j][0]=turn;
        }
      }
      blackCounter = 0; whiteCounter = 0;
      for(int x0 = 1; x0 <= 8; x0++){
        for(int y0 = 1; y0 <= 8; y0++){
          switch(stones[x0][y0][0]){
            case 1: blackCounter++; break;
            case -1:whiteCounter++; break;
          }  
        }
      }  
      turn *= -1; stoneCounter++;
    }
    if(passJudge()){
      pass = true; turn *= -1;
      if(passJudge()){
        pass = false; turn *= 0; gameset = true;
      }
    }
  }
}

void keyPressed(){
  for(int x = 1; x <= 8; x++){
    for(int y = 1; y <= 8; y++){
      stones[x][y][0]=0; stones[x][y][1]=0;
    }
  }
  stones[4][5][0] = 1; stones[5][4][0] = 1; stones[4][4][0] = -1; stones[5][5][0] = -1;
  stones[3][4][1] = 1; stones[4][3][1] = 1; stones[5][6][1] = 1; stones[6][5][1] = 1;
  blackCounter = 2; whiteCounter = 2; stoneCounter = 4; turn = 1; pass = false; gameset = false;
}
