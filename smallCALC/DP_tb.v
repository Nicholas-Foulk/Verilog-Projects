`timescale 1ns / 1ps
module DP_tb();

reg [2:0] in1, in2;
reg [1:0] s1, wa, raa, rab, c;
reg we, rea, reb, s2, clk;
wire [2:0] out; 
reg[1:0] state;
integer a, b,d, f, clkk, test;

DP dut(in1, in2, s1, clk, wa, we, raa, rea, rab, reb, c, s2, out);

initial
begin	
    for(b = 0; b < 8; b = b + 1)     // input 1
       for(a = 0; a < 8; a = a + 1) // input 0
            for(d = 0; d < 4; d = d + 1) // alu control 
              for (f = 0; f < 4; f = f + 1) // three steps - load 0 , load 1, read
                for(clkk = 0; clkk < 2; clkk = clkk +1)
                   begin 
                       clk<=clkk[0]; state<= f[1:0]; c<= d[1:0]; 
                       in1<=a[2:0];    in2<=b[2:0];    #1;        
             
                       case(state) 
                           0: 
                           begin s1=2'b11; wa=2'b00; we=1'b1; raa=2'b01;
                                 rea=1'b0; rab=2'b00; reb=0; s2=1'b0; end
                           1: 
                           begin s1=2'b10; wa=2'b01; we=1'b1; raa=2'b01; 
                                 rea=1'b0; rab=2'b00; reb=0; s2=1'b0; end
                           2: 
                           begin s1=2'b00; wa=2'b10; we=1'b1; raa=2'b00; 
                                 rea=1'b1; rab=2'b01; reb=1; s2=1'b0; end
                           3: 
                           begin s1=2'b01; wa=2'b10; we=1'b0; raa=2'b00; 
                                 rea=1'b1; rab=2'b01; reb=1; s2=1'b1; end    
                       endcase
                       #5;
                       case(c)
                               2'b00:
                                   begin 
                                   test = in1 + in2;
                                   if((test[2:0]!=out) && ({f[1:0],clkk[0]}==3'b111))
                                   begin $display("Adding Failed"); $stop; end
                                   end
                               2'b01:
                                   begin
                                   test = (in1 - in2);
                                   if((test[2:0]!=out) && ({f[1:0],clkk[0]}==3'b111))
                                   begin $display("Subtracting Failed"); $stop; end
                                   end
                               2'b10:
                                   begin
                                   test = (in1 & in2);
                                   if((test[2:0]!=out) && ({f[1:0],clkk[0]}==3'b111))
                                   begin $display("And Failed"); $stop; end
                                   end
                               2'b11:
                                   begin
                                   test = (in1^ in2);
                                   if((test[2:0]!=out) && ({f[1:0],clkk[0]}==3'b111))
                                   begin $display("Exclusive or(XOR) Failed"); $stop; end
                                   end
                           endcase
                   end
        $display("Test sucessful!");$stop;
end
endmodule
