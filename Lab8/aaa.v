module aaa(
input clk , rst,
output reg[7:0] dot_row ,dot_col);

reg[15:0] count;
reg[3:0] num ;
reg[2:0]  row_count;

always@(posedge clk or negedge rst)
begin 
num = 1;
	if(!rst)
		begin
			dot_row <= 8'b0;
			dot_col <= 8'b0;
			row_count <= 0;
		end
	else
		begin
			if(count == 5000)
				begin
					count <= 0;
					row_count<= row_count + 1 ;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00011000;
				3'd1: dot_col <= 8'b00100100;
				3'd2: dot_col <= 8'b01000010;
				3'd3: dot_col <= 8'b11000011;
				3'd4: dot_col <= 8'b01000010;
				3'd5: dot_col <= 8'b01000010;
				3'd6: dot_col <= 8'b01000010;
				3'd7: dot_col <= 8'b01111110;
			endcase
				end
			else
				begin 
					count <= count + 1;
				end
		end	
		
end




/*always@(num)
begin 
	if(num)
		begin 
			row_count<= row_count + 1 ;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00011000;
				3'd1: dot_col <= 8'b00100100;
				3'd2: dot_col <= 8'b01000010;
				3'd3: dot_col <= 8'b11000011;
				3'd4: dot_col <= 8'b01000010;
				3'd5: dot_col <= 8'b01000010;
				3'd6: dot_col <= 8'b01000010;
				3'd7: dot_col <= 8'b01111110;
			endcase
				
		end
	else
		begin
			dot_row <= 8'b0;
			dot_col <= 8'b0;
			row_count <= 0;
		end
		
end*/
endmodule
	