module ram_8x8 (
    input clk,
    input we,
    input [2:0]addr,
    input [7:0]wdata,
    output reg [7:0]rdata
);
reg[7:0] memory [7:0];
always @(posedge clk) begin
    if(we)
    memory[addr]<=wdata;
    else
    rdata<=memory[addr];
    
end
    
endmodule