%% This is a script that produces six probability distribution and plots them respectively.
%% Author @Lukasz Siuba
%% Data 9/10/26

%Global Variables. The standard deviation, mean, rate parameter for
%laplace and the positive scale parameter for cauchy
sigma  = 0.5; 
mu = 0; 
c = 0.5; 
s = 1;
 
w = linspace(-2,2,1000); %The range -2 to 2 with 1000 points between

%Function and Figure Calls
figure('Position',[0 1000 1000 500])
tiledlayout(3,2);
nexttile
gaussianDistribution(sigma, mu, w)
nexttile
laplaceDistribution(mu,c,w)
nexttile
exponentialDistribution(w)
nexttile
cauchyDistribution(w,s)
nexttile
uniformDistriubtion(w)
nexttile
jeffreysDistribution(w)



%%Gaussian Distribution
function gaussianDistribution(sigma,mu, w)
p = (2*pi*(sigma)^2)^(-1/2)*exp((-(w-mu).^2)/(2*(sigma)^2)); 
%Plotting
area(w, p, 'FaceColor', '#FF6B6B', 'FaceAlpha', 0.1);
hold on
plot(w,p,'r','LineWidth',3)
fontsize(gca, 14, 'points');
title('Gaussian Distribution', 'FontSize',16, 'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:.2:1.0); ytickformat('%.1f')
%Force axis to follow convention in book
axis([-2 2 0 1.0])
end

%Computes the Laplace distribution and plots
function laplaceDistribution(mu,c,w)
p = (1/(2*c))*exp((-(abs(w-mu)/c)));
%Plotting
area(w, p, 'FaceColor', '#7F00FF', 'FaceAlpha', 0.1);
hold on
plot(w,p,'LineWidth',3,'Color',"#800080")
fontsize(gca, 14, 'points');
title("Laplace Distribution","FontSize",16,'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:.2:1.2); ytickformat('%.1f')
axis([-2 2 0 1.2])
end

%Computes the Exponential distribution and plots
function exponentialDistribution(w)
%Have to force mu to be > 0 for the mean of the exp distribution.
mu = 1;
mask = w >=0;
p = (mask).*(1/mu).*exp(-(w/mu));
%Plotting
area(w, p, 'FaceColor', '#008000', 'FaceAlpha', 0.1);
hold on
plot(w,p,'LineWidth',3,'Color',"#008000")
fontsize(gca, 14, 'points');
title("Exponential  Distribution","FontSize",16,'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:.2:1.2); ytickformat('%.1f')
%Force axis to follow convention in book
axis([-2 2 0 1.2])
end

%Computes the Cauchy distribution and plots
function cauchyDistribution(w,s)
p =s./(pi*(s.^2 + w.^2));
%Plotting
area(w, p, 'FaceColor', '#FFA500', 'FaceAlpha', 0.1);
hold on
plot(w,p,'LineWidth',3,'Color',"#FFA500")
fontsize(gca, 14, 'points');
title("Cauchy Distribution","FontSize",16,'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:.1:0.4); ytickformat('%.1f')
%Force axis to follow convention in book
axis([-2 2 0 0.4])
end

function uniformDistriubtion(w)
%Bounds, check if w is an element within the bounds.
lowerBound = -0.5;
upperBound = 1.5;
isElement = (w >= lowerBound) & (w <= upperBound);
%%Based on the points within our bounds, compute the uniform distribution
p = (isElement).*(1/(upperBound-lowerBound));
%Plotting
area(w, p, 'FaceColor', '#FFFF00', 'FaceAlpha', 0.1);
hold on
plot(w,p,'LineWidth',3,'Color',"#FFFF00")
fontsize(gca,14,'points')
title("Uniform Distribution","FontSize",16,'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:.1:0.6); ytickformat('%.1f')
%Force axis to follow convention in book
axis([-2 2 0 0.6])
end

function jeffreysDistribution(w)
lowerBound = 0.1;
upperBound = 1.5;

c = (1/(log(upperBound/lowerBound)));

isElement = (w >= lowerBound) & (w <= upperBound);
p = (isElement).*(c./w); 
%Plotting
area(w, p, 'FaceColor', '#0000FF', 'FaceAlpha', 0.1);
hold on
plot(w,p,'LineWidth',3,'Color',"#0000FF")
fontsize(gca,14,'points')
title("Jeffreys Distribution","FontSize",16,'FontWeight','bold')
xlabel('w','FontSize',14); xticks(-2:1:2)
ylabel('p(w)','FontSize',14); yticks(0.0:1:4); ytickformat('%.1f')
%Force axis to follow convention in book
axis([-2 2 0 4])
end
