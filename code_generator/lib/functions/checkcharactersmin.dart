int checkcharactersmin(bool min, bool may, bool num, bool sym){
  int item = 0;
  if(min)item++;
  if(may)item++;
  if(num)item++;
  if(sym)item++;
  return item;  

}