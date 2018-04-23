
clear;
% Parte a
a=10;
b=8.6;
c=10;

%Condtctones tntctales 
t(1)=0;
Xo=[2.3];
Yo=[-1.3];
Zo=[10];

%Paso
h=1e-4;
tfinal=100;
N=tfinal/h;

 
for t=1:N
    %K1 de Xo,Yo,Zo
    
    k1X=X(a,b,Xo(t),Yo(t));
    k1Y=Y(c,Xo(t),Zo(t));
    k1Z=Z(b,Xo(t),Yo(t),Zo(t));
    if t==1
        display(k1X)
    end   
    %K2 de Xo,Yo,Zo
    
    k2X=X(a,b,Xo(t)+h/4,Yo(t)+0.25*k1X*h);
    k2Y=Y(c,Xo(t)+h/4,Zo(t)+0.25*k1Y*h);
    k2Z=Z(b,Xo(t)+h/4,Yo(t)+0.25*k1Z*h,Zo(t)+0.25*k1Z*h);
    
    %K3 de Xo,Yo,Zo
    
    k3X=X(a,b,Xo(t)+h/4,Yo(t)+0.125*k1X*h+0.125*k2X*h);
    k3Y=Y(c,Xo(t)+h/4,Zo(t)+k1Y*h*0.125+k2Y*h*0.125);
    k3Z=Z(b,Xo(t)+h/4,Yo(t)+k1Z*h*0.125+k2Z*h*0.125,Zo(t)+k1Z*h*0.125+k2Z*h*0.125);
    
    %K4 de Xo,Yo,Zo
    
    k4X=X(a,b,Xo(t)+h/2,Yo(t)-0.5*k2X*h+k3X*h);
    k4Y=Y(c,Xo(t)+h/2,Zo(t)-k2Y*h*0.5+k3Y*h);
    k4Z=Z(b,Xo(t)+h/2,Yo(t)-k2Z*h*0.5+k3Z*h,Zo(t)-k2Z*h*0.5+k3Z*h);
    
    %K5 de Xo,Yo,Zo
    
    k5X=X(a,b,Xo(t)+3*h/4,Yo(t)+0.1875*k1X*h+0.5625*k4X*h);
    k5Y=Y(c,Xo(t)+3*h/4,Zo(t)+0.1875*k1Y*h+k4Y*h*0.5625);
    k5Z=Z(b,Xo(t)+3*h/4,Yo(t)+0.1875*k1Z*h+k4Z*h*0.5625,Zo(t)+k1Z*h*0.1875+k4Z*h*0.5625);
    
    %K6 de Xo,Yo,Zo
   
    k6X=X(a,b,Xo(t)+h,Yo(t)-(3/7)*k1X*h+(2/7)*k2X*h+(12/7)*k3X*h-(12/7)*k4X*h+(8/7)*k5X*h);
    k6Y=Y(c,Xo(t)+h,Zo(t)-(3/7)*k1Y*h+(2/7)*k2Y*h+(12/7)*k3Y*h-(12/7)*k4Y*h+(8/7)*k5Y*h);
    k6Z=Z(b,Xo(t)+h,Yo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h,Zo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h);     
   
    %Valores de Xo,Yo,Zo(t+1)
    
    Xo(t+1)=Xo(t)+0.9*(7*k1X+32*k3X+12*k4X+32*k5X+7*k6X)*h;
    Yo(t+1)=Yo(t)+0.9*(7*k1Y+32*k3Y+12*k4Y+32*k5Y+7*k6Y)*h;
    Zo(t+1)=Zo(t)+0.9*(7*k1Z+32*k3Z+12*k4Z+32*k5Z+7*k6Z)*h;

end

% to = 0:0.0001:100;
% fig= figure(1)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(-18,28)
% colorbar
% 
% fig= figure(2)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,0)
% colorbar
% fig=figure(3)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,90)
% colorbar
% fig=figure(4)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% 
Xf = Xo(1,end)
Yf = Yo(1,end)
Zf = Zo(1,end)
% 
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% Xf = Xo(1,end)
% Yf = Yo(1,end)
% Zf = Zo(1,end)


Xv1= Xo(1:2000:100000);
Yv1= Yo(1:10000:100000);
Zv1= Zo(1:10000:100000);

%Parte a con punto inicial diferente

a=10;
b=4.85;
c=10;

