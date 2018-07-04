#include <stdio.h>

int x = 10;
int y = 15;


void f(){
  int x = 666;
  if(y-x){
    // int x = 99;
    int z = x + y;
    printf("z eh %d\n",z);

  }
}

void g(){
  int w;
  w = x;
  printf("w eh %d\n",w);
}

int main(){
  f();
  x = x + 3;
  g();
  return 0;
}
