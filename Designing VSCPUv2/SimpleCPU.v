`timescale 1ns / 1ps
module SimpleCPU(clk, rst, data_fromRAM, wrEn, addr_toRAM, data_toRAM, pCounter);
 
parameter SIZE = 14;

input clk, rst;
input wire [31:0] data_fromRAM;
output reg wrEn;
output reg [SIZE-1:0] addr_toRAM;
output reg [31:0] data_toRAM;
output reg [SIZE-1:0] pCounter;

// internal signals
reg [SIZE-1:0] pCounterNext;
reg [ 3:0] opcode, opcodeNext;
reg [13:0] operand1, operand2, operand1Next, operand2Next;
reg [31:0] num1, num2, num1Next, num2Next;
reg [ 2:0] state, stateNext;
 

always @(posedge clk) begin
  state    <= #1 stateNext;
  pCounter <= #1 pCounterNext;
  opcode   <= #1 opcodeNext;
  operand1 <= #1 operand1Next;
  operand2 <= #1 operand2Next;
  num1     <= #1 num1Next;
  num2     <= #1 num2Next;
end

always @* begin
  stateNext    = state;
  pCounterNext = pCounter;
  opcodeNext   = opcode;
  operand1Next = operand1;
  operand2Next = operand2;
  num1Next     = num1;
  num2Next     = num2;
  addr_toRAM   = 0;
  wrEn         = 0;
  data_toRAM   = 0;
  if (rst) begin
    stateNext    = 0;
    pCounterNext = 0;
    opcodeNext   = 0;
    operand1Next = 0;
    operand2Next = 0;
    num1Next     = 0;
    num2Next     = 0;
    addr_toRAM   = 0;
    wrEn         = 0;
    data_toRAM   = 0;
  end else 
    case (state)
      0: begin         // "addr_toRAM = pCounter" => read memory location of pCounter
         pCounterNext = pCounter;
         opcodeNext   = opcode;
         operand1Next = 0;
         operand2Next = 0;
         addr_toRAM   = pCounter;
         num1Next     = 0;
         num2Next     = 0;
         wrEn         = 0;
         data_toRAM   = 0;
         stateNext    = 1;
      end
      1: begin          // take opcode and request *A
         pCounterNext = pCounter;
         opcodeNext   = data_fromRAM[31:28];
         operand1Next = data_fromRAM[27:14];
         operand2Next = data_fromRAM[13: 0];
         addr_toRAM   = data_fromRAM[27:14];
         num1Next     = 0;
         num2Next     = 0;
         wrEn         = 0;
         data_toRAM   = 0;
         if(opcodeNext == 4'b0001 || opcodeNext == 4'b0011 || opcodeNext == 4'b0101 || opcodeNext == 4'b0111 || opcodeNext == 4'b1001 || opcodeNext == 4'b1101 || opcodeNext == 4'b1111) // ADDi NANDi SRLi LTi CPi BZJi MULi
		      stateNext = 5;
		   if(opcodeNext == 4'b0000 || opcodeNext == 4'b0010 || opcodeNext == 4'b0100 || opcodeNext == 4'b0110 || opcodeNext == 4'b1000 || opcodeNext == 4'b1010 || opcodeNext == 4'b1011 || opcodeNext == 4'b1100 || opcodeNext == 4'b1110) // ADD NAND SRL LT CP CPI CPIi BZJ MUL
			   stateNext = 2;
      end 
      2: begin         // request *B and take *A
         pCounterNext = pCounter;
         opcodeNext   = opcode;
         operand1Next = operand1;
         operand2Next = operand2;
         addr_toRAM   = operand2;
		   num1Next     = data_fromRAM;
		   num2Next     = 0;
		   wrEn         = 0;
		   data_toRAM   = 0;
		   if(opcodeNext == 4'b1010 || opcodeNext == 4'b1011) //CPI CPIi
		      stateNext = 6;
		   else if(opcodeNext == 4'b1100) // BZJ
		      stateNext = 4;
		   else
			   stateNext = 3;
		end
      3: begin         // take *B 
			pCounterNext = pCounter + 1;
			opcodeNext = opcode;
			operand1Next = operand1;
			operand2Next = operand2;
			addr_toRAM = operand1;
			num1Next = num1;
			num2Next = data_fromRAM;
			wrEn = 1;
			if(opcode == 4'b0000)       // ADD
				data_toRAM = num1 + data_fromRAM;   
			if(opcode == 4'b0010)       // NAND
				data_toRAM = ~(num1 & num2Next);
			if(opcode == 4'b0100) begin // SRL
			   if(num2Next < 32)
				   data_toRAM = num1 >> num2Next;
				else begin 
					num2Next = num2Next - 32;
					data_toRAM = num1 << num2Next;
				end
			end
			if(opcode == 4'b0110) begin // LT
			   if(num1 < num2Next)
				     data_toRAM = 1;
				  else
					  data_toRAM = 0;
			end
			if(opcodeNext == 4'b1000)   // CP
			   data_toRAM = data_fromRAM;
			if(opcode == 4'b1110)       // MUL
				data_toRAM = num1 * data_fromRAM;
			stateNext = 0;
      end
	   4: begin                       // BZJ
	      opcodeNext = opcode;
			operand1Next = operand1;
			operand2Next = operand2;
			addr_toRAM = operand1; 
			num1Next = num1;
			num2Next = data_fromRAM;
			wrEn = 0;
			if(data_fromRAM == 0)
			   pCounterNext = num1;				 
			else 
			   pCounterNext = pCounter + 1;
         stateNext = 0;	
		end
      5: begin 
		   pCounterNext = pCounter + 1; 
         opcodeNext   = opcode;
         operand1Next = operand1;
         operand2Next = operand2;
         addr_toRAM   = operand1;
         num1Next     = data_fromRAM;
         num2Next     = operand2;
         wrEn         = 1;
		   if(opcodeNext == 4'b0001)       // ADDi
		      data_toRAM = num1Next + operand2;
			else if(opcodeNext == 4'b0011)  // NANDi
		  	   data_toRAM = ~(num1Next & operand2);
			if(opcodeNext == 4'b0101) begin // SRLi
			   if(operand2 < 32)       
				   data_toRAM = num1Next >> operand2;
			   else begin
				   operand2Next = operand2 - 32;
				   data_toRAM = num1Next << operand2Next;
			   end
		   end
			if(opcodeNext == 4'b0111) begin // LTi 
			   if(num1Next < operand2)
				   data_toRAM = 1;
			   else
			 	   data_toRAM = 0;
		   end
         if(opcodeNext == 4'b1001)       // CPi
			   data_toRAM = operand2;			
		   if(opcodeNext == 4'b1101) begin // BJi
			   wrEn = 0;
			   pCounterNext = data_fromRAM + operand2;
			   data_toRAM   = 32'hFFFF_FFFF;
		   end
		   
		   if(opcodeNext == 4'b1111)       // MULi
			   data_toRAM = num1Next * operand2;
		   stateNext = 0;
		end
		6: begin
		   pCounterNext = pCounter;
         opcodeNext = opcode;
         operand1Next = operand1;
         operand2Next = operand2;
		   if(opcode == 4'b1010) begin   // CPI
            addr_toRAM = data_fromRAM;
            num1Next = num1;
            num2Next = data_fromRAM;
		      wrEn = 0;
			end
			else begin                    // CPIi
			   addr_toRAM = num1;
            num1Next = num1;
            num2Next = data_fromRAM;
		      wrEn = 0;
			end
			stateNext = 7;
		end
		7: begin 
		   pCounterNext = pCounter + 1;
         opcodeNext = opcode;
         operand1Next = operand1;
         operand2Next = operand2;
         num1Next = num1;
         wrEn = 1;
		   if(opcode == 4'b1010) begin  // CPI
		      addr_toRAM = operand1;
		      data_toRAM = data_fromRAM;
		   end
		   else begin                   //CPIi
		      addr_toRAM = num1;
		      data_toRAM = num2;
		   end
		   stateNext = 0; 
		 end
       default: begin
         stateNext    = 0;
         pCounterNext = 0;
         opcodeNext   = 0;
         operand1Next = 0;
         operand2Next = 0;
         num1Next     = 0;
         num2Next     = 0;
         addr_toRAM   = 0;
         wrEn         = 0;
         data_toRAM   = 0;
       end
    endcase
end
endmodule
