module changeDirec(up,down,left,right,direction);
input up,down,left,right;
output[1:0] direction;
reg [1:0] direction;

always@(negedge up or negedge down or negedge right or negedge left)
begin

	if(up == 1'b0)
	begin
	direction=2'b00;//up
	end
	else if(down == 1'b0)
	begin
	direction=2'b01;//down
	end
	else if(left == 1'b0)
	begin
	direction=2'b10;//left
	end
	else if(right == 1'b0)
	begin
	direction=2'b11;//right
	end
	else
	begin
	direction = direction;
	end
end

endmodule