%Condtctones tntctales 
t(1)=0;
Xo=[-2.3];
Yo=[1.3];
Zo=[-10];

%Paso
h=1e-4;
tfinal=100;
N=tfinal/h;

 
for t=1:N
    %K1 de Xo,Yo,Zo
    
    k1X=X(a,b,Xo(t),Yo(t));
    k1Y=Y(c,Xo(t),Zo(t));
    k1Z=Z(b,Xo(t),Yo(t),Zo(t));
    if t==1
        display(k1X)
    end   
    %K2 de Xo,Yo,Zo
    
    k2X=X(a,b,Xo(t)+h/4,Yo(t)+0.25*k1X*h);
    k2Y=Y(c,Xo(t)+h/4,Zo(t)+0.25*k1Y*h);
    k2Z=Z(b,Xo(t)+h/4,Yo(t)+0.25*k1Z*h,Zo(t)+0.25*k1Z*h);
    
    %K3 de Xo,Yo,Zo
    
    k3X=X(a,b,Xo(t)+h/4,Yo(t)+0.125*k1X*h+0.125*k2X*h);
    k3Y=Y(c,Xo(t)+h/4,Zo(t)+k1Y*h*0.125+k2Y*h*0.125);
    k3Z=Z(b,Xo(t)+h/4,Yo(t)+k1Z*h*0.125+k2Z*h*0.125,Zo(t)+k1Z*h*0.125+k2Z*h*0.125);
    
    %K4 de Xo,Yo,Zo
    
    k4X=X(a,b,Xo(t)+h/2,Yo(t)-0.5*k2X*h+k3X*h);
    k4Y=Y(c,Xo(t)+h/2,Zo(t)-k2Y*h*0.5+k3Y*h);
    k4Z=Z(b,Xo(t)+h/2,Yo(t)-k2Z*h*0.5+k3Z*h,Zo(t)-k2Z*h*0.5+k3Z*h);
    
    %K5 de Xo,Yo,Zo
    
    k5X=X(a,b,Xo(t)+3*h/4,Yo(t)+0.1875*k1X*h+0.5625*k4X*h);
    k5Y=Y(c,Xo(t)+3*h/4,Zo(t)+0.1875*k1Y*h+k4Y*h*0.5625);
    k5Z=Z(b,Xo(t)+3*h/4,Yo(t)+0.1875*k1Z*h+k4Z*h*0.5625,Zo(t)+k1Z*h*0.1875+k4Z*h*0.5625);
    
    %K6 de Xo,Yo,Zo
   
    k6X=X(a,b,Xo(t)+h,Yo(t)-(3/7)*k1X*h+(2/7)*k2X*h+(12/7)*k3X*h-(12/7)*k4X*h+(8/7)*k5X*h);
    k6Y=Y(c,Xo(t)+h,Zo(t)-(3/7)*k1Y*h+(2/7)*k2Y*h+(12/7)*k3Y*h-(12/7)*k4Y*h+(8/7)*k5Y*h);
    k6Z=Z(b,Xo(t)+h,Yo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h,Zo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h);     
   
    %Valores de Xo,Yo,Zo(t+1)
    
    Xo(t+1)=Xo(t)+0.9*(7*k1X+32*k3X+12*k4X+32*k5X+7*k6X)*h;
    Yo(t+1)=Yo(t)+0.9*(7*k1Y+32*k3Y+12*k4Y+32*k5Y+7*k6Y)*h;
    Zo(t+1)=Zo(t)+0.9*(7*k1Z+32*k3Z+12*k4Z+32*k5Z+7*k6Z)*h;

end
% to = 0:0.0001:100;
% fig= figure(1)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(-18,28)
% colorbar
% 
% fig= figure(2)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,0)
% colorbar
% fig=figure(3)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,90)
% colorbar
% fig=figure(4)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% Xf = Xo(1,end)
% Yf = Yo(1,end)
% Zf = Zo(1,end)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% Xf = Xo(1,end)
% Yf = Yo(1,end)
% Zf = Zo(1,end)

Xv2= Xo(1:2000:100000);
Yv2= Yo(1:10000:100000);
Zv2= Zo(1:10000:100000);

%Parte a con vector inicial 3

a=10;
b=4.85;
c=10;

%Condtctones tntctales 
t(1)=0;
Xo=[-0.1];
Yo=[-1];
Zo=[-1];

