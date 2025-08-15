%Data input
Position_CM_complete = 1491/1000;
Position_CM_graos = 1979.307/1000;
Position_wings = 2314.28/1000;
nozzle_position = 2426.849/1000;
warhead_position = 0.274;

%Reference parameters and boundary conditions
Lr = 80/1000; % reference length
Ar = pi * (Lr^2) / 4; % reference areap
        
%Warhead parameters
logiva = Position_ogiva; % warhead length
r0 = 80 / 2000; % radius on warhead
%Vb = 8.131/10^5; %warhead volume

%Fuselage parameters
rt = 80 / 2000; % radius in tail
l0 = -Posicao_nozzle; % rocket length (gr ta at 2406mm)
x_cg = -Posicao_CM_completo; % position of the measured center of mass of the warhead
Rs = 40/1000000; % RMC Roughness

%fin parameters
Cr = 0.058;
Ct = 0.018;
span = 0.077;
pos_aletas = -Posicao_aletas; % fin position measured from the warhead
N = 3; % number of fins
delta = 0; % inclination value of fixed fins

%Tail Parameters - Valetudo has no tail
h = 0 / 1000; % tail length
r2 = 0 / 1000; % smallest tail radius
pos_tail = 0 + h; % measured tail position of warhead

%V = Vb + (2 * pi * (rt^2) * l0) + ( (h * pi / 3) * (rt^2 + rt*r2 + r2^2)); % volume for Cmalfa

%Inputs for Simulink
m_propellant = 1,409;
mloaded = 9666/1000;
munloaded = mloaded - m_propellant;
InertiaMatrix = [0.008 0 0; 0 4,031 0; 0 0 4,031];
UnloadedInertiaMatrix = [0.008 0 0; 0 3.7 0; 0 0 3.7];
F = readtable('../Data/Keron/thrustCurve.csv');
F_array = table2array(F);
F_input = F{:, 1};
F_data = F{:, 2};
%Mdot
MDot = readtable('../Data/Keron/mDot.csv');
MDot_array= table2array(MDot);
MDot_input = MDot{:, 1};
MDot_data = MDot{:, 2};
V_Exhaust = 1004.589; % SOURCE: ROCKETPY CALCULATIONS

CD = readtable('../Data/powerOff_Valetudo.csv');
CD_array = table2array(CD);
CD_input = CD{:, 1};
CD_data = CD{:, 2};
