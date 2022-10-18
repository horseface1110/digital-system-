module try(a  , out , valid);

input[7:0] a ;
output[3:0] out ;
output valid ;

reg [3:0]out ;
reg valid;

always@(a)
begin

	case({a[0] , a[1] , a[2] , a[3] , a[4] , a[5] , a[6] ,a[7] })
		8'b10000000: begin
								out[0] = 1'b0;
								out[1] = 1'b0;
								out[2] = 1'b0;
								valid = 1;
						 end
		8'b01000000: begin
								out[0] = 1'b1 ;
								out[1] = 1'b0 ;
								out[2] = 1'b0 ;
								valid = 1;
						 end
		8'b00100000: begin 
								out[0] = 1'b0 ;
								out[1] = 1'b1 ;
								out[2] = 1'b0 ;
								valid = 1;
						 end
		8'b00010000: begin 
								out[0] = 1'b1 ;
								out[1] = 1'b1 ;
								out[2] = 1'b0 ;
								valid = 1;			
		             end
		8'b00001000: begin 
								out[0] = 1'b0 ;
								out[1] = 1'b0 ;
								out[2] = 1'b1 ;
								valid = 1;
						 end
		8'b00000100: begin 
								out[0] = 1'b1 ;
								out[1] = 1'b0 ;
								out[2] = 1'b1 ;
								valid = 1;
						end
		
 		8'b00000010: begin 
								out[0] = 1'b0 ;
								out[1] = 1'b1 ;
								out[2] = 1'b1 ;
								valid = 1;
						 end
		8'b00000001: begin 
								out[0] = 1'b1 ;
								out[1] = 1'b1 ;
								out[2] = 1'b1 ;
								valid = 1;
						 end
		default: begin 
								{out[0] , out[1] , out[2]} = 3'b000 ;
								valid = 0;
								
					end
	endcase
	
	
end

endmodule		
		
		
		
		
		
//		8'b10000000: out[0] = 1'b0 , out[1] = 1'b0 , out[2] = 1'b0 , valid = 1;
//		8'b01000000: out[0] = 1'b1 , out[1] = 1'b0 , out[2] = 1'b0 , valid = 1;
//		8'b00100000: out[0] = 1'b0 , out[1] = 1'b1 , out[2] = 1'b0 , valid = 1;
//		8'b00010000: out[0] = 1'b1 , out[1] = 1'b1 , out[2] = 1'b0 , valid = 1;
//		8'b00001000: out[0] = 1'b0 , out[1] = 1'b0 , out[2] = 1'b1 , valid = 1;
//		8'b00000100: out[0] = 1'b1 , out[1] = 1'b0 , out[2] = 1'b1 , valid = 1;
//		8'b00000010: out[0] = 1'b0 , out[1] = 1'b1 , out[2] = 1'b1 , valid = 1;
//		8'b00000001: out[0] = 1'b1 , out[1] = 1'b1 , out[2] = 1'b1 , valid = 1;
		
//if(select == 1){
//		overflow = a and b;
//	
//	}
//	else if(select == 0){
//	
//		out = a xor b;
//		overflow = (not a) and b;
//	
//	}
 		

		
//	if(select)
//		{
//			case({a , b})
//				2'b00:
//					begin
//					out = 0 , overflow = 0 ;
//					end
//	//			2'b01:out = 1 , overflow = 0 ;
//	//			2'b10:out = 1 , overflow = 0 ;
//	//			2'b11:out = 0 , overflow = 1 ;
//         endcase
//		}
//	else if(!select )
//		{
//			case({a , b })
//	//			2'b00:out = 0 , overflow = 0;
//	//			2'b01:out = 1 , overflow = 1;
//	//			2'b10:out = 1 , overflow = 0;
//	//			2'b11:out = 0 , overflow = 0;	
//			end
//		}