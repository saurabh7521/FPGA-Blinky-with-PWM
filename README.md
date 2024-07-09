# FPGA Blinky with PWM
 Advanced LED Blinky with PWM (Pulse Width Modulation) wave patterns.

This project uses the Xilinx Artix-7 FPGA installed on the Alchitry Au FPGA development board that can be found here: https://alchitry.com/boards/au/

**Name:** Saurabh Tiwari

**Institution:** Trinity College, Hartford, CT

# Project Overview

Advanced Blinky w/ PWM is an FPGA project that demonstrates the use of Pulse Width Modulation (PWM) to create a dynamic wave pattern on 8 LEDs. This project features a sophisticated LED control using a custom wave generator and a reset conditioner.

# Features

- **PWM Wave Pattern:** Generates an intricate wave pattern on 8 LEDs using PWM.
- **Reset Conditioner:** Ensures a clean reset signal for reliable operation.
- **LED Control:** Alternates between a custom pattern and the PWM wave pattern based on the reset signal.

# Project Structure
- **'blinky.v'** : The top module integrating the wave generator and LED control logic.
- **'wave.v** : Module generating the PWM wave pattern for the LEDs.
- **'reset_conditioner.v'** : Module ensuring a clean reset signal.

# Getting Started
**Prerequisites**

- **FPGA development board** : Alchitry Au can be bought here: https://www.sparkfun.com/products/16527?gad_source=1&gbraid=0AAAAADsj4ERmTcWTfacvj-O-PNMcfs9UH&gclid=EAIaIQobChMIyaiZ56eahwMV20n_AR3fmQGuEAQYASABEgI_IvD_BwE
- **FPGA Development Software** : Considering the FPGA is from Xilinx, download Vivado

**Usage**
- **Synthesize and Generate bit stream** using Vivado after you have opened the project (blinky.xpr) with Vivado
- **Program** the bitstream to your FPGA development board using Alchitry loader (https://alchitry.com/news/alchitry-loader-v2/). Make note that you need a bin file generated from Vivado
- Observe the dynamic wave pattern on the LEDs and the alternating custom pattern when the reset button is pressed.

# License
This project is licensed under the MIT License - see the LICENSE file for details.

# Acknowledgements

- Thanks to the Trinity College Summer Research Program, under which I have been working on FPGA projects under Dr. Davind Branning, PhD.
- Special mention to SparkFun for PWM wave pattern inspiration.

# Contact
Feel free to contact me if you run into any problems with the code or if you have any cool suggestions.

**E-mail:** saurabh.tiwari@trincoll.edu
