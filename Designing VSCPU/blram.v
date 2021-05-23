module blram(clk, rst, i_we, i_addr, i_ram_data_in, o_ram_data_out);

parameter ADDR_LEN = 14, MEM_DEPTH = 16384;

input clk; 
input rst;
input i_we;
input [ADDR_LEN-1:0] i_addr;
input [31:0] i_ram_data_in;
output reg [31:0] o_ram_data_out;

reg [31:0] memory[0:MEM_DEPTH-1];

always @(posedge clk) begin
  o_ram_data_out <= #1 memory[i_addr[ADDR_LEN-1:0]];
  if (i_we)
		memory[i_addr[ADDR_LEN-1:0]] <= #1 i_ram_data_in;
end 

initial begin
  `include "data.v"
end 

endmodule
