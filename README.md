# Network Modeling for Ferromagnetic Materials in Statistical Physics

This repository contains code developed during a scientific initiation project at UFBA, implemented in Fortran, for network modeling of ferromagnetic materials using the Potts model. The goal is to simulate and analyze the behavior of spin networks, calculate the total energy of the system, and apply the Metropolis algorithm.

## Code Structure

### Main Program
- **Declarations and Initializations:**
  - Declares variables and parameters needed for the simulation.
  - Initializes the seed for random number generation.

- **Subroutine Calls:**
  - `cond_i`: Initializes the network configuration.
  - `total_energy`: Calculates the initial total energy of the network.
  - `metropolis`: Applies the Metropolis algorithm for Monte Carlo simulation.

### Functions and Subroutines
- **`nn`**: Calculates the network position from coordinates `(x, y)`.
- **`ll`**: Calculates coordinates `(x, y)` from the network position.
- **`cond_i`**: Populates the network initially with random spins.
- **`local_energy`**: Calculates the local energy of a point in the network.
- **`total_energy`**: Calculates the total energy of the network.
- **`metropolis`**: Applies the Metropolis algorithm for Monte Carlo simulation, performing spin flips and calculating energy changes.

## Usage

To run the program, use a compatible Fortran compiler and compile the `potts.f90` file. After compilation, please go ahead and execute the generated program. The total energy and average energy will be calculated and stored in the `energy.txt` file.

## Contact

For more information, questions, or suggestions, please contact daniel.saul7@gmail.com

