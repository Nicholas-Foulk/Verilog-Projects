`timescale 1ns / 1ps

module shiftrotator(input [3:0] D, input [2:0] CTRL, input CLK, RST, output reg [3:0] Q);
always @(posedge CLK, posedge RST)
begin
    if (RST)
     Q <= 4'b0000;
    else
    begin
           if(CTRL == 3'b000)
                Q <= D;
           if(CTRL == 3'b001) 
                Q <={1'b0,D[3:1]};        
           if(CTRL == 3'b010)
                Q <={2'b00,D[3:2]};
           if(CTRL == 3'b011) 
                Q <= {3'b000,D[3]};
           if(CTRL == 3'b100) 
                Q <= 4'b0000;
           if(CTRL == 3'b101) 
                Q <= {D[0],D[3:1]};   
           if(CTRL == 3'b110) 
                Q <= {D[1:0],D[3:2]};
           if(CTRL == 3'b111)
                Q <= {D[2:0],D[3]};
     
    end
end
endmodule
