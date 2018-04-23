clear;

a=10;
b=4.85;
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
    k1Y=Y(c,Xo(t),Yo(t));
    k1Z=Z(b,Xo(t),Yo(t),Zo(t));
    
    %K2 de Xo,Yo,Zo
    
    k2X=X(a,b,Xo(t)+0.25*k1X*h,Yo(t)+0.25*k1X*h);
    k2Y=Y(c,Xo(t)+0.25*k1Y*h,Zo(t)+0.25*k1Y*h);
    k2Z=Z(b,Xo(t)+0.25*k1Z*h,Yo(t)+0.25*k1Z*h,Zo(t)+0.25*k1Z*h);
    
    %K3 de Xo,Yo,Zo
    
    k3X=X(a,b,Xo(t)+0.25*h,Yo(t)+0.125*k1X*h+0.125*k2X*h);
    k3Y=Y(c,Xo(t)+0.25*h,Zo(t)+k1Y*h*0.125+k2Y*h*0.125);
    k3Z=Z(b,Xo(t)+0.25*h,Yo(t)+k1Z*h*0.125+k2Z*h*0.125,Zo(t)+k1Z*h*0.125+k2Z*h*0.125);
    
    %K4 de Xo,Yo,Zo
    
    k4X=X(a,b,Xo(t)-0.5*k2X*h+k3X*h,Yo(t)-0.5*k2X*h+k3X*h);
    k4Y=Y(c,Xo(t)-k2Y*h*0.5+k3Y*h,Zo(t)-k2Y*h*0.5+k3Y*h);
    k4Z=Z(b,Xo(t)-k2Z*h*0.5+k3Z*h,Yo(t)-k2Z*h*0.5+k3Z*h,Zo(t)-k2Z*h*0.5+k3Z*h);
    
    %K5 de Xo,Yo,Zo
    
    k5X=X(a,b,Xo(t)+0.1875*k1X*h+0.5625*k4X*h,Yo(t)+0.1875*k1X*h+0.5625*k4X*h);
    k5Y=Y(c,Xo(t)+0.1875*k1Y*h+k4Y*h*0.5625,Zo(t)+0.1875*k1Y*h+k4Y*h*0.5625);
    k5Z=Z(b,Xo(t)+0.1875*k1Z*h+k4Z*h*0.5625,Yo(t)+0.1875*k1Z*h+k4Z*h*0.5625,Zo(t)+k1Z*h*0.1875+k4Z*h*0.5625);
    
    %K6 de Xo,Yo,Zo
   
    k6X=X(a,b,Xo(t)-(3/7)*k1X*h+(2/7)*k2X*h+(12/7)*k3X*h-(12/7)*k4X*h+(8/7)*k5X*h,Yo(t)-(3/7)*k1X*h+(2/7)*k2X*h+(12/7)*k3X*h-(12/7)*k4X*h+(8/7)*k5X*h);
    k6Y=Y(c,Xo(t)-(3/7)*k1Y*h+(2/7)*k2Y*h+(12/7)*k3Y*h-(12/7)*k4Y*h+(8/7)*k5Y*h,Zo(t)-(3/7)*k1Y*h+(2/7)*k2Y*h+(12/7)*k3Y*h-(12/7)*k4Y*h+(8/7)*k5Y*h);
    k6Z=Z(b,Xo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h,Yo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h,Zo(t)-(3/7)*k1Z*h+(2/7)*k2Z*h+(12/7)*k3Z*h-(12/7)*k4Z*h+(8/7)*k5Z*h);     
   
    %Valores de Xo,Yo,Zo(t+1)
    
    Xo(t+1)=Xo(t)+0.9*(7*k1X+32*k3X+12*k4X+32*k5X+7*k6X)*h;
    Yo(t+1)=Yo(t)+0.9*(7*k1Y+32*k3Y+12*k4Y+32*k5Y+7*k6Y)*h;
    Zo(t+1)=Zo(t)+0.9*(7*k1Z+32*k3Z+12*k4Z+32*k5Z+7*k6Z)*h;
end

to = 0:0.0001:100;
fig= figure(1)
surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
grid on
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
view(3)

fig= figure(2)
surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
grid on
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
view(0,0)

fig=figure(3)

surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
grid on
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
view(0,90)

fig=figure(4)

surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
grid on
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
view(90,0)

Xf = Xo(1,end)
Xf = Xo(1,end)
Xf = Xo(1,end)

figure
surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [to(:),to(:)],'EdgeColor','flat')
grid on
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')
view(90,0)

Xof = Xo(1,end)
Xof = Xo(1,end)
Xof = Xo(1,end)




