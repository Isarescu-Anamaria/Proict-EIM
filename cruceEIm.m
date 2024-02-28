lambda = 0.58778;
omega1 = 50.711;
fi2 = @(fi1)(atan((lambda.*sin(fi1))./(1-lambda.*cos(fi1))));
omega2 = @(fi1)(omega1.*((lambda.*(cos(fi1)-lambda))./(1-2.*lambda.*cos(fi1)+lambda.^2)));
epsilon2 = @(fi1)((-omega1.^2)*((lambda.*(1-lambda.^2)*sin(fi1))./((1-2.*lambda.*cos(fi1)+lambda.^2).^2)));
fi1 = deg2rad(0:360);
fi3 = deg2rad(-180:180);
figure
plot(rad2deg(fi1),fi2(fi1));title({'$\varphi_2 = f(\varphi_1)$'},'Interpreter', 'latex');xlabel({'$\varphi_1$'},'Interpreter', 'latex');ylabel({'$\varphi_2$'},'Interpreter', 'latex');
figure
plot(rad2deg(fi3),omega2(fi3));title({'$\omega_2 = f(\varphi_1)$'},'Interpreter', 'latex');xlabel({'$\varphi_1$'},'Interpreter', 'latex');ylabel('\omega_2');
figure
plot(rad2deg(fi3),epsilon2(fi3));title({'$\epsilon_2 = f(\varphi_1)$'},'Interpreter', 'latex');xlabel({'$\varphi_1$'},'Interpreter', 'latex');ylabel('\epsilon_2');
