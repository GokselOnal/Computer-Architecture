// Göksel can ÖNAL
// S011827
module rotatingDot(clk, rst, dataOut);

input clk, rst;
output reg [7:0] dataOut;

reg [21:0] counter, counterNext;
reg [ 7:0] dataOutNext;

parameter COUNT = 22'h3F ;


always @(posedge clk) begin
	counter <= #1 counterNext;
	dataOut <= #1 dataOutNext;
end

always @(*) begin
	if(rst) begin
		dataOutNext = 8'b10000000; //8'h80
		counterNext = 0;
	end
	else if(counter == COUNT -1) begin
		dataOutNext = {dataOut[0], dataOut[7:1]};
		counterNext = 0;
	end
	else begin
		dataOutNext = dataOut;
		counterNext = counter + 1;
	end
end

endmodule
