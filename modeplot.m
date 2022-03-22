

clear all
clc

N = 1024;
x = linspace(0,pi,N).';


t = linspace(0,1000*pi/2,1000).';
Nmode = 50;
filename = 'testAnimated.gif'; % Specify the output file name
n = 0:0.05:63.5;
nImages = length(n);
h = figure;
for c = 1:numel(n)
    c
    i = n(c);
smat = zeros(N,Nmode);
for mn = 1:Nmode
   smat(:,mn) = sin(mn*pi*x)*sin(mn*i); 
end


tsin = zeros(N,1);
for cc = 1:Nmode
    tsin = tsin + smat(:,cc);
end
plot(x,tsin)
xlim([0 1])
ylim([-50 50])
xlabel('Normalized Cavity Length')
title('PULSE IN A CAVITY')
drawnow()

frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    
    if c == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append');
    end

end
