`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2015 03:20:51 PM
// Design Name: 
// Module Name: priority_encoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module IF_ENC8_3_tb;
reg [7:0]in_tb;
wire [2:0]out_tb;
wire valid_tb;
encoder8_3 DUT(in_tb,out_tb,valid_tb);
initial
    begin
        in_tb =8'b1000_0000; #10;
        if(valid_tb != 0) begin $monitor("Output is incorrect at input NULL");end
        in_tb =8'b00000001; #10;
        if(valid_tb != 1 || out_tb !=0) begin $monitor("Output is incorrect at 0");end
        in_tb =8'b0000_0010; #10;
        if(valid_tb != 1 || out_tb !=1) begin $monitor("Output is incorrect at 1");end
        in_tb =8'b00000100; #10;
        if(valid_tb != 1 || out_tb !=2) begin $monitor("Output is incorrect at 0");end
        in_tb =8'b0000_1000; #10
        if(valid_tb != 1 || out_tb !=3) begin $monitor("Output is incorrect at 1");end
        in_tb =8'b00010000; #10;
        if(valid_tb != 1 || out_tb !=4) begin $monitor("Output is incorrect at 0");end
        in_tb =8'b0010_0000; #10;
        if(valid_tb != 1 || out_tb !=5) begin $monitor("Output is incorrect at 1");end
        in_tb =8'b01000000; #10;
        if(valid_tb != 1 || out_tb !=6) begin $monitor("Output is incorrect at 0");end
        in_tb =8'b1000_0000; #10
        if(valid_tb != 1 || out_tb !=7) begin $monitor("Output is incorrect at 1");end
        $stop;
        $finish;
    end
endmodule