clc
clear all
m = 1;                   %massa constante
L = 1;                   %tamanho da linha constante
%g = 9.81;                %gravidade constante
h = 0.1; 
tf = 150;            
y0=pi/2;

n=(tf/h) ;               %numero de loops
y(1) = y0;               %angulo theta (amplitude)
w(1) = 0;                  %velocdade angular
t(1) = 0;

for i = 1: n
   tn = t(i);            %autalizando os valores para o loop
   yn = y(i);            %autalizando os valores para o loop
   wn = w(i);            %autalizando os valores para o loop
      
    k1 = h*f(tn,yn,wn);
    l1 = h*g(tn,yn,wn);
    k2 = h*f(tn + h/2, yn + k1/2, wn + l1/2);
    l2 = h*g(tn + h/2, yn + k1/2, wn + l1/2);
    k3 = h*f(tn + h/2, yn + k2/2, wn + l2/2);
    l3 = h*g(tn + h/2, yn + k2/2, wn + l2/2);
    k4 = h*f(tn + h,yn + k3, wn + l3);
    l4 = h*g(tn + h,yn + k3, wn + l3);
    
    k  = (k1 + 2*k2 + 2*k3 + k4)/6;
    l  = (l1 + 2*l2 + 2*l3 + l4)/6;
    
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + k;
    w(i+1) = w(i) + l;
end

    hold on
    figure(1)
    grid on
    plot(t,y,'m')
    xlabel('Tempo de Oscilação')
    ylabel('Amplitude da Oscilação')
    title('Pendulo Simples')
    hold off                            %(Termina essa captura aqui)
    hold on                             %(Para o Diagrama de Fase)
    figure(2)
    plot(y,w,'y')
    xlabel('Posição')
    ylabel('Velocidade Angular')
    title('Diagrama de Fase')

