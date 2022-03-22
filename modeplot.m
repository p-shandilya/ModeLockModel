

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
%    figure(1)
s1 = sin(pi*x)*sin(i);
s2 = sin(2*pi*x)*sin(2*i);
s3 = sin(3*pi*x)*sin(3*i);
s4 = sin(4*pi*x)*sin(4*i);
s5 = sin(5*pi*x)*sin(5*i);
smat = zeros(N,Nmode);
for mn = 1:Nmode
   smat(:,mn) = sin(mn*pi*x)*sin(mn*i); 
end
% 
% plot(x,s1);
% hold on
% plot(x,s2);
% plot(x,s3);
% plot(x,s4);
% plot(x,s5);
% 
% title(i)
% xlim([0 1])
% ylim([-2 2])
% hold off

tsin = zeros(N,1);
for cc = 1:Nmode
    tsin = tsin + smat(:,cc);
end
%plot(x,s1+s2+s3+s4+s5)
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
