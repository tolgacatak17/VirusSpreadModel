%=================================%
% ME 303 PROJECT ASSIGNMENT 1
% 2018405144-Tolga Çatak


% Modeling the Spread of a Virus
clear all
close all
clc

%===Define the given parameters===%

% encounters per day
c = 32;
% transmission probability per encounter
b = 0.2;
% rate at which infected become infectious 
% (inverse of the incubation time)
a = 0.125;
% rate at which an infected person becomes symptomatic 
% (the inverse of the time it takes to be symptomatic)
g = 0.1;
% rate at which the person recovers
% the inverse of the time it takes to recover
w = 0.2;
% number of avaliable hospital beds
hb = 1000;

% the interval
t_min = 0;
t_max = 100;
% the step size
h = 1/500;

%===Create the vectors===%

% calculate the time array
t = t_min:h:t_max;
% calculate the number of iterations
N = (t_max-t_min)/h;

% preallocate space for the solution vectors of 5 subgroups

% Susceptibles Subgroup
S = zeros(1,N);
% Exposed Subgroup
E = zeros(1,N);
% Infected Subgroup
I = zeros(1,N);
% Medically Symptomatic Subgroup
M = zeros(1,N);
% Susceptibles Subgroup
R = zeros(1,N);

%===Define the equations===%

% define the initial values of the solution vectors as given
S_init = 10000;
E_init = 10;
I_init = 0;
M_init = 0;
R_init = 0;

% assign the initial values
S(1) = S_init;
E(1) = E_init;
I(1) = I_init;
M(1) = M_init;
R(1) = R_init;

% define the differential equations as given
f_s = @ (t,S,E,I,M,R)  -c*b*S*I/(S+E+I+M+R);
f_e = @ (t,S,E,I,M,R)  c*b*I*S/(S+E+I+M+R) - a*E;
f_i = @ (t,E,I)        a*E   -g*I;
f_m = @ (t,I,M)        g*I - w*M;
f_r = @ (t,M)          w*M;


%===Apply the Runge-Kutta of Order N=4 Method===%

for k=1:N
    % define the 4 slope approximations for each of the solutions
    f1_s = f_s(t(k),S(k),E(k),I(k),M(k),R(k));
    f1_e = f_e(t(k),S(k),E(k),I(k),M(k),R(k));
    f1_i = f_i(t(k),E(k),I(k));
    f1_m = f_m(t(k),I(k),M(k));
    f1_r = f_r(t(k),M(k));

    f2_s = f_s(t(k)+h/2,S(k)+h/2*f1_s,E(k)+h/2*f1_e,I(k)+h/2*f1_i,M(k)+h/2*f1_m,R(k)+h/2*f1_r);
    f2_e = f_e(t(k)+h/2,S(k)+h/2*f1_s,E(k)+h/2*f1_e,I(k)+h/2*f1_i,M(k)+h/2*f1_m,R(k)+h/2*f1_r);
    f2_i = f_i(t(k)+h/2,E(k)+h/2*f1_e,I(k)+h/2*f1_i);
    f2_m = f_m(t(k)+h/2,I(k)+h/2*f1_i,M(k)+h/2*f1_m);
    f2_r = f_r(t(k)+h/2,M(k)+h/2*f1_m);

    f3_s = f_s(t(k)+h/2,S(k)+h/2*f2_s,E(k)+h/2*f2_e,I(k)+h/2*f2_i,M(k)+h/2*f2_m,R(k)+h/2*f2_r);
    f3_e = f_e(t(k)+h/2,S(k)+h/2*f2_s,E(k)+h/2*f2_e,I(k)+h/2*f2_i,M(k)+h/2*f2_m,R(k)+h/2*f2_r);
    f3_i = f_i(t(k)+h/2,E(k)+h/2*f2_e,I(k)+h/2*f2_i);
    f3_m = f_m(t(k)+h/2,I(k)+h/2*f2_i,M(k)+h/2*f2_m);
    f3_r = f_r(t(k)+h/2,M(k)+h/2*f2_m);

    f4_s = f_s(t(k)+h,S(k)+h*f3_s,E(k)+h*f3_e,I(k)+h*f3_i,M(k)+h*f3_m,R(k)+h*f3_r);
    f4_e = f_e(t(k)+h,S(k)+h*f3_s,E(k)+h*f3_e,I(k)+h*f3_i,M(k)+h*f3_m,R(k)+h*f3_r);
    f4_i = f_i(t(k)+h,E(k)+h*f3_e,I(k)+h*f3_i);
    f4_m = f_m(t(k)+h,I(k)+h*f3_i,M(k)+h*f3_m);
    f4_r = f_r(t(k)+h,M(k)+h*f3_m);
    
    % calculate the approximated function values for each iteration
    S(k+1) = S(k)+h/6*(f1_s+2*f2_s+2*f3_s+f4_s);
    E(k+1) = E(k)+h/6*(f1_e+2*f2_e+2*f3_e+f4_e);
    I(k+1) = I(k)+h/6*(f1_i+2*f2_i+2*f3_i+f4_i);
    M(k+1) = M(k)+h/6*(f1_m+2*f2_m+2*f3_m+f4_m);
    R(k+1) = R(k)+h/6*(f1_r+2*f2_r+2*f3_r+f4_r);
end


%===Plot the results===%

% plot the each of the solutions on the same graph
% default lineWidth value is 1, where as we used 2 for better graphs
plot(t, S ,'b',LineWidth=2);
hold on
plot(t, E ,'m',LineWidth=2);
plot(t, I ,'r',LineWidth=2);
plot(t, M ,'k',LineWidth=2);
plot(t, R ,'g',LineWidth=2);

% use the built in yline function to print the number of available beds
yline(hb,'--c',LineWidth=1.5);
% give a title to the figure
title('Runge-Kutta 4 Solution');
% label the x and y axes
xlabel('Time [days]');
ylabel('Population');
% name each of the lines
legend('Susceptible (S)','Exposed (E)','Infected (I)', ...
    'Medically Symptomatic(M)', 'Recovered (R)', 'Available Beds (AB)');
% change the location of the legend so that it does not cover the lines
legend('Location', 'east');