%Paso
h=1e-4;
tfinal=100;
N=tfinal/h;

 
for t=1:N
    %K1 de Xo,Yo,Zo
    
    k1X=X(a,b,Xo(t),Yo(t));
    k1Y=Y(c,Xo(t),Zo(t));
    k1Z=Z(b,Xo(t),Yo(t),Zo(t));
    if t==1
        display(k1X)
    end   
    %K2 de Xo,Yo,Zo
    
    k2X=X(a,b,Xo(t)+h/4,Yo(t)+0.25*k1X*h);
    k2Y=Y(c,Xo(t)+h/4,Zo(t)+0.25*k1Y*h);
    k2Z=Z(b,Xo(t)+h/4,Yo(t)+0.25*k1Z*h,Zo(t)+0.25*k1Z*h);
    
    %K3 de Xo,Yo,Zo
    
    k3X=X(a,b,Xo(t)+h/4,Yo(t)+0.125*k1X*h+0.125*k2X*h);
    k3Y=Y(c,Xo(t)+h/4,Zo(t)+k1Y*h*0.125+k2Y*h*0.125);
    k3Z=Z(b,Xo(t)+h/4,Yo(t)+k1Z*h*0.125+k2Z*h*0.125,Zo(t)+k1Z*h*0.125+k2Z*h*0.125);
    
    %K4 de Xo,Yo,Zo
    
    k4X=X(a,b,Xo(t)+h/2,Yo(t)-0.5*k2X*h+k3X*h);
    k4Y=Y(c,Xo(t)+h/2,Zo(t)-k2Y*h*0.5+k3Y*h);
    k4Z=Z(b,Xo(t)+h/2,Yo(t)-k2Z*h*0.5+k3Z*h,Zo(t)-k2Z*h*0.5+k3Z*h);
    
    %K5 de Xo,Yo,Zo
    
    k5X=X(a,b,Xo(t)+3*h/4,Yo(t)+0.1875*k1X*h+0.5625*k4X*h);
    k5Y=Y(c,Xo(t)+3*h/4,Zo(t)+0.1875*k1Y*h+k4Y*h*0.5625);
    k5Z=Z(b,Xo(t)+3*h/4,Yo(t)+0.1875*k1Z*h+k4Z*h*0.5625,Zo(t)+k1Z*h*0.1875+k4Z*h*0.5625);
    
    %K6 de Xo,Yo,Zo
   
    k6X=X(a,b,Xo(t)+h,Yo(t)-(3/7)*k1X*h+(2/7)*k2X*h+(12/7)*k3X*h-(12/7)*k4X*h+(8/7)*k5X*h);
    k6Y=Y(c,Xo(t)+h,Zo(t)-(3/7)*k1Y*h+(2/7)*k2Y*h+(12/7)*k3Y*h-(12/7)*k4Y*h+(8/7)*k5Y*h);
    k6Z=Z(b,Xo(t)+h,Yo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h,Zo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h);     
   
    %Valores de Xo,Yo,Zo(t+1)
    
    Xo(t+1)=Xo(t)+0.9*(7*k1X+32*k3X+12*k4X+32*k5X+7*k6X)*h;
    Yo(t+1)=Yo(t)+0.9*(7*k1Y+32*k3Y+12*k4Y+32*k5Y+7*k6Y)*h;
    Zo(t+1)=Zo(t)+0.9*(7*k1Z+32*k3Z+12*k4Z+32*k5Z+7*k6Z)*h;

end

% to = 0:0.0001:100;
% fig= figure(1)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(-18,28)
% colorbar
% 
% fig= figure(2)
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,0)
% colorbar
% fig=figure(3)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(0,90)
% colorbar
% fig=figure(4)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% Xf = Xo(1,end)
% Yf = Yo(1,end)
% Zf = Zo(1,end)
% 
% surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
% grid on
% xlabel('x(t)')
% ylabel('y(t)')
% zlabel('z(t)')
% view(90,0)
% colorbar
% Xf = Xo(1,end)
% Yf = Yo(1,end)
% Zf = Zo(1,end)

Xv3= Xo(1:2000:100000);
Yv3= Yo(1:1000:100000);
Zv3= Zo(1:1000:100000);

%Vector

tov = 0.1:0.2:10;
size(tov)
size(Xv1)
figure
plot(tov,Xv1);
hold on
plot(tov,Xv2);
hold on
plot(tov,Xv3);






