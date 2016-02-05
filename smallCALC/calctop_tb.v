`timescale 1ns / 1ps
module calctop_tb();
reg [2:0] in1, in2;
reg [1:0] op;
reg clk, rst, go;
wire [2:0] out;
wire done;
wire[3:0] cs; 
integer a1,a2,a3, a4;
CALC DUT22(.in1(in1), .in2(in2), .op(op), .clk(clk), 
           .rst(rst), .out(out), .go(go), .done(done),.cs(cs));
initial 
begin 
rst=1; #5
rst=0; #5
in1=0;
in2=0;
go=0;#5;
go=1;
for(a3=0;a3<4;a3=a3+1)
    begin
    op=a3[1:0];
    for(a1=0;a1<8;a1=a1+1)
        begin
        in1=a1[2:0];
        for(a2=0;a2<8;a2=a2+1)
            begin
            in2=a2[2:0];
            for(a4=0;a4<8;a4=a4+1)
                begin
                clk=a4[0];#10;
                if(a3==2'b00 && cs==8 &&  out!=in1+in2 &&done!=1) 
                      begin $display("Adding Failed"); $stop; end
                if(a3==2'b01 && cs==8 &&  out!=in1-in2 &&done!=1) 
                      begin $display("Subtracting Failed"); $stop; end
                if(a3==2'b10 && cs==8 &&  out!=in1&in2 &&done!=1) 
                      begin $display("And Failed"); $stop; end
                if(a3==2'b11 && cs==8 &&  out!=in1^in2 &&done!=1) 
                      begin $display("Exclusive or(XOR) Failed"); $stop; end
                end
            end
        end
   end
  $display("Test sucessful!"); $stop;
end
endmodule
