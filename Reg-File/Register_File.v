`timescale 1ns / 1ps
module Register_File(clk, re1, re2,re3, ra1, ra2,ra3, we1,we2, wa1, wa2, wd1, wd2, rd1, rd2, rd3);
parameter word_width = 32;
parameter rf_size = 32;
parameter addr_size = 5;
input [word_width-1:0] wd1,wd2;
input [addr_size-1:0] ra1, ra2,ra3, wa1,wa2;
input clk, re1, re2, re3, we1,we2;
output [word_width-1:0] rd1, rd2, rd3;
reg [word_width-1:0] RF [rf_size-1:0];

//two read operation (asychronous)
assign rd1 = (re1) ? RF[ra1] : 0;
assign rd2 = (re2) ? RF[ra2] : 0;
assign rd3 = (re3) ? RF[ra3] : 0;

//write operation (synchronous)
always@(posedge clk)
 begin
    if (we1)
        RF[wa1] <= wd1;
    if (we2)
        RF[wa2] <= wd2;
    else
        RF[wa1] = RF[wa1];
 end
endmodule 