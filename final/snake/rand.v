module rand_number(clk,rst,rand0,rand1);//two rand number
input clk,rst;
output [7:0]rand0,rand1;
reg [7:0]rand0,rand1;

always@(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		rand0 <= 8'b00001111;
		rand1 <= 8'b11000011;
	end
	else
	begin
	rand0[0] <= rand0[7];
	rand0[1] <= rand0[0];
	rand0[2] <= rand0[1];
	rand0[3] <= rand0[2];
	rand0[4] <= rand0[3]^rand0[7];
	rand0[5] <= rand0[4]^rand0[7];
	rand0[6] <= rand0[5]^rand0[7];
	rand0[7] <= rand0[6];
	
	rand1[0] <= rand1[7];
	rand1[1] <= rand1[0];
	rand1[2] <= rand1[1];
	rand1[3] <= rand1[2];
	rand1[4] <= rand1[3]^rand1[7];
	rand1[5] <= rand1[4]^rand1[7];
	rand1[6] <= rand1[5]^rand1[7];
	rand1[7] <= rand1[6];
	end
	
end
endmodule
