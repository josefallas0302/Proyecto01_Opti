Xo =  [1.15];
Yo = [0.73];
Zo = [16.4];
h = 0.0001;
N = (100)/h;
a =35
b =28
c = 3

for t=1:N
    k1x = Kx(Xo(t),Yo(t),a);
    k2x = Kx(Xo(t)+h/2,Yo(t)+k1x*h/2,a);
    k3x = Kx(Xo(t)+h/2,Yo(t)+k2x*h/2,a);
    k4x = Kx(Xo(t)+h, Yo(t)+k3x*h,a);

    k1y = Ky(Xo(t),Yo(t),Zo(t),a,b);
    k2y = Ky(Xo(t)+h/2,Yo(t)+k1y*h/2,Zo(t)+k1y*h/2,a,b);
    k3y = Ky(Xo(t)+h/2,Yo(t)+k2y*h/2,Zo(t)+k2y*h/2,a,b);
    k4y = Ky(Xo(t)+h, Yo(t)+k3y*h,Zo(t)+k3y*h,a,b);

    k1z = Kz(Xo(t),Yo(t),Zo(t),3);
    k2z = Kz(Xo(t)+h/2,Yo(t)+k1z*h/2,Zo(t)+k1z*h/2,c);
    k3z = Kz(Xo(t)+h/2,Yo(t)+k2z*h/2,Zo(t)+k2z*h/2,c);
    k4z = Kz(Xo(t)+h, Yo(t)+k3z*h,Zo(t)+k3z*h,c);

    Xo(t+1) = Xo(t)+ 1/6 *(k1x+2*k2x+2*k3x+k4x)*h;
    Yo(t+1) = Yo(t)+ 1/6 *(k1y+2*k2y+2*k3y+k4y)*h;
    Zo(t+1) = Zo(t)+1/6 * (k1z+2*k2z+2*k3z+k4z)*h;
end

surface([Xo(:),Xo(:)],[Yo(:),Yo(:)],[Zo(:),Zo(:)], [t(:),t(:)])
