function resultado = g(t,y,w);
 m = 20;
 k = 0.9;
 w = sqrt(k/m);
 A = 2;
 resultado = - w * sin(y);
endfunction