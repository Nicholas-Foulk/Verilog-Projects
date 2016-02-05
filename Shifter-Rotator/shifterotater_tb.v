`timescale 1ns / 1ps

module shifterotater_tb();
    reg [2:0] CTRL;
    reg [3:0] A;
    wire [3:0] OUTA;
    reg CLK, RST; 
    integer a,b,c,d;
    shiftrotator dut(A,CTRL, CLK, RST, OUTA);
    initial 
    begin
           for(a=0;a<2;a=a+1)
            for(b=0;b<16;b=b+1)
             for(c=0;c<8;c=c+1)
              for(d=0;d<2;d=d+1)
                    begin
                    CLK=d[0];CTRL=c[2:0];A=b[3:0];RST=a[0];#2;
                    if(RST == 1 && OUTA!==4'b0000)
                    begin $display ("reset fail"); $stop; end
                    if(CLK ==1 && RST == 0)
                  begin
                      if(CTRL == 3'b000) begin if(OUTA !==A)begin $display ("Ctrl =0 failed"); $stop; end end
                      if(CTRL == 3'b001)  begin if(OUTA !=={1'b0,A[3:1]}) begin $display ("ctrl =1 Shift right 1 bit failed"); $stop; end end
                      if(CTRL == 3'b010)  begin if(OUTA !=={2'b00,A[3:2]})begin $display ("ctrl =2 Shift right 2 bit failed"); $stop; end end
                      if(CTRL == 3'b011) begin if(OUTA !=={3'b000,A[3]}) begin $display ("ctrl =3 Shift right 3 bit failed"); $stop; end end
                      if(CTRL == 3'b100) begin if(OUTA !== 4'b0000) begin $display ("ctrl=4 clear failed"); $stop; end end
                      if(CTRL == 3'b101) begin if(OUTA !=={A[0],A[3:1]}) begin $display ("ctrl=5 Rotate right 1 bit failed"); $stop; end end
                      if(CTRL == 3'b110) begin if(OUTA !=={A[1:0],A[3:2]}) begin $display ("ctrl=6 Rotate right 2 bit failed"); $stop; end end
                      if(CTRL == 3'b111) begin if(OUTA !== {A[2:0],A[3]}) begin $display ("ctrl=7 Rotate right 3 bit failed"); $stop; end end
                      end
                 end
            $display("Test Successful!"); $stop;
        end

endmodule
