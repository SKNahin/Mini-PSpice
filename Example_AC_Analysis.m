clc
clear all
close all
format long

     circuit2=[1 10 4 5 0 0;
               1 20 2 1 0 0;
               1 30 5 6 0 0;
               1 40 3 2 0 0;
               1 50 7 3 0 0;
               1 60 6 9 0 0;
               10 100 4 1 60 pi/4;
               10 120 5 2 120 0;
               11 10 9 3 30 pi/2;
               4 0.5 6 8 7 3;
               8 0.001 6 7 0 0;
               8 0.001 8 3 0 0;
               9 0.1 6 3 0 0];
    
     
      v2=mini_PSpice(circuit2,1,2,1,0.05,0.15);
      v3=mini_PSpice(circuit2,1,3,1,0.05,0.15);
      v4=mini_PSpice(circuit2,1,4,1,0.05,0.15);
      v5=mini_PSpice(circuit2,1,5,1,0.05,0.15);
      v6=mini_PSpice(circuit2,1,6,1,0.05,0.15);
      v7=mini_PSpice(circuit2,1,7,1,0.05,0.15);
      v8=mini_PSpice(circuit2,1,8,1,0.05,0.15);
      v9=mini_PSpice(circuit2,1,9,1,0.05,0.15);
      
      i1=mini_PSpice(circuit2,2,1,0,0.05,0.15);
      i2=mini_PSpice(circuit2,2,2,0,0.05,0.15);
      i3=mini_PSpice(circuit2,2,3,0,0.05,0.15);
      i4=mini_PSpice(circuit2,2,4,0,0.05,0.15);
      i5=mini_PSpice(circuit2,2,5,0,0.05,0.15);
      i6=mini_PSpice(circuit2,2,6,0,0.05,0.15);
      i7=mini_PSpice(circuit2,2,7,0,0.05,0.15);
      i8=mini_PSpice(circuit2,2,8,0,0.05,0.15);
      i9=mini_PSpice(circuit2,2,9,0,0.05,0.15);
      i10=mini_PSpice(circuit2,2,10,0,0.05,0.15);
      i11=mini_PSpice(circuit2,2,11,0,0.05,0.15);
      i12=mini_PSpice(circuit2,2,12,0,0.05,0.15);
      i13=mini_PSpice(circuit2,2,13,0,0.05,0.15);
     
      v73=mini_PSpice(circuit2,1,7,3,0.05,0.15);
      v68=mini_PSpice(circuit2,1,6,8,0.05,0.15);
      
      
      
    t=pointx(1,0.05,0.15);
    plot(t,v6,'.-');
   