`timescale 1ns / 1ps
module FSM_CU(
input go,clk,rst,
input [1:0] op,
output reg we,rea,reb,se2,
output reg done,
output reg [3:0] cs,
output reg [1:0] se1, wa, raa, rab, c
);
reg [3:0] ns;

always @(posedge clk, posedge rst)
begin
    if(rst)
        begin cs<=0; end
    else
        begin cs<=ns; end
end
always@(cs, go, op)
begin
   case(cs)
0:begin se1=2'b01; wa=2'b00; we=1'b0; raa=2'b00; 
rea=1'b0; rab=2'b00; reb=1'b0; c=2'b00; se2=1'b0; done=1'b0; end 
1:begin se1=2'b11; wa=2'b01; we=1'b1; raa=2'b00; 
rea=1'b0; rab=2'b00; reb=1'b0; c=2'b00; se2=1'b0; done=1'b0; end 
2:begin se1=2'b10; wa=2'b10; we=1'b1; raa=2'b00; 
rea=1'b0; rab=2'b00; reb=1'b0; c=2'b00; se2=1'b0; done=1'b0; end 
3:begin se1=2'b01; wa=2'b00; we=1'b0; raa=2'b00; 
rea=1'b0; rab=2'b00; reb=1'b0; c=2'b00; se2=1'b0; done=1'b0; end 
4:begin se1=2'b00; wa=2'b11; we=1'b1; raa=2'b01;
rea=1'b1; rab=2'b10; reb=1'b1; c=2'b00; se2=1'b0; done=1'b0; end 
5:begin se1=2'b00; wa=2'b11; we=1'b1; raa=2'b01;
rea=1'b1; rab=2'b10; reb=1'b1; c=2'b01; se2=1'b0; done=1'b0; end 
6:begin se1=2'b00; wa=2'b11; we=1'b1; raa=2'b01; 
rea=1'b1; rab=2'b10; reb=1'b1; c=2'b10; se2=1'b0; done=1'b0; end 
7:begin se1=2'b00; wa=2'b11; we=1'b1; raa=2'b01;
rea=1'b1; rab=2'b10; reb=1'b1; c=2'b11; se2=1'b0; done=1'b0; end 
8:begin se1=2'b01; wa=2'b00; we=1'b0; raa=2'b11; 
rea=1'b1; rab=2'b11; reb=1'b1; c=2'b10; se2=1'b1; done=1'b1; end 
   endcase
end

always @(cs, go, op)
begin
case(cs)
0: begin if(go)
    ns=1;
    else ns=0;
    end
1:ns=2;
2:ns=3;
3:begin 
    if(op == 2'b00)
        ns=4;
    if(op == 2'b01)
        ns=5;
    if(op == 2'b10)
        ns=6;
    if(op == 2'b11)
        ns=7; 
   end
4: ns=8;
5: ns=8;
6: ns=8;
7: ns=8;
8: ns=0; 
endcase
end
endmodule
