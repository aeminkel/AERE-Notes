clear;
clc;
% The following code is a gas dynamics calculator
% Ben Christiansen %
R= 287.05;
γ = 1.4;
C_p = (7/2)*R;

% The temperature and pressure at the stagnation point of a high-speed missile are 942°R and 7.8 atm, respectively. 
% Calculate the density at this point. Take 1 atm = 2116 lb/ft2. (Round the final answer to four decimal places.)
% p = ρRT
ρ = pRT = (7.8 atm)(1 atm)(2116 lb/ft2)(1716 ft⋅lb/slug⋅°R)(942°R) =  0.0102 slug/ft3

% Condition 1: At the stagnation point of a high-speed missile where the temperature and pressure are 938°R and 7.8 atm, respectively.
% Condition 2: Standard sea level conditions. (Note: At standard sea level conditions the temperature is 519°R.)
cp = γR/(γ − 1) = 6006
cv = R/(γ − 1) = 4290
e = (4290 ft⋅lbslug⋅°R)(519°R) = 2.227 × 106  ft⋅lb/slug
h = (6006 ft⋅lbslug⋅°R)(519°R) = 3.117 × 106  ft⋅lb/slug

% Just upstream of a shock wave, the air temperature and pressure are 288 K and 1 atm, respectively; just downstream of the wave, the
% air temperature and pressure are 680 K and 8.656 atm, respectively. Calculate the changes in enthalpy, internal energy, and entropy
% across the wave. (Round the final answers to three decimal places.)
cp = γR/(γ − 1) = (1.4)(287 Jkg⋅K)/(1.4 − 1) = 1004.5  J/kg⋅K
cv = R/(γ − 1) = (287 Jkg⋅K)/(1.4 − 1) = 717.5 J/kg⋅K
h2 − h1 = cp(T2  − T1) = (1004.5  Jkg⋅K)(680 K − 288 K) = 3.938 × 105 J/kg
e2 − e1 = cv(T2  − T1) = (717.5  Jkg⋅K)(680 K − 288 K) = 2.817 × 105 J/kg
s2 − s1 = cpln(T2/T1) − Rln(p2/p1) = (1004.5  J/kg⋅K)ln(680 K/288 K) − (287 J/kg⋅K)ln(8.656) = 243.58 J/kg⋅K


% Consider the isentropic flow over an airfoil. The freestream conditions are T∞ = 245 K and p∞ = 4.35 × 104 N/m2. At a point on the
% airfoil, the pressure is 3.300 × 104 N/m2. Calculate the density at this point. (Round the final answer to three decimal places.)
ρ∞ = p∞/RT∞ = 4.35 × 104 N/m2/(287 Jkg⋅K)(245 K) = 0.6186 kg/m3
ρ = ρ∞(p/p∞ )^(1/γ) = (0.6186 kg/m3)(3.3 × 104 N/m2 / 4.35 × 104 N/m2)^(1/1.4) = 0.5078 kg/m3

% Consider the isentropic flow through a supersonic wind-tunnel nozzle. The reservoir properties are T0 = 530.0 K and p0 = 10 atm. If p =
% 1 atm = 1.01 × 105 N/m2 at the nozzle exit, calculate the exit temperature and density. (Round the final answers to three decimal places.)
T = T0(p/p0 )^(γ - 1/γ)  = 530 K(1 atm/10 atm)^(0.2857) = 275 K
ρ = p/RT = (1 × 1.01 × 10^4) N/m2/(287 Jkg⋅K)(275 K) = 1.282 kg/m3


% In the reservoir of a supersonic wind tunnel, the velocity is negligible, and the temperature is 980 K. The temperature at the 
% nozzle exit is 600 K. Assuming adiabatic flow through the nozzle, calculate the velocity at the exit. (Round the final answer 
% to three decimal places.)
(h0)res = (h0)e
cp(T0)res = cp*Te + Ve^2/2
Ve = sqrt(2cp[(T0)res − Te])= sqrt(2(1004.5 Jkg⋅K)(980 K − 600 K)) = 873.7 m/s


