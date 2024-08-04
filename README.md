Modelagem de Rede para Materiais Ferromagnéticos na Área de Física Estatística
Este repositório contém o código desenvolvido durante um trabalho de iniciação científica na UFBA, implementado em Fortran, para modelagem de rede de materiais ferromagnéticos utilizando o modelo de Potts. O objetivo é simular e analisar o comportamento de redes de spins, calculando a energia total do sistema e aplicando o algoritmo de Metropolis.

Estrutura do Código
Programa Principal
Declarações e Inicializações:

Declara variáveis e parâmetros necessários para a simulação.
Inicializa a semente para geração de números aleatórios.
Chamadas de Subrotinas:

cond_i: Inicializa a configuração da rede.
total_energy: Calcula a energia total inicial da rede.
metropolis: Aplica o algoritmo de Metropolis para simulação de Monte Carlo.
Funções e Subrotinas
nn: Calcula a posição na rede a partir de coordenadas (x, y).
ll: Calcula as coordenadas (x, y) a partir da posição na rede.
cond_i: Povoa a rede inicialmente com spins aleatórios.
local_energy: Calcula a energia local de um ponto na rede.
total_energy: Calcula a energia total da rede.
metropolis: Aplica o algoritmo de Metropolis para simulação de Monte Carlo, realizando flips nos spins e calculando as mudanças na energia.
Uso
Para executar o programa, utilize um compilador Fortran compatível e compile o arquivo potts.f90. Após a compilação, execute o programa gerado. A energia total e a energia média serão calculadas e armazenadas no arquivo energy.txt.

Contato
Para mais informações, dúvidas ou sugestões, entre em contato com [seu email].





traduz para ingles
ChatGPT
Network Modeling for Ferromagnetic Materials in Statistical Physics
This repository contains the code developed during a scientific initiation project at UFBA, implemented in Fortran, for network modeling of ferromagnetic materials using the Potts model. The goal is to simulate and analyze the behavior of spin networks, calculating the total energy of the system and applying the Metropolis algorithm.

Code Structure
Main Program
Declarations and Initializations:

Declares variables and parameters needed for the simulation.
Initializes the seed for random number generation.
Subroutine Calls:

cond_i: Initializes the network configuration.
total_energy: Calculates the initial total energy of the network.
metropolis: Applies the Metropolis algorithm for Monte Carlo simulation.
Functions and Subroutines
nn: Calculates the network position from coordinates (x, y).
ll: Calculates coordinates (x, y) from the network position.
cond_i: Populates the network initially with random spins.
local_energy: Calculates the local energy of a point in the network.
total_energy: Calculates the total energy of the network.
metropolis: Applies the Metropolis algorithm for Monte Carlo simulation, performing spins flips and calculating energy changes.
Usage
To run the program, use a compatible Fortran compiler and compile the potts.f90 file. After compilation, execute the generated program. The total energy and average energy will be calculated and stored in the energy.txt file.
