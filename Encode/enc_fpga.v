`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2015 06:21:55 PM
// Design Name: 
// Module Name: enc_fpga
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
module enc_fpga(
    input [7:0] A,
    output [2:0] Y,
    output Valid
    ); 
    // instantiation and connect the sub modules
FOR_ENC8_3 u0(A,Y, Valid);
endmodule
