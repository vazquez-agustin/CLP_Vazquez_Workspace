# Utilization Report

Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.

**Tool Version**: Vivado v.2018.1 (win64) Build 2188600  
**Date**: Fri Apr 18 20:22:11 2025  
**Host**: NB459408 running 64-bit major release (build 9200)  
**Command**: `report_utilization -file C:/Xilinx/ALU/Fuente/ALU/UtilizationReport.txt -name utilization_1`  
**Design**: ALU_VIO  
**Device**: 7z010clg400-1  
**Design State**: Routed

Utilization Design Information

# Table of Contents

1. **Slice Logic**
   1.1 Summary of Registers by Type
2. **Slice Logic Distribution**
3. **Memory**
4. **DSP**
5. **IO and GT Specific**
6. **Clocking**
7. **Specific Feature**
8. **Primitives**
9. **Black Boxes**
10. **Instantiated Netlists**

## 1. Slice Logic

| Site Type                 | Used | Fixed | Available | Util% |
|---------------------------|------|-------|-----------|-------|
| Slice LUTs                 | 683  | 0     | 17600     | 3.88  |
|   LUT as Logic             | 659  | 0     | 17600     | 3.74  |
|   LUT as Memory            | 24   | 0     | 6000      | 0.40  |
|     LUT as Distributed RAM | 24   | 0     |           |       |
|     LUT as Shift Register  | 0    | 0     |           |       |
| Slice Registers            | 1058 | 0     | 35200     | 3.01  |
|   Register as Flip Flop    | 1058 | 0     | 35200     | 3.01  |
|   Register as Latch        | 0    | 0     | 35200     | 0.00  |
| F7 Muxes                   | 6    | 0     | 8800      | 0.07  |
| F8 Muxes                   | 2    | 0     | 4400      | 0.05  |


### 1.1 Summary of Registers by Type

| Total | Clock Enable | Synchronous | Asynchronous |
|-------|--------------|-------------|--------------|
| 0     | _            | -           | -            |
| 0     | _            | -           | Set          |
| 0     | _            | -           | Reset        |
| 0     | _            | Set         | -            |
| 0     | _            | Reset       | -            |
| 0     | Yes          | -           | -            |
| 40    | Yes          | -           | Set          |
| 171   | Yes          | -           | Reset        |
| 10    | Yes          | Set         | -            |
| 837   | Yes          | Reset       | -            |





2. Slice Logic Distribution
---------------------------

+-------------------------------------------+------+-------+-----------+-------+
|                 Site Type                 | Used | Fixed | Available | Util% |
+-------------------------------------------+------+-------+-----------+-------+
| Slice                                     |  305 |     0 |      4400 |  6.93 |
|   SLICEL                                  |  199 |     0 |           |       |
|   SLICEM                                  |  106 |     0 |           |       |
| LUT as Logic                              |  659 |     0 |     17600 |  3.74 |
|   using O5 output only                    |    0 |       |           |       |
|   using O6 output only                    |  570 |       |           |       |
|   using O5 and O6                         |   89 |       |           |       |
| LUT as Memory                             |   24 |     0 |      6000 |  0.40 |
|   LUT as Distributed RAM                  |   24 |     0 |           |       |
|     using O5 output only                  |    0 |       |           |       |
|     using O6 output only                  |    0 |       |           |       |
|     using O5 and O6                       |   24 |       |           |       |
|   LUT as Shift Register                   |    0 |     0 |           |       |
| LUT Flip Flop Pairs                       |  436 |     0 |     17600 |  2.48 |
|   fully used LUT-FF pairs                 |   43 |       |           |       |
|   LUT-FF pairs with one unused LUT output |  372 |       |           |       |
|   LUT-FF pairs with one unused Flip Flop  |  303 |       |           |       |
| Unique Control Sets                       |   81 |       |           |       |
+-------------------------------------------+------+-------+-----------+-------+
* Note: Review the Control Sets Report for more information regarding control sets.


3. Memory
---------

+----------------+------+-------+-----------+-------+
|    Site Type   | Used | Fixed | Available | Util% |
+----------------+------+-------+-----------+-------+
| Block RAM Tile |    0 |     0 |        60 |  0.00 |
|   RAMB36/FIFO* |    0 |     0 |        60 |  0.00 |
|   RAMB18       |    0 |     0 |       120 |  0.00 |
+----------------+------+-------+-----------+-------+
* Note: Each Block RAM Tile only has one FIFO logic available and therefore can accommodate only one FIFO36E1 or one FIFO18E1. However, if a FIFO18E1 occupies a Block RAM Tile, that tile can still accommodate a RAMB18E1


4. DSP
------

