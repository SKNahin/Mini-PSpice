clc
clear all
close all

format long;

circuit_for_LP_HP=[12 10 2 1 0 0;
          1 10^4 2 3 0 0;
          8 560*10^-12 3 1 0 0];


yy23=mini_PSpice(circuit_for_LP_HP,11,2,3,10^2,10^8);
yy31=mini_PSpice(circuit_for_LP_HP,11,3,1,10^2,10^8);

t=pointx(11,10^2,10^8);
figure(1)
semilogx(t,yy23);
figure(2)
semilogx(t,yy31);



circuit_for_BP_BS=[12 10 2 1 0 0;
    1 10^4 2 3 0 0;
    8 10^-9 4 1 0 0;
    9 0.001 3 4 0 0];


y31=mini_PSpice(circuit_for_BP_BS,11,3,1,10,10^9);
y23=mini_PSpice(circuit_for_BP_BS,11,2,3,10,10^9);

t=pointx(11,10,10^9);
figure(3)
semilogx(t,y31);
figure(4)
semilogx(t,y23);