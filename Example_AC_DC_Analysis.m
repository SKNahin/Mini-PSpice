clc
clear all
close all
format long;

circuit2=[10 10 2 1 1/pi pi/2;
          11 2 1 3 5/(2*pi) 0;
          8 0.1 1 4 0 0;
          2 5 5 1 0 0;
          9 2 2 3 0 0;
          1 1 3 4 0 0;
          1 4 4 5 0 0];
      
  v34=mini_PSpice(circuit2,1,3,4,5,15);
  
  v2=mini_PSpice(circuit2,1,2,1,5,15);
  v3=mini_PSpice(circuit2,1,3,1,5,15);
  v4=mini_PSpice(circuit2,1,4,1,5,15);
  v5=mini_PSpice(circuit2,1,5,1,5,15);
  
  i1=mini_PSpice(circuit2,2,1,0,5,15);
  i2=mini_PSpice(circuit2,2,2,0,5,15);
  i3=mini_PSpice(circuit2,2,3,0,5,15);
  i4=mini_PSpice(circuit2,2,4,0,5,15);
  i5=mini_PSpice(circuit2,2,5,0,5,15);
  i6=mini_PSpice(circuit2,2,6,0,5,15);
  i7=mini_PSpice(circuit2,2,7,0,5,15);
  
  t=pointx(1,5,15);
  plot(t,v3,'.-');
  
  
  