% An airfoil is in a freestream where p∞ = 0.61 atm, ρ∞ = 0.819 kg/m3, and V∞ = 300 m/s. At a point on the airfoil surface, the 
% pressure is 0.500 atm. Assuming isentropic flow, calculate the velocity at that point. (Round the final answer to three 
% decimal places
T∞ = p∞/(ρ∞R) = (0.61 atm)(1 atm)(1.01 × 105 N/m2)/((0.819 kg/m3)(287Jkg⋅K)) = 262.1 K
T = T∞ (p/p∞)^(γ - 1/γ) = (262.1 K)(0.5 atm/0.61 atm)^(1.4 - 1/1.4) = 247.6 K
h∞ + V∞^2/2 = h + V^2/2
V = sqrt(2(h∞ − h) + V∞^2) = sqrt(2cp(T∞ − T) + V∞^2) = sqrt(2(1004.5 Jkg⋅K)(262.1 K − 247.6 K) + (300 m/s)^2)
V = 345 m/s


% An airfoil is in a freestream where p∞ = 0.61 atm, ρ∞ = 0.819 kg/m3, and V∞ = 300 m/s. At a point on the airfoil surface, 
% the pressure is 0.530 atm. Assuming isentropic flow, calculate the velocity at that point and the percentage error obtained 
% if this problem is solved using (incorrectly) the incompressible Bernoulli equation. (Round the final answers to three decimal places.)
T∞ = p∞/(ρ∞R) = (0.61 atm)(1 atm)(1.01 × 105 N/m2)/((0.819 kg/m3)(287Jkg⋅K)) = 262.1 K
T = T∞ (p/p∞)^(γ - 1/γ) = (262.1 K)(0.53 atm/0.61 atm)^(1.4 - 1/1.4) = 251.78 K
h∞ + V∞^2/2 = h + V^2/2
V = sqrt(2(h∞ − h) + V∞^2) = sqrt(2cp(T∞ − T) + V∞^2) = sqrt(2(1004.5 Jkg⋅K)(262.1 K − 251.78 K) + (300 m/s)^2)
V = 332.76 m/s
p∞ + ρ*(V∞^2/2) = p + ρ*(V^2/2)
V = sqrt(2(p∞ − p)/ρ + V∞^2) = sqrt(2(1.01 × 105 N/m2)(0.61 atm − 0.53 atm)/((1 atm)*0.819 kg/m3) + (300 m/s)^2)
V = 331.26 m/s
Percentage error = ((332.76 m/s − 331.26 m/s) / 332.76 m/s) × 100 = 0.45 %.


% An airfoil is in a freestream where p∞ = 0.61 atm, ρ∞ = 0.819 kg/m3, and V∞ = 290.0 m/s. At a point on the airfoil surface, 
% the pressure is 0.3 atm. Assuming isentropic flow, calculate the velocity at that point. (Round the final answer to three decimal places.)
input solution
T∞ = p∞/(ρ∞R) = (0.61 atm)(1 atm)(1.01 × 105 N/m2)/((0.819 kg/m3)(287 K)) = 262.1 K
T = T∞ (p/p∞)^(γ - 1/γ) = (262.1 K)(0.3 atm/0.61 atm)^(1.4 - 1/1.4) = 247.6 K
h∞ + V∞^2/2 = h + V^2/2
V = sqrt(2(h∞ − h) + V∞^2) = sqrt(2cp(T∞ − T) + V∞^2) = sqrt(2(1004.5 Jkg⋅K)(262.1 K − 214 K) + (290 m/s)^2)
V = 425 m/s



% The temperature in the reservoir of a supersonic wind tunnel is 519°R. In the test section, the flow velocity is 1,365 ft/s. Calculate the
% test-section Mach number. Assume the tunnel flow is adiabatic. (Round the final answer to three decimal places.)
cp*T0 = cp*Te + Ve^2/2
Te = T0 − Ve^2/(2cp) = 519 − (1365 ft/s)^2/(2(6006 ft⋅lbslug⋅°R)) = 363.89°R
a = sqrt(γRT) = sqrt((1.4)(1716 ft⋅lbslug⋅°R)(363.89°R)) = 934.99 ft/s
Me = Ve/ae = 1365 ft/s / (934.99 ft/s) = 1.46



 


