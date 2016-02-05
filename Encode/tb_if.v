`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2015 06:00:09 PM
// Design Name: 
// Module Name: tb_if
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


module tb_if(

    );
reg [7:0] A;
    wire [2:0] Y;
    wire  Valid;
    IF_ENC8_3 dut (A,Y, Valid);
    
    initial 
    begin
    
    A= 8'b00000000; #100;
    if(Valid != 0) begin $display ("error for valid bit"); $stop; end
    A= 8'b00000001;#100;
    if(Valid != 1 || Y!= 0) begin $display ("error for valid bit, "); $stop; end
    A= 8'b00000010;#100;
    if(Valid != 1 || Y!= 1) begin $display ("error for valid bit"); $stop; end
    A= 8'b00000100;#100;
    if(Valid != 1 || Y!= 2) begin $display ("error for valid bit, "); $stop; end
    A= 8'b00001000; #100;
    if(Valid != 1 || Y!= 3) begin $display ("error for valid bit"); $stop; end
    A= 8'b00010000;#100;
    if(Valid != 1 || Y!= 4) begin $display ("error for valid bit, "); $stop; end
    A= 8'b00100000;#100;
    if(Valid != 1  || Y!= 5) begin $display ("error for valid bit"); $stop; end
    A= 8'b01000000;#100;
    if(Valid != 1 || Y!= 6) begin $display ("error for valid bit, "); $stop; end
    A= 8'b10000000;#100;
    if(Valid != 1 || Y!= 7) begin $display ("error for valid bit, "); $stop; end
    end
    endmodule

