`timescale 1ns / 1ps
module FSM_CU_tb();
reg go;
reg [1:0] op;
reg clk,rst;
wire [1:0] s1, c;
wire [1:0] wa, raa, rab;
wire we; 
wire rea, reb; 
wire s2;
wire [3:0] cs;
wire done;
integer a;	 
//FSM_CU DUT1(.go(go),.Op(op),.se1(s1),.wa(wa),.raa(raa),.rab(rab),
//            .c(c),.we(we),.rea(rea),.reb(reb),.se2(s2),.clk(clk),
//            .rst(rst),.done(done),
//            .cs(cs)); 
FSM_CU DUT1(go,clk,rst,op,we,rea,reb,s2,done,cs,s1,wa,raa,rab,c);
initial 
begin
    clk =0;
    rst= 1;#5;
    rst=0; #5;
    go=1; #5;
    for  (a=0;a<4;a=a+1)
        begin
        op= a[1:0]; #40;
        if (rst && cs !=0) begin $display ("Reset failed"); $stop; end
        if (cs==0 && (s1!=2'b01 || wa!=2'b00 || we!=1'b0 || raa!=2'b00 || rea!=1'b0 || rab!=2'b00 || reb!=1'b0 || c!=2'b00 || s2!=1'b0 || done!=1'b0)) begin $display ("S0 failed"); $stop; end
        if (cs==1 && (s1!=2'b11 || wa!=2'b01 || we!=1'b1 || raa!=2'b00 || rea!=1'b0 || rab!=2'b00 || reb!=1'b0 || c!=2'b00 || s2!=1'b0 || done!=1'b0)) begin $display ("S1 failed"); $stop; end
        if (cs==2 && (s1!=2'b10 || wa!=2'b10 || we!=1'b1 || raa!=2'b00 || rea!=1'b0 || rab!=2'b00 || reb!=1'b0 || c!=2'b00 || s2!=1'b0 || done!=1'b0)) begin $display ("S2 failed"); $stop; end
        if (cs==3 && (s1!=2'b01 || wa!=2'b00 || we!=0 ||raa !=2'b00 ||rea !=0 || rab !=2'b00 || reb != 0 || done!= 0)) begin $display ("S3 failed"); $stop; end
        if (cs==4 && (s1!=2'b00 || wa!=2'b11 || we!=1 ||raa !=2'b01 ||rea !=1 || rab !=2'b10 || reb != 1 || done!= 0 || c!= 2'b00 || s2 != 0)) begin $display ("S4 failed"); $stop; end
        if (cs==5 && (s1 !=2'b00 || wa!=2'b11 || we!=1 ||raa !=2'b01 ||rea !=1 || rab !=2'b10 || reb != 1 || done!= 0 || c!= 2'b01 || s2 != 0)) begin $display ("S5 failed"); $stop; end
        if (cs==6 && (s1 !=2'b00 || wa!=2'b11 || we!=1 ||raa !=2'b01 ||rea !=1 || rab !=2'b10 || reb != 1 || done!= 0 || c!= 2'b10 || s2 != 0)) begin $display ("S6 failed"); $stop; end
        if (cs==7 && (s1 !=2'b00 || wa!=2'b11 || we!=1 ||raa !=2'b01 ||rea !=1 || rab !=2'b10 || reb != 1 || done!= 0 || c!= 2'b11 || s2 != 0)) begin $display ("S7 failed"); $stop; end
        if (cs==8 && (s1 !=2'b01 || wa!=2'b00 || we!=0 ||raa !=2'b11 ||rea !=1 || rab !=2'b11 || reb != 1 || done!= 1 || c!= 2'b10 || s2 != 0)) begin $display ("S8 failed"); $stop; end
        end
        $display("Test sucessful!");$stop;
      end
initial
    begin       
    forever clk=#5 ~clk;
    forever rst=#100 ~rst;
    end 
endmodule