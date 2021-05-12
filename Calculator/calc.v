//Göksel can ÖNAL
//S011827
module calc(clk, rst, validIn, dataIn, dataOut);
input clk, rst, validIn;
input  [7:0] dataIn;
output reg [7:0] dataOut;

reg [1:0] state, stateNext;
reg [7:0] number, numberNext, dataOutNext;
reg [2:0] operation, operationNext;

reg validIn_d; // validIn delayed by single clk cycle (new)
wire validIn_pos; // positve edge of validIn (new)

assign validIn_pos = validIn & ~validIn_d; // Use this as the "enter" button (new)

always @(posedge clk) begin
    state       <= #1 stateNext;
    number      <= #1 numberNext;
    operation   <= #1 operationNext;
    dataOut     <= #1 dataOutNext;
    validIn_d   <= #1 validIn; 
end

always @(*) begin
    stateNext     = state;
    numberNext    = number;
    operationNext = operation;
    dataOutNext   = dataOut;
    if(rst) begin
		stateNext     = 1'b0;
       numberNext    = 8'b00000000;
       operationNext = 3'b000;
       dataOutNext   = 8'b00000000;
    end else begin
        case(state)
            0: 
            begin 
					 if(validIn_pos) begin
					   dataOutNext = dataIn;
						numberNext = dataIn;
						stateNext = 1;
					 end
					 else begin
						stateNext = 0;
					 end
            end
            begin 
						if(validIn_pos)begin
						   if(dataIn == 3'b000 || dataIn == 3'b001 || dataIn == 3'b010)begin
							   operationNext = dataIn;
							   dataOutNext = dataIn;
							   stateNext = 2;
							end
						   else if (dataIn == 3'b011 || dataIn == 3'b100 || dataIn == 3'b101)begin
							   if(dataIn == 3'b011)begin
							   dataOutNext = number * number;
							   stateNext = 0;
							   end
							   else if(dataIn == 3'b100)begin
							   dataOutNext = number + 2;
							   stateNext = 0;
							   end
							   else begin
							   dataOutNext = number - 2;
							   stateNext = 0;
							   end
						   end
						end
						else begin
							stateNext = 1;
						end
            end
            2: 
            begin 
					 if(validIn_pos)begin
					    if(operation == 3'b000)begin
						    dataOutNext = number * dataIn;
							 stateNext = 0;
						 end
						 else if(operation == 3'b001)begin
						    dataOutNext = number + dataIn;
							 stateNext = 0;
						 end
						 else begin
						    dataOutNext = number - dataIn;
							 stateNext = 0;
						 end
					 end
					 else begin
						 stateNext = 2;
					 end
            end 
        endcase
    end
end
endmodule
