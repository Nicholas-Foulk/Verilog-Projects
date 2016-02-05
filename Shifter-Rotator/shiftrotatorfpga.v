`timescale 1ns / 1ps
module shiftrotatorfpga (input[3:0] A, input[2:0] C,input clk100MHz, rst, pb, output[3:0] O);

wire clk, clk_5KHz,DONT_USE;
shiftrotator u1(A,C,clk,rst, O);
debounce u2(.pb_debounced(clk),.pb(pb),.clk(clk_5KHz));
clk_gen u5(.clk100MHz(clk100MHz), .rst(rst), .clk_4sec(DONT_USE), .clk_5KHz(clk_5KHz)); 
                              
endmodule