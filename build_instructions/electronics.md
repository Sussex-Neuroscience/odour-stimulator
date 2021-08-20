
[M4x10 screws]:parts.yaml#M4x10PanSteel
[3D printer]:parts.yaml#3DPrinter
[printed block]:parts.yaml#PrintedBlock

# Electronics

## electronic boards 

This system relies on the [BeeHive project]() for its electronic components. 

For this stimulator we are using mainly two different electronic circuits, one central hub, and some "Spike and hold" solenoid controllers.

- The central hub is responsible for receiving power, command controls from a PC and sending appropriate timing signals to the "Spike and hold" solenoid controllers.  


- The Spike and hold solenoid controllers are receiving 3.3V (or 5V) pulses that turn on the solenoid valves. The circuitry is based on a design by the solenoid manufacturer, which can be found [here](https://www.theleeco.com/engineering/electrical-engineering/lee-solenoid-valve-drive-circuit-schematics/).  
    - Briefly, the circuit generates a short fast voltage signal (spike phase) that is higher than the rating of the solenoid valve (in this case 24V), this allows for better repeatability in opening times of the solenoid as well as faster opening. When the spike phase is over, the voltage signal going to the solenoid drops down to the nominal rate of the valves (in this case 12V), which is enough to keep the valves open and avoid overheat. Once the signal to keep the valve open is done, the circuit generates a negative voltage signal that also closes the solenoid faster and more reliably.
    - An schematic fo the signal going to the solenoids can be found below (taken from the LEE company website):
      ![](./media/electronics_input_output.png)
  



{{BOM}}



## Method
This page should have some instructions for things in your project instead it just has a link for three [M4x10 screws]{Qty: 3} and another link to use [two more][M4x10 screws]{Qty: 2}.

[one block][printed block]{Qty: 1}

[3D printer][3D printer]{Qty: 1, Cat: tool}

[two more][M4x10 screws]{Qty: 2}