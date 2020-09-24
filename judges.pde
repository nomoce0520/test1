int judge(int x,int y,int[] direction,int counter){
  x+=direction[0]; y+=direction[1];
  int stone=stones[x][y][0];
  switch(stone*turn){
    case -1: return(judge(x,y,direction,counter+1));
    case 1: return(counter);
    default: return 0;
  }
}

boolean allDirectionJudge(int x,int y){
  int counter =0;
  for(int i=0;i<=7;i++){
    counters[i]=0;
    if(stones[x][y][0]==0){
      counters[i] = judge(x,y,directions[i],0);
      counter += counters[i];
    }  
  }
  return(counter!=0);
}  

boolean passJudge(){
  int counter=0;
  for(int x0=1;x0<=8;x0++){
    for(int y0=1;y0<=8;y0++){
      stones[x0][y0][1]=0;
      if(allDirectionJudge(x0,y0)){
        stones[x0][y0][1]=1;
        counter+=1;
      }
    }
  }
  return(counter==0);
}
