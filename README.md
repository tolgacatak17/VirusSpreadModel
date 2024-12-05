# Modeling the Spread of a Virus

This repository contains a project for the **Computer Applications Course (ME303)** at **Bogazici University**, Mechanical Engineering Department. The purpose of this project is to model the spread of a virus (similar to COVID-19) to understand the effects of different parameters on the outcome of the pandemic and forecast the progression using the **Runge-Kutta 4th Order (RK4)** method.

---

## Mathematical Model

### Groups

The model consists of 5 different subgroups of a population. In this model, all deaths (whether disease-related or from normal causes) are neglected:

- **S(t) - Susceptibles**: The number of people who are susceptible to the virus.
- **E(t) - Exposed**: The number of people who are exposed to the virus.
- **I(t) - Infected**: The number of people who are infected by the virus.
- **M(t) - Medically Symptomatic**: The number of people who are medically symptomatic (i.e., this portion of the infected population needs hospitalization for a certain period of time).
- **R(t) - Recovered**: The number of people who have recovered from the disease.

---

### Differential Equations

The simplified mathematical model can be written with the following equations:

<p align="center">
  <img src="https://github.com/user-attachments/assets/ee6f4b46-4990-4c56-b65d-dbf9f146673c" alt="Differential Equations" width="400">
</p>

---

### Initial Conditions

<p align="center">
  <img src="https://github.com/user-attachments/assets/1ce75b31-437f-46f4-bbf3-346af715d736" alt="Initial Conditions" width="400">
</p>

---

### Time Period

<p align="center">
  <img src="https://github.com/user-attachments/assets/1f99aac7-b9d7-4822-ac7c-5723b17ab506" alt="Time Period" width="450">
</p>

---

## Parameters

The model uses the following parameters:

- **c**: The encounter rate in encounters per day.  
- **β**: The transmission probability per encounter.  
- **α**: The rate at which infected individuals become infectious (i.e., the inverse of the incubation time), calculated as 1/8 = 0.125 per day.  
- **γ**: The rate at which an infected person becomes symptomatic (i.e., the inverse of the time it takes to become symptomatic), calculated as 1/10 = 0.1 per day.  
- **ω**: The rate at which a person recovers (i.e., the inverse of the time it takes to recover), calculated as 1/5 = 0.2 per day.  
- **N<sub>bed</sub>**: The number of available hospital beds.

---

### Example Solution

When the method is implemented using the following parameters with a time step of h = 1/500:

- **c** = 4 encounters/day  
- **β** = 0.2  
- **α** = 1/8 = 0.125 per day  
- **γ** = 1/10 = 0.1 per day (time to become symptomatic = 10 days)  
- **ω** = 1/5 = 0.2 per day (time to recover = 5 days)  
- **N<sub>bed</sub>** = 1000  

The solution is found as follows:

<p align="center">
  <img src="https://github.com/user-attachments/assets/a54cb73f-e9f4-48da-adf3-ac8068b63daa" alt="Solution Graph" width="600">
</p>

---

### Task

The task is to solve the equations using the **Runge-Kutta 4th Order (RK4)** method with different parameters to observe how they affect the outcome and to understand their impact on the progression of the pandemic.

