`timescale 1ns / 1ps

module Register_File_tb( );
parameter word_width = 32;
parameter rf_size = 32;
parameter addr_size = 5;
reg clk_tb;
reg [word_width-1:0] wd1_tb, wd2_tb;
reg we1_tb, we2_tb;
reg re1_tb, re2_tb, re3_tb;
reg [addr_size-1:0] ra1_tb, ra2_tb, ra3_tb, wa1_tb, wa2_tb;
reg[word_width-1:0] RF[rf_size-1:0];
integer a,b;
integer c,d,e,f,i;

wire [word_width-1:0] rd1_tb, rd2_tb, rd3_tb;

Register_File DUT(clk_tb, 
                   re1_tb,re2_tb,re3_tb, 
                   ra1_tb,ra2_tb,ra3_tb,
                   we1_tb,we2_tb, 
                   wa1_tb,wa2_tb, 
                   wd1_tb, wd2_tb, 
                   rd1_tb, rd2_tb, rd3_tb);

initial
   begin
       begin
       //write data to 0 and write enable to 1
       //writing write data to write address loop
        we1_tb=1;wd1_tb=0;
         for(a=0;a<32;a=a+1)
            for(b=0;b<=1;b=b+1)
            begin
            wa1_tb=a[4:0]; clk_tb=b;#5
            if(we1_tb) RF[wa1_tb]<= wd1_tb;
            end
         end 
        begin  
        // enables for each read and write   
        re1_tb=1;re2_tb=1;re3_tb=1; we1_tb=1;  
         for(c=0;c<32;c=c+1)
            for(d=0;d<2;d=d+1)
                begin
                clk_tb=d[0]; wa1_tb=c[4:0]; ra1_tb=c[4:0]; ra2_tb=c[4:0]; ra3_tb=c[4:0]; 
                #2;
                wd1_tb = 5;                       
                if(we1_tb) RF[wa1_tb]<=wd1_tb;
                if(we2_tb) RF[wa2_tb]<=wd2_tb;
                //if(re1_tb && re1_tb && ra1_tb == 0 && rd1_tb !==0) begin $display ("write address 1 zero failed"); $stop; end
               // if(clk_tb && re2_tb && ra2_tb == 0 && rd2_tb !==0) begin $display ("write address 2 zero failed"); $stop; end
                if(clk_tb && we1_tb && wd1_tb!==RF[wa1_tb])begin $display ("write data 1 failed"); $stop; end
                if(clk_tb && we2_tb && wd2_tb!==RF[wa2_tb])begin $display ("write data 2 failed"); $stop; end
                if(RF[ra1_tb]!==rd1_tb) begin $display ("read data 1 failed"); $stop; end
                if(RF[ra2_tb]!==rd2_tb) begin $display ("read data 2 failed"); $stop; end
                if(RF[ra3_tb]!==rd3_tb) begin $display ("read data 3 failed"); $stop; end
//                if(rd1_tb !== (re1_tb) ? RF[ra1_tb] : 0) begin $display ("read data 1 failed"); $stop; end
//                if(rd2_tb !== (re2_tb) ? RF[ra2_tb] : 0) begin $display ("read data 2 failed"); $stop; end
//                if(rd3_tb !== (re3_tb) ? RF[ra3_tb] : 0) begin $display ("read data 3 failed"); $stop; end
                end 
           end 
//           begin  
//            wd1_tb=512; wd2_tb=1372;
//            for(e=0;e<=31;e=e+1)
//                for(f=0;f<=31;f=f+1)
//                    for(i=0;i<=1;i=i+1)
//                    begin
//                    we1_tb=e[4]; 
//                    we2_tb=e[1];
//                    wa1_tb=e[4:0]; 
//                    clk_tb = i[0]; 
//                    ra1_tb=f[4:0]; 
//                    // I took out the g and h loops for read address 2 and 3 since the amount of loops needed to run the task
//                    //was too high
//                    ra2_tb={f[3:0],f[4]};
//                    ra3_tb={f[2:0],f[4:3]};
//                    //write address 1 and write adress 2 cannot be equal  
//                    wa2_tb = ~wa1_tb;                         
//                    #2;                                                    
//                    if(we1_tb) RF[wa1_tb]<= wd1_tb;
//                    if(we2_tb) RF[wa2_tb]<= wd2_tb;                    
//                    //if(clk_tb && re1_tb && ra1_tb == 0 && rd1_tb !==0) begin $display ("write address 1 zero failed"); $stop; end
//                   // if(clk_tb && re2_tb && ra2_tb == 0 && rd2_tb !==0) begin $display ("write address 2 zero failed"); $stop; end
//                    if(clk_tb && we1_tb && wd1_tb!==RF[wa1_tb])begin $display ("write data 1 failed"); $stop; end
//                    if(clk_tb && we2_tb && wd2_tb!==RF[wa2_tb])begin $display ("write data 2 failed"); $stop; end
//                    //Since i am "toggling" write enable, I didn't use the previous method here
//                    if(RF[ra1_tb]!==rd1_tb) begin $display ("read data 1 failed"); $stop; end
//                    if(RF[ra2_tb]!==rd2_tb) begin $display ("read data 2 failed"); $stop; end
//                    if(RF[ra3_tb]!==rd3_tb) begin $display ("read data 3 failed"); $stop; end
//                    end
//            end
            $display ("Test Sucessful!"); $stop;

   end 
endmodule

