`timescale 1ns / 1ps
module CALC(input [2:0] in1, in2, input [1:0] op, input clk, rst, output [2:0] out, input go, output done, output [3:0] cs);

wire[1:0] se1, wa, raa, rab, c; 
wire we, rea, reb, se2; 
FSM_CU DUT12(go, clk, rst, op, we, rea, reb, se2, done, cs, se1, wa, raa, rab, c);
DP DUT13(in1, in2, se1, clk, wa, we, raa, rea, rab, reb, c, se2, out);
endmodule