// Göksel can ÖNAL
// S011827
module knightRider_part4(clk, rst, dataOut);

input clk, rst;
output reg [7:0] dataOut;

reg [21:0] counter, counterNext;
reg [ 7:0] dataOutNext;
reg  flag,flagNext;

parameter COUNT = 22'hF;

// registers
always @(posedge clk) begin
	counter <=  counterNext;
	dataOut <=  dataOutNext;
	flag <=  flagNext;
end

always @(*) begin
	dataOutNext = dataOut;
	counterNext = counter;
	flagNext = flag;
	if(rst) begin
		dataOutNext = 8'b10000001;
		counterNext = 0;
		flagNext = 0;
	end
	else if(counter == COUNT -1) begin
		if(flag == 0) begin
			dataOutNext = {dataOut[4], dataOut[7:5], dataOut[2:0], dataOut[3]};
			counterNext = 0;
		if(dataOutNext == 8'b00011000) begin
			flagNext = 1;
		end
		end
		else begin
			dataOutNext = {dataOut[6:4], dataOut[7], dataOut[0], dataOut[3:1]};
			counterNext = 0;
			flagNext = 1;
			if(dataOutNext == 8'b10000001)begin
				flagNext = 0;
			end
		end
	end
	else begin
		counterNext = counter +1;
	end
end

endmodule



