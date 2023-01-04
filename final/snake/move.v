module move(clk10000,direction,rst,rand0,rand1,len,clk12500000,dot_row,dot_col);

input clk10000,rst,clk12500000;
input [1:0]direction;
input [7:0] rand0;
input [7:0] rand1;
output [5:0] len;
output [7:0] dot_row;
output [7:0] dot_col;

reg [2:0] c;//uesd in dot
reg [7:0] dot_row;
reg [7:0] dot_col;
reg [2:0] head [0:1];//location of snake's head,(x,y)
reg [2:0] apple [0:1];//location of apple,(x,y)
reg [5:0] len;
reg [5:0] lives [7:0][7:0];//record snake's path

always@(posedge clk12500000 or negedge rst)
begin
	if(!rst)//reset
	begin
		len = 6'd2;
		head[0] = 6;          
		head[1] = 1;
		apple[0] = 6'd4;
		apple[1] = 6'd3;
		
		lives[0][0] = 6'd1;
		lives[0][1] = 6'd1;
		lives[0][2] = 6'd1;
		lives[0][3] = 6'd1;
		lives[0][4] = 6'd1;
		lives[0][5] = 6'd1;
		lives[0][6] = 6'd1;
		lives[0][7] = 6'd1;
		
		lives[1][0] = 6'd1;
		lives[1][1] = 6'd0;
		lives[1][2] = 6'd0;
		lives[1][3] = 6'd0;
		lives[1][4] = 6'd0;
		lives[1][5] = 6'd0;
		lives[1][6] = 6'd0;
		lives[1][7] = 6'd1;
		
		lives[2][0] = 6'd1;
		lives[2][1] = 6'd0;
		lives[2][2] = 6'd0;
		lives[2][3] = 6'd0;
		lives[2][4] = 6'd0;
		lives[2][5] = 6'd0;
		lives[2][6] = 6'd0;
		lives[2][7] = 6'd1;
		
		lives[3][0] = 6'd1;
		lives[3][1] = 6'd0;
		lives[3][2] = 6'd0;
		lives[3][3] = 6'd0;
		lives[3][4] = 6'd0;
		lives[3][5] = 6'd0;
		lives[3][6] = 6'd0;
		lives[3][7] = 6'd1;
		
		lives[4][0] = 6'd1;
		lives[4][1] = 6'd0;
		lives[4][2] = 6'd0;
		lives[4][3] = 6'd0;
		lives[4][4] = 6'd0;
		lives[4][5] = 6'd0;
		lives[4][6] = 6'd0;
		lives[4][7] = 6'd1;
		
		lives[5][0] = 6'd1;
		lives[5][1] = 6'd0;
		lives[5][2] = 6'd0;
		lives[5][3] = 6'd0;
		lives[5][4] = 6'd0;
		lives[5][5] = 6'd0;
		lives[5][6] = 6'd0;
		lives[5][7] = 6'd1;
		
		lives[6][0] = 6'd1;
		lives[6][1] = 6'd0;
		lives[6][2] = 6'd0;
		lives[6][3] = 6'd0;
		lives[6][4] = 6'd0;
		lives[6][5] = 6'd0;
		lives[6][6] = 6'd0;
		lives[6][7] = 6'd1;
		
		lives[7][0] = 6'd1;
		lives[7][1] = 6'd1;
		lives[7][2] = 6'd1;
		lives[7][3] = 6'd1;
		lives[7][4] = 6'd1;
		lives[7][5] = 6'd1;
		lives[7][6] = 6'd1;
		lives[7][7] = 6'd1;
	end
	else
	begin
	///先調整頭的位置就好，身體等判斷完再處理
		case(direction)
			2'b00:head[0] = head[0]-3'd1;//up
			2'b01:head[0] = head[0]+3'd1;//down
			2'b10:head[1] = head[1]-3'd1;//left
			2'b11:head[1] = head[1]+3'd1;//right
		endcase
	
		if(head[0]==0 || head[1]==0 || head[0]==7 || head[1]==7)
		//if hit wall, die(reset)
		begin
			len = 6'd2;
			head[0] = 6;         
			head[1] = 1;          
			lives[0][0] = 6'd1;
			lives[0][1] = 6'd1;
			lives[0][2] = 6'd1;
			lives[0][3] = 6'd1;
			lives[0][4] = 6'd1;
			lives[0][5] = 6'd1;
			lives[0][6] = 6'd1;
			lives[0][7] = 6'd1;
			
			lives[1][0] = 6'd1;
			lives[1][1] = 6'd0;
			lives[1][2] = 6'd0;
			lives[1][3] = 6'd0;
			lives[1][4] = 6'd0;
			lives[1][5] = 6'd0;
			lives[1][6] = 6'd0;
			lives[1][7] = 6'd1;
			
			lives[2][0] = 6'd1;
			lives[2][1] = 6'd0;
			lives[2][2] = 6'd0;
			lives[2][3] = 6'd0;
			lives[2][4] = 6'd0;
			lives[2][5] = 6'd0;
			lives[2][6] = 6'd0;
			lives[2][7] = 6'd1;
			
			lives[3][0] = 6'd1;
			lives[3][1] = 6'd0;
			lives[3][2] = 6'd0;
			lives[3][3] = 6'd0;
			lives[3][4] = 6'd0;
			lives[3][5] = 6'd0;
			lives[3][6] = 6'd0;
			lives[3][7] = 6'd1;
			
			lives[4][0] = 6'd1;
			lives[4][1] = 6'd0;
			lives[4][2] = 6'd0;
			lives[4][3] = 6'd0;
			lives[4][4] = 6'd0;
			lives[4][5] = 6'd0;
			lives[4][6] = 6'd0;
			lives[4][7] = 6'd1;
			
			lives[5][0] = 6'd1;
			lives[5][1] = 6'd0;
			lives[5][2] = 6'd0;
			lives[5][3] = 6'd0;
			lives[5][4] = 6'd0;
			lives[5][5] = 6'd0;
			lives[5][6] = 6'd0;
			lives[5][7] = 6'd1;
			
			lives[6][0] = 6'd1;
			lives[6][1] = 6'd0;
			lives[6][2] = 6'd0;
			lives[6][3] = 6'd0;
			lives[6][4] = 6'd0;
			lives[6][5] = 6'd0;
			lives[6][6] = 6'd0;
			lives[6][7] = 6'd1;
			
			lives[7][0] = 6'd1;
			lives[7][1] = 6'd1;
			lives[7][2] = 6'd1;
			lives[7][3] = 6'd1;
			lives[7][4] = 6'd1;
			lives[7][5] = 6'd1;
			lives[7][6] = 6'd1;
			lives[7][7] = 6'd1;
		end
		else if(head[0]==apple[0] && head[1]==apple[1])
		//if eat apple, length+=1 and generate new apple
		begin
			lives[head[0]][head[1]] = len + 6'd1; 
			len = len + 6'd1;
			apple[0] = (rand0%6)+1;
			apple[1] = (rand1%6)+1;
		end
		else    
		//move one step
		begin
			lives[head[0]][head[1]] = (len + 6'd1);     
			if(lives[1][1] > 0)
				begin 
				lives[1][1] = lives[1][1] - 6'd1;
				end
			if(lives[1][2] > 0)
				begin 
				lives[1][2] = lives[1][2] - 6'd1;
				end
			if(lives[1][3] > 0)
				begin 
				lives[1][3] = lives[1][3] - 6'd1;
				end
			if(lives[1][4] > 0)
				begin 
				lives[1][4] = lives[1][4] - 6'd1;
				end
			if(lives[1][5] > 0)
				begin 
				lives[1][5] = lives[1][5] - 6'd1;
				end
			if(lives[1][6] > 0)
				begin 
				lives[1][6] = lives[1][6] - 6'd1;
				end
			if(lives[2][1] > 0)
				begin 
				lives[2][1] = lives[2][1] - 6'd1;
				end
			if(lives[2][2] > 0)
				begin 
				lives[2][2] = lives[2][2] - 6'd1;
				end
			if(lives[2][3] > 0)
				begin 
				lives[2][3] = lives[2][3] - 6'd1;
				end
			if(lives[2][4] > 0)
				begin 
				lives[2][4] = lives[2][4] - 6'd1;
				end
			if(lives[2][5] > 0)
				begin 
				lives[2][5] = lives[2][5] - 6'd1;
				end
			if(lives[2][6] > 0)
				begin 
				lives[2][6] = lives[2][6] - 6'd1;
				end
			if(lives[3][1] > 0)
				begin 
				lives[3][1] = lives[3][1] - 6'd1;
				end
			if(lives[3][2] > 0)
				begin 
				lives[3][2] = lives[3][2] - 6'd1;
				end
			if(lives[3][3] > 0)
				begin 
				lives[3][3] = lives[3][3] - 6'd1;
				end
			if(lives[3][4] > 0)
				begin 
				lives[3][4] = lives[3][4] - 6'd1;
				end
			if(lives[3][5] > 0)
				begin 
				lives[3][5] = lives[3][5] - 6'd1;
				end
			if(lives[3][6] > 0)
				begin 
				lives[3][6] = lives[3][6] - 6'd1;
				end
			if(lives[4][1] > 0)
				begin 
				lives[4][1] = lives[4][1] - 6'd1;
				end
			if(lives[4][2] > 0)
				begin 
				lives[4][2] = lives[4][2] - 6'd1;
				end
			if(lives[4][3] > 0)
				begin 
				lives[4][3] = lives[4][3] - 6'd1;
				end
			if(lives[4][4] > 0)
				begin 
				lives[4][4] = lives[4][4] - 6'd1;
				end
			if(lives[4][5] > 0)
				begin 
				lives[4][5] = lives[4][5] - 6'd1;
				end
			if(lives[4][6] > 0)
				begin 
				lives[4][6] = lives[4][6] - 6'd1;
				end
			if(lives[5][1] > 0)
				begin 
				lives[5][1] = lives[5][1] - 6'd1;
				end
			if(lives[5][2] > 0)
				begin 
				lives[5][2] = lives[5][2] - 6'd1;
				end
			if(lives[5][3] > 0)
				begin 
				lives[5][3] = lives[5][3] - 6'd1;
				end
			if(lives[5][4] > 0)
				begin 
				lives[5][4] = lives[5][4] - 6'd1;
				end
			if(lives[5][5] > 0)
				begin 
				lives[5][5] = lives[5][5] - 6'd1;
				end
			if(lives[5][6] > 0)
				begin 
				lives[5][6] = lives[5][6] - 6'd1;
				end
			if(lives[6][1] > 0)
				begin 
				lives[6][1] = lives[6][1] - 6'd1;
				end
			if(lives[6][2] > 0)
				begin 
				lives[6][2] = lives[6][2] - 6'd1;
				end
			if(lives[6][3] > 0)
				begin 
				lives[6][3] = lives[6][3] - 6'd1;
				end
			if(lives[6][4] > 0)
				begin 
				lives[6][4] = lives[6][4] - 6'd1;
				end
			if(lives[6][5] > 0)
				begin 
				lives[6][5] = lives[6][5] - 6'd1;
				end
			if(lives[6][6] > 0)
				begin 
				lives[6][6] = lives[6][6] - 6'd1;
				end	
		end
		lives[apple[0]][apple[1]] = 1;	
	end
end


always@(posedge clk10000 or negedge rst)
begin 
	if(!rst) begin
		dot_row <= 8'b11111111;
		dot_col <= 8'b00000000;
	end
	else begin
		case(c)
			3'd0:dot_row<=8'b01111111;
			3'd1:dot_row<=8'b10111111;
			3'd2:dot_row<=8'b11011111;
			3'd3:dot_row<=8'b11101111;
			3'd4:dot_row<=8'b11110111;
			3'd5:dot_row<=8'b11111011;
			3'd6:dot_row<=8'b11111101;
			3'd7:dot_row<=8'b11111110;
		endcase
		
		if(lives[c][0] > 6'd0) begin
			dot_col[7] <= 1'b1;
		end
		else begin
			dot_col[7] <= 1'b0;
		end
		if(lives[c][1] > 6'd0) begin
			dot_col[6] <= 1'b1;
		end
		else begin
			dot_col[6] <= 1'b0;
		end
		if(lives[c][2] > 6'd0) begin
			dot_col[5] <= 1'b1;
		end
		else begin
			dot_col[5] <= 1'b0;
		end
		if(lives[c][3] > 6'd0) begin
			dot_col[4] <= 1'b1;
		end
		else begin
			dot_col[4] <= 1'b0;
		end
		if(lives[c][4] > 6'd0) begin
			dot_col[3] <= 1'b1;
		end
		else begin
			dot_col[3] <= 1'b0;
		end
		if(lives[c][5] > 6'd0) begin
			dot_col[2] <= 1'b1;
		end
		else begin
			dot_col[2] <= 1'b0;
		end
		if(lives[c][6] > 6'd0) begin
			dot_col[1] <= 1'b1;
		end
		else begin
			dot_col[1] <= 1'b0;
		end
		if(lives[c][7] > 6'd0) begin
			dot_col[0] <= 1'b1;
		end
		else begin
			dot_col[0] <= 1'b0;
		end
		
		c<=c+1;
	end
end

endmodule
