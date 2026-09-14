module tb_ram_8x8;
// testbench signals
reg clk;
reg we;
reg [2:0]addr;
reg [7:0]wdata;
wire [7:0] rdata;
//connect the ram(dut)
ram_8x8 dut(.clk(clk),.we(we),.addr(addr),.wdata(wdata),.rdata(rdata));
// generate clock
initial begin
clk=0;
forever #5 clk=~clk;
end
//monitor changes in terminal
$monitor("Time=%0t | we=%b | addr=%b |rdata=%h",$time ,we.addr.wdata,rdata);

//apply test inputs
initial begin
    //write phase
    we=1;
    addr=3'b000; wdata=8'b10101010; #10;
    addr=3'b001; wdata=8'b11001100; #10;
    addr=3'b010; wdata=8'b11110000; #10;

      //change to read mode
    we=0; addr=3'b000; #10;
    we=0; addr=3'b001; #10;
    we=0; addr=3'b010; #10;
    $finish;
end
//generate waveform file
initial begin
    $dumpfile("ram_8x8.vcd");
    $dumpvars(0,tb_ram_8x8);
end
endmodule