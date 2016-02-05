`timescale 1ns / 1ps
module RF(clk, rea, reb, raa,rab,we,wa, din, douta, doutb);
input clk, rea, reb, we;
input[1:0] raa, rab, wa;
input[2:0] din;
output reg[2:0] douta, doutb;
reg[2:0] mem [3:0];
always@(rea,reb,raa,rab, mem[raa], mem[rab] )
begin 
if (rea == 1)
douta <= mem[raa];
else
douta <= 3'b000;
if (reb == 1)
doutb <= mem[rab];
else
doutb <= 3'b000;
end
always@(posedge clk)
begin
if (we)
mem[wa] <= din;
end
endmodule 
