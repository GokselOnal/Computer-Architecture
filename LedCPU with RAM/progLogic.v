module progLogic(
    clk,
	rst,
	switch,
    enter,
	addrWr
	dataWr,
	WrEn
    );
	
input clk,rst;
input [7:0] switch;
input enter;
output reg [7:0] addrWr;
output reg [15:0] dataWr;
output reg WrEn;

reg [7:0] addrWrNext;
reg [15:0] dataWrNext;
reg wrEnNext;

reg [1:0] state, stateNext;

wire enter_pos;
reg enter_d;
assign enter_pos = enter & ~enter_d;

always@ (posedge clk) begin
	addrWr <=#1 addrWrNext;
	dataWr <=#1 dataWrNext;
	wrEn <=#1 wrEnNext;
	state <=#1 stateNext;
	enter_d <=#1 enter;
end

always@(*)begin
    addrWrNext = addrWr;
	dataWrNext = dataWr;
	wrEnNext = 0;
	stateNext = state;
	
    if(rst)begin
	    addrWrNext = 0;
		dataWrNext = 0;
		WrEnNext = 0;
		stateNext = 0;
	end
	else begin
	    case (state)
		    0: begin
			    if(enter_pos) begin
				    dataWrNext[15:8] = switch;
					wrEnNext = 1;
					stateNext = 1;
				end 
			end
			1: begin
			    if(enter_pos) begin
				    dataWrNext[7:0] = switch;
					wrEnNext = 1;
					stateNext = 2;	
				end
			end
			2: begin
			    addrWrNext = addrWr + 1;
				stateNext = 0;
			end	
		endcase
	end
end
endmodule