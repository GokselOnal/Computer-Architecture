`timescale 1ns / 1ps
 
module tb;
parameter ADDR_LEN = 14, MEM_DEPTH = 16384;

reg clk;
reg rst;
reg [7:0] testCount = 1;
reg [7:0] errorCount = 0;
wire [ADDR_LEN-1:0] addr_toRAM;
wire [31:0] data_toRAM, data_fromRAM;
wire [ADDR_LEN-1:0] pCounter;

initial begin
    clk = 1;
    forever
        #5 clk = ~clk;
end

initial begin
    rst = 1;
    repeat (10) @(posedge clk);
    rst <= #1 0;
    repeat (500) begin 
        @(posedge clk);
        if(testCount -1 == 10)begin
            pCounterCheck(10,"BZJi"); 
            $display("Total Errors %d ", errorCount); 
            if(errorCount == 0)begin
                $display("Simulation Successfuly Completed !!");
            end else begin
                $display("Simulation FAILED !!");           
            end
            $finish;        
        end
    end
    $display("Simulation finished due Time Limit\nTested Count %d/9\nTotal Errors %d", testCount, errorCount);
    $display("Simulation FAILED !!");
    $finish;  
end

task memCheck;
    input [31:0] memLocation, expectedValue;
    input [47:0] instCode; 
    begin
      if(blram.memory[memLocation] != expectedValue) begin
            $display("Error Found on test code %d, Instruction code %s, %d ns, RAM Addr %d,  expected %d, received %d", testCount -1, instCode, $time, memLocation, expectedValue, blram.memory[memLocation]);
            errorCount = errorCount + 1;
        end
    end
endtask

task pCounterCheck;
    input [31:0] pCounterExpected, instCode; 
    begin
      if(pCounter != pCounterExpected) begin
            $display("Error Found on test code %d, Instruction code %s, %d ns expected %d, received %d", testCount -1, instCode, $time, pCounterExpected, pCounter);
            errorCount = errorCount + 1;
        end
    end
endtask

always@(pCounter) begin
    if(!rst)begin
        case(testCount - 1)
            0: memCheck(12,2,"ADD");
            1: memCheck(12,22,"ADDi");
            2: pCounterCheck(7,"BZJ");
            3: pCounterCheck(8,"BZJ");
            7: pCounterCheck(8, "BZJ");
            8: memCheck(40,100,"CP");
            9: memCheck(100,20,"CPi");
            10: begin
                pCounterCheck(10,"BZJi");
                $display("Total Errors %d", errorCount); 
                $finish;
            end
            default: begin
                $display("Unexpected CHECK !! %d ", testCount - 1);
            end     
        endcase 
        testCount = pCounter + 1;
    end
end

SimpleCPU SimpleCPU(
    .clk(clk),
    .rst(rst),
    .wrEn(wrEn),
    .data_fromRAM(data_fromRAM),
    .addr_toRAM(addr_toRAM),
    .data_toRAM(data_toRAM),
    .pCounter(pCounter)
);

blram #(ADDR_LEN, MEM_DEPTH) blram(
    .clk(clk),
    .rst(rst),
    .i_we(wrEn),
    .i_addr(addr_toRAM),
    .i_ram_data_in(data_toRAM),
    .o_ram_data_out(data_fromRAM)
);

endmodule
