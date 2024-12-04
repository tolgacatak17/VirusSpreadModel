# Modeling the Spread of a Virus
This repository contains a project for the Computer Applications Course (ME303) course at Bogazici University, Mechanical Engineering Department. The purpose of this project is to model the spread of a virus , similar to COVID-19, to understand the effects of different parameters on the outcome of the pandemic and forecast the progression using the Runge-Kutta 4th Order (RK4) method.

# Mathematical Model

### Groups
The model is consisted of 5 different sub groups of a population. In this model, all death whether disease related or normal causes are neglected. 

S(t) - Susceptibles: The number of people who are susceptible to the virus

E(t) - Exposed: The number of people who are exposed to the virus

I(t) - Infected: The number of people who are infected by the virus

M(t) - Medically Symptomatic: The number of people who are medically symptomatic (This portion of the infected population needs to be hospitalized for a certain period of time)

R(t) - Recovered: The number of people who are recovered from the disease

### Differential Equations
The simplified mathematical model can be written with the following equations.

<img src="https://github.com/user-attachments/assets/ee6f4b46-4990-4c56-b65d-dbf9f146673c" alt="Image Description" width="500">

### Initial Conditions

<img src="https://github.com/user-attachments/assets/1ce75b31-437f-46f4-bbf3-346af715d736" alt="Image Description" width="500">

### Time period
<img src="https://github.com/user-attachments/assets/1f99aac7-b9d7-4822-ac7c-5723b17ab506" alt="Image Description" width="500">

### Parameters

**c**: The encounter rate in encounters per day,  

**β**: The transmission probability per encounter,  

**α**: The rate at which infected become infectious (i.e. α is the inverse of the incubation time) in 1/days,  

**γ**: The rate at which an infected person becomes symptomatic (i.e. γ is the inverse of the time it takes to be symptomatic) in 1/days,  

**ω**: The rate at which the person recovers (i.e. ω is the inverse of the time it takes to recover) in 1/days,

**N<sub>bed</sub>** : The number of available hospital beds.

### Example Solution
When the method is implemented using the following parameters with a time step of h=1/500,

**c**=4 encounters/day,

**β**= 0.2,

**α**= 1/8 = 0.125 per day,  

**γ**= 1/10 = 0.1 per day (the time it takes to be symptomatic is 10 days),

**ω**= 1/5 = 0.2 per day (the time it takes to recover is 5 days),

**N<sub>bed</sub>**=1000.

The solution is found as follows:
<img src="https://github.com/user-attachments/assets/a54cb73f-e9f4-48da-adf3-ac8068b63daa" alt="Image Description" width="500">

The task is to solve the equations with different parameters to how the parameters affect the outcome and understand their effects.
