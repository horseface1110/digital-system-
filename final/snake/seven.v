module seven(len,out1,out2,clk);

input [5:0] len;
input clk;
output [6:0] out1;
output [6:0] out2;
reg [6:0] out1;
reg [6:0] out2;

always@(posedge clk)
begin
	case(len)
	6'd0 : begin out2 <= 7'b1000000; out1 <= 7'b1000000; // 00
	end
	6'd1 : begin out2 <= 7'b1000000; out1 <= 7'b1111001; // 01
	end
	6'd2 : begin out2 <= 7'b1000000; out1 <= 7'b0100100; // 02
	end
	6'd3 : begin out2 <= 7'b1000000; out1 <= 7'b0110000; // 03
	end
	6'd4 : begin out2 <= 7'b1000000; out1 <= 7'b0011001; // 04
	end
	6'd5 : begin out2 <= 7'b1000000; out1 <= 7'b0010010; // 05
	end
	6'd6 : begin out2 <= 7'b1000000; out1 <= 7'b0000010; // 06
	end
	6'd7 : begin out2 <= 7'b1000000; out1 <= 7'b1111000; // 07
	end
	6'd8 : begin out2 <= 7'b1000000; out1 <= 7'b0000000; // 08
	end
	6'd9 : begin out2 <= 7'b1000000; out1 <= 7'b0010000; // 09
	end
	6'd10 : begin out2 <= 7'b1111001; out1 <= 7'b1000000; // 10	
	end
	6'd11 : begin out2 <= 7'b1111001; out1 <= 7'b1111001; // 11
	end
	6'd12 : begin out2 <= 7'b1111001; out1 <= 7'b0100100; // 12
	end
	6'd13 : begin out2 <= 7'b1111001; out1 <= 7'b0110000; // 13
	end
	6'd14 : begin out2 <= 7'b1111001; out1 <= 7'b0011001; // 14
	end
	6'd15 : begin out2 <= 7'b1111001; out1 <= 7'b0010010; // 15
	end
	6'd16 : begin out2 <= 7'b1111001; out1 <= 7'b0000010; // 16
	end
	6'd17 : begin out2 <= 7'b1111001; out1 <= 7'b1111000; // 17
	end
	6'd18 : begin out2 <= 7'b1111001; out1 <= 7'b0000000; // 18
	end
	6'd19 : begin out2 <= 7'b1111001; out1 <= 7'b0010000; // 19
	end
	default : begin out1 <= 7'b1000000; out2 <= 7'b1000000; // 00
	end
	endcase
	// out1's port is seven segment digit[0]
	// out2's port is seven segment digit[1]
end
endmodule
