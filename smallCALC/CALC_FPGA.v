`timescale 1ns / 1ps
module CALC_FPGA(
input [2:0] in1, 
input [2:0] in2,
input [1:0] op,
input go,
input rst, 
input clk100MHz,
input pb,
output done,
output [7:0] LEDOUT,
output [7:0] LEDSEL
);
wire [3:0] cs;
wire [2:0] out;
wire DONT_USE, clk_5KHz;
wire pb_debounced;
supply1[7:0] vcc;
wire s0, s1, s2, s3, s4, s5, s6, s7;
wire f0,f1,f2,f3,f4,f5,f6,f7;
assign s7 =1'b1;
assign f7 =1'b1;
clk_gen DUT10(.clk100MHz(clk100MHz), .rst(rst), .clk_4sec(DONT_USE), .clk_5KHz(clk_5KHz));
debounce DUT5(pb_debounced,pb,clk_5KHz);
CALC DUT7(.in1(in1),.in2(in2),.op(op),.go(go),.clk(pb_debounced),.rst(rst),.cs(cs),.out(out),.done(done));
bcd_to_7seg DUT4(out,s0,s1,s2,s3,s4,s5,s6);
bcd_to_7seg DUT3(cs,f0,f1,f2,f3,f4,f5,f6);
LED_MUX DUT9(clk_5KHz,rst,vcc,vcc,vcc,{f7,f6,f5,f4,f3,f2,f1,f0},vcc,vcc,{s7, s6, s5, s4, s3, s2, s1, s0},vcc,LEDOUT,LEDSEL);
endmodule