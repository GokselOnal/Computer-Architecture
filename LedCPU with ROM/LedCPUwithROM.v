module LedCPUwithROM(clk, rst, outPattern);
input clk, rst;
output [7:0] outPattern;

parameter FREQ_MCLK = 50_000_000;
parameter FREQ_DELAY = 1; //FREQ_MCLK/16;

wire [ 7:0]addrRd;
wire [15:0]dataRd;

LedCPUcore #(FREQ_DELAY) LedCPUcore(.clk(clk), .rst(rst), .addrRd(addrRd), .dataRd(dataRd), .outPattern(outPattern));
ROM ROM(.addrRd(addrRd), .dataRd(dataRd));

endmodule
