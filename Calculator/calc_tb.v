module calc_tb;

	// Inputs
	reg clk;
	reg rst;
	reg validIn;
	reg [7:0] dataIn;

	// Outputs
	wire [7:0] dataOut;
	
	// Instantiate the Unit Under Test (UUT)
	calc uut(.clk(clk), .rst(rst), .validIn(validIn), .dataIn(dataIn), .dataOut(dataOut));

	reg [7:0] data   [0:14];
	reg [7:0] result [0:15];
	integer ii, jj, errorFlag;
	
	initial $readmemh("data", data);
	initial $readmemh("result", result);

	initial begin
		clk = 1;
		forever
			#5 clk = ~clk;
	end
	
	initial begin
		rst = 0;
		validIn = 0;
		dataIn = 0;

		repeat(5) @(posedge clk);
		rst <= #1 1;
		
		@(posedge clk);
		rst <= #1 0;			
 
		ii = 0;
		repeat(15) begin
			@(posedge clk);			
			dataIn  <= #1 data[ii];				
			repeat(2) begin
				@(posedge clk);
				validIn <= #1 ~validIn;		
			end
			ii = ii + 1;
		end
		#50;
		$finish;
	end



	initial begin
		errorFlag = 0;

		jj = 0;
		repeat(15) @(dataOut) begin
			@(posedge clk);

			if(dataOut !== result[jj]) begin
				$display("Output Error at time %d, expected %d, received %d, data #%d", $time, result[jj], dataOut, jj);
				errorFlag = errorFlag +1; 
			end else
				$display("True Value at time %d, expected %d, received %d, data #%d", $time, result[jj], dataOut, jj);
			jj = jj +1;					  
		end


		if(errorFlag == 0)
			$display("Design contains no errors.. Well done !!!");
		else
			$display("Design contains %d errors!", errorFlag);

	end
endmodule

