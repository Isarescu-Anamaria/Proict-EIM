%numarul de ordine
i = 16;
%turatia motorului
n16 = (66 + 3 * i) * 10;
%modulul
m = 4.5;
%numerele de dinti ale rotilor
z1 = 34;
z2 = 80;
%analiza cinematica a mecanismului cu cama si tachet de translatie
%cursa maxima a tachetului
h = 7 + 0.5 * i;
%unghiul de rotatie al camei corespunzator fazei de urcare
phiu = 66 + i;
%unghiul de rotatie al camei corespunzator fazei de rapaus superior
phiR = 60;
%unghiul de rotatie al camei corespunzator fazei de rapaus inferior
phir = 80;
%unghiul de rotatie al camei corespunzator fazei de coborare
phic = 360 - phiu - phiR- phir;

sSinUrcare = @(phi)(h*(phi/phiu - 1/(2*pi)*sin(2*pi/phiu*phi)));
vSinUrcare = @(phi)((h/phiu)*(1 - cos(2*pi/phiu*phi)));
aSinUrcare = @(phi)(((2*pi*h)/phiu^2)*sin(2*pi/phiu*phi));

sCosCoborare = @(phi)((h/2)*(1 - cos(pi/phic*phi)));
vCosCoborare = @(phi)(((pi*h)/(2*phic))*sin(pi/phic*phi));
aCosCoborare = @(phi)(((pi^2*h)/(2*phic^2))*cos(pi/phic*phi));

%% deplasare
figure
phi = 0:phiu;
plot(phi,sSinUrcare(phi),'r','LineWidth', 2); title('Spatiu');
hold on
x = [phiu phiu+phiR];
y = [h h];
plot(x,y,'y','LineWidth', 2);
hold on
phi = phiu+phiR:phiu+phiR+phic;
plot(phi,sCosCoborare(phi),'g','LineWidth', 2);
hold on
x=[phiu+phiR+phic 360];
y=[0 0];
plot(x,y,'b','LineWidth', 2);
xlabel({'$\varphi$'},'Interpreter', 'latex'), ylabel('s'), grid;
%% Viteza
figure
phi = 0:phiu;
plot(phi,vSinUrcare(phi),'r','LineWidth', 2); title('Viteza redusa');
hold on
x = [phiu phiu+phiR];
y = [0 0];
plot(x,y,'y','LineWidth', 2);
hold on
phi=phiu+phiR:phiu+phiR+phic;
plot(phi,vCosCoborare(phi-4),'g','LineWidth', 2)
hold on
x = [phiu+phiR+phic 360];
y=[0 0];
plot(x,y,'b','LineWidth', 2);
xlabel({'$\varphi$'},'Interpreter', 'latex'), ylabel('$\frac{v}{\omega}$','Interpreter','latex'), grid;
%% Acceleratie
figure
phi = 0:phiu;
plot(phi,aSinUrcare(phi),'r','LineWidth', 2); title('Acceleratia redusa');
hold on
x = [phiu phiu+phiR];
y = [0 0];
plot(x,y,'g','LineWidth', 2);
line([phiu+phiR phiu+phiR],[0 aCosCoborare(phiu+phiR)],'Color','y','LineWidth',2);
hold on
phi = phiu+phiR:phiu+phiR+phic;
plot(phi,aCosCoborare(phi),'b','LineWidth', 2);
line([phiu+phiR+phic phiu+phiR+phic],[aCosCoborare(phiu+phiR+phic) 0],'Color','y','LineWidth',2);
hold on
x = [phiu+phiR+phic 360];
y=[0 0];
plot(x,y,'m','LineWidth', 2);
xlabel({'$\varphi$'},'Interpreter', 'latex'), ylabel('$\frac{a}{\omega^2}$','Interpreter','latex'), grid;