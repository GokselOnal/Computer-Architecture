// Göksel can Önal
// S011827

module cpuSevenSegment(sw, an, seg);

input [7:0] sw;
output reg [3:0] an;
output reg [7:0] seg;


reg [3:0] result;

always@(*) begin
	an = 4'b1110;
    
	if (sw[7:6] == 2'b00) begin
		result = sw[3:2] + sw[1:0];
	end
	else if (sw[7:6] == 2'b01) begin
		result = sw[3:2] - sw[1:0];
	end
	else if (sw[7:6] == 2'b10) begin
		result = sw[3:2] * sw[1:0];
	end
	else begin
		result = sw[3:2] | sw[1:0];
	end
	case(result)
      0: seg = 8'b11000000;  //0
		1: seg = 8'b11111001;  //1
		2: seg = 8'b10100100;  //2
		3: seg = 8'b10110000;  //3
      4: seg = 8'b10011001;  //4
		5: seg = 8'b10010010;  //5
		6: seg = 8'b10000010;  //6
		7: seg = 8'b11111000;  //7
		8: seg = 8'b10000000;  //8
		9: seg = 8'b10010000;  //9
		10:seg = 8'b10001000;  //10
		11:seg = 8'b10000011;  //11
		12:seg = 8'b11000110;  //12
		13:seg = 8'b10100001;  //13
		14:seg = 8'b10000110;  //14
		15:seg = 8'b10001110;  //15
		default: seg = 8'b11111111;  //default
	endcase
	
end

endmodule

