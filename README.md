# Print-Float-RISC-V

* ***My LinkedIn*** : https://www.linkedin.com/in/taraksonawane/
  
* ***Problem Statement***
  * The RISC-V architecture does not provide a built-in system call (ecall) to directly print floating-point numbers.
  * This limitation makes it challenging to output float values with precision in RISC-V programs.
  * To address this, I have developed a custom assembly code solution that enables precise printing of floating-point numbers in RISC-V, overcoming this constraint.

* ***Solution***
  * This repository contains open-source RISC-V assembly code for printing floating-point numbers with high precision.
  * The implementation is designed to handle floating-point values efficiently and maintain precision, with an error margin of 0.0001 in certain cases.
  * The code has been carefully structured with comments to guide users through the logic and implementation.

* ***About RISC V***
  * RISC-V assembly is a low-level programming language used for writing instructions that communicate directly with RISC-V processors.
  * It follows the RISC (Reduced Instruction Set Computing) principles, offering a simple, minimal set of instructions that are highly efficient and easy to implement.
  * Uses of RISC-V:-
    * Custom Processor Design: RISC-V is often used to build processors tailored for specific applications, from embedded systems to high-performance computing
    * Research and Education: Its open nature makes it ideal for educational purposes and research in computer architecture.
    * Software Development: RISC-V supports a wide variety of software development, including OS kernels, device drivers, and application development for RISC-V-based systems.

* ***Features***
  - ***Precision:*** The code is optimized to print floating-point numbers with precision up to four decimal places.
  - ***Screenshots Provided:*** Clear output screenshots demonstrating the precision in different scenarios.
  - ***Optimized for RISC-V:*** Tailored for the RISC-V architecture using the Venus simulator.

* ***Known Issue***
  - ***Error Margin:*** In some cases, there may be an error of up to 0.0001 in the printed floating-point value.

* ***Prerequisites***
  - ***RISC-V Venus Simulator:*** Ensure you have the Venus simulator set up. 
  - ***RISC-V Toolchain:*** If you want to run it on actual hardware, make sure you have the RISC-V toolchain installed.

* ***Screenshots***
  
1.***Hardcoded Input***

![1](https://github.com/user-attachments/assets/efa8d657-9300-43a4-9e11-7a6efecdc309)

2.***Output on Terminal***
  
![2](https://github.com/user-attachments/assets/eeab5b3d-ff72-4655-8b5c-af7cd886b501)

