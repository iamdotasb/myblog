### 片外ram的逻辑仿真
#### 一、片外ram调试的难点
片外ram作为一种外设，其调试手段比较有限，一般就是直接进行板级调试。片外ram板级调试的第一步，一般先调试其读写时序，待读写时序调通后，再进行写入/读出的环回测试。这些调试直接进行板级调试，不会有太大困难。
而实际应用中，对于片外ram读写逻辑的调试的需求往往更重要，直接进行板级调试会非常麻烦，会受到逻辑分析仪以及芯片逻辑资源的限制，并且对于后续代码的维护也不方便。
所以，本文对于片外ram读写逻辑部分的调试提出一种在仿真上调试的方法。
#### 二、读写逻辑调试
读写逻辑调试，顾名思义，就是按照使用者规定的地址顺序，及位宽顺序进行写入。这部分代码，更多的属于逻辑层面，偏向应用，可以与硬件脱离。对于这层代码，其需求变化也往往会比较频繁，每次需求变化如果都需要进行板级调试，会十分不方便。
所谓应用层，就是可以脱离底层独立存在的逻辑，对于片外不同的ram，应用层的逻辑也应该是相同的。而对于频繁变化的需求，就需要通过增加测试用例来维护。
所以对于应用层，需求变化频繁的逻辑，更适合用软件TDD的方式进行开发及维护。
#### 三、"TDD"方式仿真片外ram读写逻辑
这里所谓的TDD——测试驱动开发，是软件开发的概念。对于应用层实现verilog编程，可以借用TDD方法。即在实现应用层verilog编程过程中，同步编写testbench脚本。并且通过跑通testbench脚本，来确保verilog编程的正确性。
以sram为例，其读写时序部分较为简单，这里不做过多说明，先列举sram在testbench中的主要外部引脚，以及其读写时序图。
```verilog
wire [14:0]  sram_addr;    // SRAM地址总线
wire [15:0]  sram_data;    // SRAM数据总线，inout类型
wire sram_wr_n;            // SRAM写选通
reg [15:0] treg_sram_data; // Testbench inout类型的临时寄存器
```
sram写时序如下：
![sram_wr](sram_wr.bmp)
sram读时序如下：
![sram_rd](sram_rd.bmp)
inout类型的sram数据总线，在testbench中的处理如下。利用sram写选通信号，可以分别模拟sram高阻态/写入状态。
```verilog
assign sram_data = (sram_wr_n)?treg_sram_data:16'hzzzz; 
```
由于testbench使用的是仿真pc资源，处理类似sram级别的缓存容量，对于现代计算机来说是可以忽略的。为了更清晰仿真sram行为，在testbench中可以开一片同等sram容量大小的二维寄存器组。
```verilog
//模拟sram缓存寄存器
reg [15:0]moni_sram_buf[32767:0];
```
当sram读出时，需要先给定地址，所以可以利用地址是否变化这一触发条件，模拟sram读出。
同样的，当sram写入时，可以利用数据会发生变化这一触发条件，模拟sram写入。
```verilog
//模拟sram读出
@(sram_addr);
#5;
treg_sram_data = sim_sram_buf[sram_addr];
//模拟sram写入
@(sram_data)
#5;
sim_sram_buf[sram_addr]=sram_data;
```
利用上述方法，可以模拟sram读写场景。接下来，就可以利用testbench的log功能将sram地址与数据记录到文件中，并通过相应的比较逻辑，来判断sram读写逻辑的准确性。这里就不对具体判断逻辑进行展开，目的是引出思路。
















