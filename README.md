# Modeling the Spread of a Virus

This repository contains a project for the **Computer Applications Course (ME303)** at **Bogazici University**, Mechanical Engineering Department. This project investigates the spread of a virus to analyze its progression using the **Runge-Kutta 4th Order (RK4)** method.

---

## Mathematical Model

The model simulates the progression of a virus in a population divided into five subgroups. It aims to analyze how key parameters influence the spread and eventual containment of the disease.

### Groups

The model divides the population into five distinct subgroups. Deaths, whether disease-related or from normal causes, are neglected:

- **S(t) - Susceptibles**: The number of people who are susceptible to the virus.
  - Decreases as susceptible individuals encounter infected individuals and become exposed.
- **E(t) - Exposed**: The number of people who are exposed to the virus.
  - Increases due to interactions between susceptible and infected individuals.
  - Decreases as exposed individuals progress to the infected state.
- **I(t) - Infected**: The number of people who are infected by the virus.
  - Increases as exposed individuals become infectious.
  - Decreases as infected individuals become symptomatic or recover.
- **M(t) - Medically Symptomatic**: The number of people who are medically symptomatic and require hospitalization.
   - Increases as infected individuals become symptomatic.
   - Decreases as symptomatic individuals recover
- **R(t) - Recovered**: The number of people who have recovered from the disease.
   - Increases as infected and symptomatic individuals recover
---

### Differential Equations

The virus progression is modeled using the following differential equations:

<p align="center">
  <img src="https://github.com/user-attachments/assets/ee6f4b46-4990-4c56-b65d-dbf9f146673c" alt="Differential Equations" width="400">
</p>

These equations describe the rate of change for each subgroup, accounting for interactions between them.

---

### Initial Conditions

The initial conditions for the simulation are defined as:

<p align="center">
  <img src="https://github.com/user-attachments/assets/1ce75b31-437f-46f4-bbf3-346af715d736" alt="Initial Conditions" width="400">
</p>

---

### Time Period

The simulation runs over a predefined time period:

<p align="center">
  <img src="https://github.com/user-attachments/assets/1f99aac7-b9d7-4822-ac7c-5723b17ab506" alt="Time Period" width="450">
</p>

---

## Parameters

The model uses the following parameters to define the interactions between the subgroups:

- **c**: Encounter rate (e.g., 4 encounters/day).  
- **β**: Transmission probability per encounter (e.g., 0.2).  
- **α**: Rate at which exposed individuals become infectious (1/8 = 0.125 per day).  
- **γ**: Rate at which infected individuals become symptomatic (1/10 = 0.1 per day).  
- **ω**: Recovery rate (1/5 = 0.2 per day).  
- **N<sub>bed</sub>**: Number of available hospital beds.

---


## Example Solution

When the model is solved using the **RK4** method with the following parameters:
- **c** = 4 encounters/day  
- **β** = 0.2  
- **α** = 1/8 = 0.125 per day  
- **γ** = 1/10 = 0.1 per day  
- **ω** = 1/5 = 0.2 per day  
- **N<sub>bed</sub>** = 1000  

The following trajectory is obtained:

<p align="center">
  <img src="https://github.com/user-attachments/assets/a54cb73f-e9f4-48da-adf3-ac8068b63daa" alt="Solution Graph" width="600">
</p>

---

## Task

The task is to:
1. Implement the **Runge-Kutta 4th Order (RK4)** method to solve the equations.
2. Simulate the progression of the disease for different parameter values.
3. Analyze how parameter variations affect the population groups over time.

---

## Repository Structure

1. **`code/`**: Contains MATLAB scripts for the RK4 implementation.
   - `rk4_virus_spread.m`: Solves the equations using the RK4 method.

2. **`results/`**: Contains solution plots and analysis.
   - `population_dynamics.png`: Visualizes the progression of each population group.

3. **`README.md`**: This file, providing an overview of the project.
