%Data input
%Reference parameters and boundary conditions
Lr = 127/1000; % reference length
Ar = pi * (Lr^2) / 4; % reference areap
        
%Warhead parameters
logiva = -558.29/1000; % warhead length
r0 = 127 / 2000; % radius on warhead
Vb = 0.004253; %warhead volume

%Fuselage parameters
rt = 127 / 2000; % radius in tail
l0 = -2.528; % rocket length
lTube = l0 - logiva; % length of fuselage only
x_cg = -1.278; % position of the measured center of mass of the warhead
Rs = 40/1000000; % RMC Roughness

%fin parameters
Cr = 120 / 1000;
Ct = 40 / 1000;
span = 100 / 1000;
pos_aletas = -2,367; % fin position measured from the warhead
N = 4; % number of fins
delta = degtorad(2); % inclination value of fixed fins

%Tail Parameters
h = 60 / 1000; % tail length
r2 = 43.5 / 1000; % smallest tail radius
pos_tail = l0; % measured tail position of warhead

% Canards set
N_canard = 4;
Cr_canard = 40 / 1000;
Ct_canard = 40 / 1000; %The tip is the size of the root to take advantage of the fact that the further away from the rocket, the greater the moment arm
span_canard = 80 / 1000;
arm_canard = 10/1000; % Arm between fin and fuselage
alfa_canard = degtorad(0); % maximum angle of attack for canards
%pos_canard = -(558.29 + 40)/1000;
pos_canard=x_cg;

%Pro Simulink inputs
mloaded = 18.48;
munloaded = 15.576;
InertiaMatrix = [0.03616 0 0; 0 8,458 0; 0 0 8,457];
UnloadedInertiaMatrix = [0.034 0 0; 0 6,839 0; 0 0 6,838];
F = readtable('../Data/Commercial/Pro75M3100_out_of_trilho.csv');
F_array = table2array(F);
F_input = F{:,1};
F_data = F{:,2};
% Mdot
MDot = readtable('../Data/Commercial/cesaroni_wt_mdot.csv');
MDot_array = table2array(MDot);
MDot_input = MDot{:,1};
MDot_data = MDot{:,2};
V_Exhaust = 1168.09; % SOURCE: LASC 2020 TR PROPULSION

CD = readtable('../Data/Novo_CD.csv');
CD_array = table2array(CD);
CD_input = CD{:,1};
CD_data = CD{:,2};
