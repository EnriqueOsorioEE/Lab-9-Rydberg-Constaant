clc
clear
close all

helium(1,:) = [228.23 228.07 227.98 227.73 227 226.95 226.5 226.32 224.6 224.33]; %angle
helium(2,:) = helium(1,:) - 225.3; %to ref angle
helium(3,:) = [388.9 396.5 402.6 438.8 447.1 471.3 492.2 501.5 667.8 706.5]; %wavelength in nm
helium(3,:) = helium(3,:)*(10^-9);

hydrogen(1,:) = [227+49/60,227+9/60,226+5/60,224+34/60]; %angle
hydrogen(2,:) = hydrogen(1,:)-225.3; %to ref angle
hydrogen(3,:) = [410.2 434.1 486.1 656.3]; %wavelength
hydrogen(3,:) = hydrogen(3,:)*(10^-9);

mercury(1,:) = [228.85 227.75 226.5 224.33];
mercury(2,:) = mercury(1,:)-225.3;
mercury(3,:) = [407.8 435.8 491.6 690.7];
mercury(3,:) = mercury(3,:) * (10^-9);

all = [helium,hydrogen,mercury];

red = [656.3 690.7 667.8 706.5];
red = red * (10^-9);
avgRedWavelength = mean(red);
avgRedAngle = (all(find(red(1)==all)-1)+all(find(red(2)==all)-1)+all(find(red(3)==all)-1)+all(find(red(4)==all)-1))/4;

green = [501.5 486.1 491.6 492.2];
green = green * (10^-9);
avgGreenWavelength = mean(green);
avgGreenAngle = (all(find(green(1)==all)-1) + all(find(green(2)==all)-1) + all(find(green(3)==all)-1) +all(find(green(4)==all)-1))/4;

blue = [435.8 447.1 471.3 438.8 434.1];
blue = blue * (10^-9);
avgBlueWavelength = mean(blue);
avgBlueAngle = (all(find(blue(1)==all)-1) +all(find(blue(2)==all)-1) + all(find(blue(3)==all)-1)+ all(find(blue(4)==all)-1)+ all(find(blue(5)==all)-1))/5;

violet = [388.9 396.5 402.6 407.8 410.2];
violet = violet * (10^-9);
avgVioletWavelength = mean(violet);
avgVioletAngle = (all(find(violet(1)==all)-1)+all(find(violet(2)==all)-1)+all(find(violet(3)==all)-1)+all(find(violet(4)==all)-1)+all(find(violet(5)==all)-1))/5;

figure(2)
plot(all(2,:),all(3,:),'*');
hold on

xR = (avgRedAngle-.2:.01:avgRedAngle+.2);
yR = avgRedWavelength * ones(1,41);
plot(xR,yR,'r');

xG = (avgGreenAngle-.2:.01:avgGreenAngle+.2);
yG = avgGreenWavelength * ones(1,41);
plot(xG,yG,'g');

xB = (avgBlueAngle-.2:.01:avgBlueAngle+.2);
yB = avgBlueWavelength * ones(1,41);
plot(xB,yB,'b');

xV = (avgVioletAngle-.2:.01:avgVioletAngle+.2);
yV = avgVioletWavelength * ones(1,41);
plot(xV,yV,'m');

xlabel('Angle In Degrees From 578.0 nm Light','FontSize',16);
ylabel('Wavlength (meters)','FontSize',16);
hold off

figure(3)
newY(1,1) = mean(red);
newY(1,2) = mean(green);
newY(1,3) = mean(blue);
newY(1,4) = mean(violet);
newY = 1./newY;

newX = [3 4 5 6];
newX = newX.^2;
newX = 1./newX;

plot(newX,newY,'o');
hold on
fitlm(newX,newY) % The following is the data from the Linear Regression
% Linear regression model:
%     y ~ 1 + x1
% 
% Estimated Coefficients:
%                     Estimate          SE         tStat       pValue  
%                    ___________    __________    _______    __________
% 
%     (Intercept)     2.7714e+06         55970     49.515    0.00040762
%     x1             -1.1803e+07    8.2027e+05    -14.389     0.0047954
% 
% 
% Number of observations: 4, Error degrees of freedom: 2
% Root Mean Squared Error: 5.22e+04
% R-squared: 0.99,  Adjusted R-Squared: 0.986
% F-statistic vs. constant model: 207, p-value = 0.0048
XX = [0:0.01:0.15];
YY = (XX.*(-1.1803e+07))+2.7714e+06;
plot(XX,YY);
xlabel('1/n^2 (n is principal quantum number)','FontSize',20);
ylabel('1/\lambda (\lambda is the wavelength in meters)','FontSize',20);
legend('Data Points','Linear Regression (y = -1.1803 x 10^7 + 2.7714 x 10^6)','FontSize',16)
hold off





















