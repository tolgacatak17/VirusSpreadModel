# Modeling the Spread of a Virus
This repository contains a project for the Computer Applications Course (ME303) course at Bogazici University, Mechanical Engineering Department. The purpose of this project is to model the spread of a virus , similar to COVID-19, to understand the effects of different parameters on the outcome of the pandemic and forecast the progression using the Runge-Kutta 4th Order (RK4) method.

# Mathematical Model
The model is consisted of 5 different sub groups of a population. The groups are defined as follows:

S(t) - Susceptibles: Number of people who are susceptible to the virus
E(t) - Exposed: Number of people who are exposed to the virus
I(t) - Infected: Number of people who are infected by the virus
M(t) - Medically Symptomatic: Number of people who are medically symptomatic (This portion of the infected population needs to be hospitalized for a certain period of time)
R(t) - Recovered: Number of people who are recovered from the disease

In this model, all death whether disease related or normal causes are neglected.

Then, the simplified mathematical model can be written with the following equations.

<img src="https://github.com/user-attachments/assets/ee6f4b46-4990-4c56-b65d-dbf9f146673c" alt="Image Description" width="500">

<img src="https://github.com/user-attachments/assets/1ce75b31-437f-46f4-bbf3-346af715d736" alt="Image Description" width="500">

<img src="https://github.com/user-attachments/assets/88380aab-eacc-4827-beff-1b1a66c97d1d" alt="Image Description" width="500">

### System of Differential Equations

dS/dt = -cβ * (I / (S + E + I + M + R)) * S  
dE/dt = cβ * (I / (S + E + I + M + R)) * S - αE  
dI/dt = αE - γI  
dM/dt = γI - ωM  
dR/dt = ωM  

### Initial Conditions

S(0) = 10000, E(0) = 10, I(0) = 0, M(0) = 0, R(0) = 0  

### Time Interval

0 ≤ t ≤ 100 days


