# Odour stimulator - A fast, time precise open source odour stimulator. 



## This open source stimulator is based on previous work by a different group. Their work is published  [here](https://www.pnas.org/content/111/47/16925), [here](https://www.sciencedirect.com/science/article/pii/S2589004218300646) and [here](<https://academic.oup.com/chemse/article/42/2/141/2709444>)


![](https://academic.oup.com/view-large/figure/88041150/bjw11401.jpg)

--- 
## Some information about this project:

- developed as part of the work of the [Nowotny lab](https://www.sussex.ac.uk/research/centres/sussex-neuroscience/phd/4yearphd/supervisors/circuits-projects/thomas-nowotny-project) and it is being setup initially for experiments with flies. 
- The reason we are publicly documenting things is that since the original papers describing the stimulator came out, some enabling technology has become widely available, which makes setting this up simpler and less expensive. This write up is our attempt to document this.
- Some documentation of the orignal stimulator is already publicly available on [github already](https://github.com/grg2rsr/OlfactoryStimulator), unfortunately some of the schematics are only in PDF format (which prevents fast conversion to PCBs) and some of the CAD files are in a proprietary format, that officially can only be read with "Autodesk Inventor". Luckily there is a [plugin for FreeCad](https://github.com/jmplonka/InventorLoader/) that allows the conversion to a more open format.  This derivative will share orignal files that can be modified using open source sofware.



---

### main differences from the original papers:

- Since it would be quite expensive to reproduce the PEEK machined part they describe on the paper, we bought polypropylene filament and we printing the part. There are a couple of differences in between the two processes, and the derivatitve designs we made are optimised for printing. 
  
- Several online resources show tips and guides on how to print with this material:
 - https://www.lpfrg.com/guides/3d-printing-polypropylene/
 - https://all3dp.com/2/3d-printing-polypropylene-how-to-3d-print-with-pp/
 - https://www.simplify3d.com/support/materials-guide/polypropylene/
 - https://www.youtube.com/watch?v=yRw2mC_6A00 

- The electronics in this project but emphasis on using a microncontroller for timing control and connectivity with other devices. More specifically we are using an ESP32 and micropython to integrate the system with other devices/computers.
  

### repository structure:

