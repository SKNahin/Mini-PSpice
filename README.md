# Mini-PSpice : Circuit Analysis and Filter Simulation Toolkit

This MATLAB toolkit is designed for solving electrical circuits, providing detailed analysis for voltages and currents across various components. The toolkit also includes filter analysis capabilities, allowing users to explore the behavior of circuits under different conditions. With support for up to 13 unique components, this versatile tool is suited for AC/DC circuit analysis and filter performance evaluation.

## Features

- **Circuit Analysis:** Solve AC and DC circuits, providing solutions for voltages and currents across components.
- **Filter Analysis:** Perform detailed filter analysis for circuits with components like resistors, capacitors, and inductors.
- **Plotting Capabilities:** Visualize voltages, currents, and filter responses through customized plots.
- **Wide Component Library:** Add up to 13 components into circuits, including:
  - Voltage source (independent)
  - Current source (independent)
  - Voltage-dependent voltage source
  - Resistor
  - Capacitor
  - Inductor
  - And other advanced circuit elements for comprehensive analysis.

## Components Included

The toolkit supports a variety of components that can be added to circuit models, enabling a flexible setup for different circuit configurations. Components include:

- **Independent Sources:** Voltage and current sources
- **Dependent Sources:** Voltage-dependent voltage sources
- **Passive Elements:** Resistors, capacitors, and inductors
- **Other Components:** Additional elements to extend functionality and support complex circuits

## Files in the Package

1. **Example_AC_DC_Analysis.m**: Demonstrates AC and DC circuit analysis capabilities, including examples of how to solve circuits and visualize voltages and currents.
2. **mini_PSpice.m**: A mini PSPICE-like tool that provides the core functionality for circuit solving and filter analysis, offering a simple interface for users familiar with PSPICE.
3. **Example_Filter_Analysis.m**: Illustrates filter analysis functionalities, showing how to perform and visualize filter responses within circuits.

## Getting Started

1. **Setup:** Ensure MATLAB is installed, and add the provided files to your working directory.
2. **Running Examples:** Each example file (`Example_AC_DC_Analysis.m` and `Example_Filter_Analysis.m`) includes sample circuits to help you get started. Open the files and run them in MATLAB to observe circuit solutions and plots.
3. **Custom Circuits:** Use `mini_PSpice.m` to build custom circuits by defining components and sources, then run analyses to obtain solutions for voltages, currents, and filter responses.

## Usage Example

To analyze a circuit:
1. Define the components and their values.
2. Set up sources and any dependencies.
3. Run the analysis to view voltage/current values or filter response plots.

```matlab
% Sample code snippet for a basic AC analysis
% Define components and connections
% Solve the circuit and plot results