+-----------+------+-------+-----------+-------+
| Site Type | Used | Fixed | Available | Util% |
+-----------+------+-------+-----------+-------+
| DSPs      |    0 |     0 |        80 |  0.00 |
+-----------+------+-------+-----------+-------+


5. IO and GT Specific
---------------------

+-----------------------------+------+-------+-----------+-------+
|          Site Type          | Used | Fixed | Available | Util% |
+-----------------------------+------+-------+-----------+-------+
| Bonded IOB                  |    1 |     1 |       100 |  1.00 |
|   IOB Master Pads           |    1 |       |           |       |
|   IOB Slave Pads            |    0 |       |           |       |
| Bonded IPADs                |    0 |     0 |         2 |  0.00 |
| Bonded IOPADs               |    0 |     0 |       130 |  0.00 |
| PHY_CONTROL                 |    0 |     0 |         2 |  0.00 |
| PHASER_REF                  |    0 |     0 |         2 |  0.00 |
| OUT_FIFO                    |    0 |     0 |         8 |  0.00 |
| IN_FIFO                     |    0 |     0 |         8 |  0.00 |
| IDELAYCTRL                  |    0 |     0 |         2 |  0.00 |
| IBUFDS                      |    0 |     0 |        96 |  0.00 |
| PHASER_OUT/PHASER_OUT_PHY   |    0 |     0 |         8 |  0.00 |
| PHASER_IN/PHASER_IN_PHY     |    0 |     0 |         8 |  0.00 |
| IDELAYE2/IDELAYE2_FINEDELAY |    0 |     0 |       100 |  0.00 |
| ILOGIC                      |    0 |     0 |       100 |  0.00 |
| OLOGIC                      |    0 |     0 |       100 |  0.00 |
+-----------------------------+------+-------+-----------+-------+


6. Clocking
-----------

+------------+------+-------+-----------+-------+
|  Site Type | Used | Fixed | Available | Util% |
+------------+------+-------+-----------+-------+
| BUFGCTRL   |    2 |     0 |        32 |  6.25 |
| BUFIO      |    0 |     0 |         8 |  0.00 |
| MMCME2_ADV |    0 |     0 |         2 |  0.00 |
| PLLE2_ADV  |    0 |     0 |         2 |  0.00 |
| BUFMRCE    |    0 |     0 |         4 |  0.00 |
| BUFHCE     |    0 |     0 |        48 |  0.00 |
| BUFR       |    0 |     0 |         8 |  0.00 |
+------------+------+-------+-----------+-------+


7. Specific Feature
-------------------

+-------------+------+-------+-----------+-------+
|  Site Type  | Used | Fixed | Available | Util% |
+-------------+------+-------+-----------+-------+
| BSCANE2     |    1 |     0 |         4 | 25.00 |
| CAPTUREE2   |    0 |     0 |         1 |  0.00 |
| DNA_PORT    |    0 |     0 |         1 |  0.00 |
| EFUSE_USR   |    0 |     0 |         1 |  0.00 |
| FRAME_ECCE2 |    0 |     0 |         1 |  0.00 |
| ICAPE2      |    0 |     0 |         2 |  0.00 |
| STARTUPE2   |    0 |     0 |         1 |  0.00 |
| XADC        |    0 |     0 |         1 |  0.00 |
+-------------+------+-------+-----------+-------+


8. Primitives
-------------

+----------+------+---------------------+
| Ref Name | Used | Functional Category |
+----------+------+---------------------+
| FDRE     |  837 |        Flop & Latch |
| LUT6     |  197 |                 LUT |
| LUT3     |  171 |                 LUT |
| FDCE     |  171 |        Flop & Latch |
| LUT4     |  138 |                 LUT |
| LUT5     |  117 |                 LUT |
| LUT2     |  102 |                 LUT |
| FDPE     |   40 |        Flop & Latch |
| RAMD32   |   36 |  Distributed Memory |
| LUT1     |   23 |                 LUT |
| CARRY4   |   14 |          CarryLogic |
| RAMS32   |   12 |  Distributed Memory |
| FDSE     |   10 |        Flop & Latch |
| MUXF7    |    6 |               MuxFx |
| MUXF8    |    2 |               MuxFx |
| BUFG     |    2 |               Clock |
| IBUF     |    1 |                  IO |
| BSCANE2  |    1 |              Others |
+----------+------+---------------------+


9. Black Boxes
--------------

+----------+------+
| Ref Name | Used |
+----------+------+


10. Instantiated Netlists
-------------------------

+----------+------+
| Ref Name | Used |
+----------+------+
| vio_0    |    1 |
| dbg_hub  |    1 |
+----------+------+
