module snake(w,a,s,d,out1,out2,row,col,clk,rst);

//最外圈永遠亮，實際控制範圍為(1,1)~(6,6)

input w,a,s,d,clk,rst;
output [7:0]row,col;//snake
output [6:0]out1,out2;//length of snake
wire [1:0]dirc;//use 0~3 to represent wasd

wire [5:0]len;
wire div10000,div12500000;
wire [7:0] rand0,rand1;

//two div_clk
div10000 v0(
	.clk(clk),//I
	.rst(rst),//I
	.div_clk(div10000)//O
);
div12500000 v1(
	.clk(clk),//I
	.rst(rst),//I
	.div_clk(div12500000)//O
);

//generate two rand number
rand_number v2(
	.clk(div12500000),//I
	.rst(rst),//I
	.rand0(rand0),//O
	.rand1(rand1)//O
);

//control direction
changeDirec u0(
	.up(w),//I
	.left(a),//I
	.down(s),//I
	.right(d),//I
	.direction(dirc),//O
);

//control snake and output
move u1(
	.clk10000(div10000),//I
	.clk12500000(div12500000),//I
	.direction(dirc),//I
	.rst(rst),//I
	.rand0(rand0),//I
	.rand1(rand1),//I
	.len(len),//O
	.dot_row(row),//O
	.dot_col(col)//O
);

//output length of snake
seven d0(
	.len(len),//I
	.out1(out1),//O
	.out2(out2),//O
	.clk(div12500000),//I
);


endmodule

