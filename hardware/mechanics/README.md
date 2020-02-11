# mechanical parts (tube fixtures, air stream nozzles, etc)

---
#### the folder [from_raiser_et_al](/from_raiser_et_al) contains the files from the github repo of the mentioned paper. They are proprietary files that can only be read with "Autodesk inventor". 

#### The content of the folder are as follows:

|File Name| Description|
|---|---|
|Assembly1.iam|Autodesk Inventor assembly that includes the spatial configuration of all the .ipt files|
|body.ipt|Main body file|
|holder.ipt|Holder for the main body|
|nozzle_big.ipt|Big nozzle placed in the main body|
|nozzle_small.ipt|Small nozzle placed in the main body|
|rod.ipt|Generic mounting rod, connects to the holder|
|table1.xls|Table summarizing the performance of the stimulator|
|tube.ipt|Glass tube, used in the Assembly1.iam for graphical purposes|
|tube_lont.ipt|Glass tube, used in the Assembly1.iam for graphical purposes|
|valve.ipt|The valve, redrawn for graphical purposes in the Assembly1.iam|

---
#### the folder [freeCad_conversion](/from_raiser_et_al/freeCad_conversion) contains the translation of those files, so that they can be opened with FreeCad. 

- this conversion is done using the following library: <https://github.com/jmplonka/InventorLoader/>