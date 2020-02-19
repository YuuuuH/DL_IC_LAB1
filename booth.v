`timescale 1ns / 10ps
module booth(out, in1, in2);

parameter width = 6;

input  	[width-1:0]   in1; //multiplicand
input  	[width-1:0]   in2; //multiplier
output reg   [2*width-1:0] out; //product
reg [2*width:0] out2;
reg [width-1:0] complement;
reg [width-1:0] multiplicand;
reg [width-1:0] multiplier; 
integer count;
/*write your code here*/
always @ (in1,in2)
begin
	count = width;
	multiplicand[width-1:0] = in1;
	multiplier[width-1:0] = in2;
	out2[2*width:0]=13'b0000000000000;
	out2[width:1]=in2;
	while(count>0)begin
	 	if(out2[1:0]==2'b00||out2[1:0]==2'b11)begin
			out2 = {1'b0, out2[2*width:1]};
			count = count-1;	
			end
		else if(out2[1:0]==2'b01)begin
			out2[2*width:width+1]=out2[2*width:width+1]+multiplicand;
			count =count -1 ;
			out2 = {1'b0, out2[2*width:1]};

		/*	if(out[2*width]==1'b0)begin
				out2 = {1'b0, out2[2*width:1]};
				count = count-1;
				end
			else begin
				out2 = {1'b1, out2[2*width:1]};
				count = count-1;
				end */ 
			end
		else if(out2[1:0]==2'b10)begin
			complement = ~multiplicand[width-1:0]+1;
			out2[2*width:width+1]= out2[2*width:width+1]+complement;
			out2 = {1'b0, out2[2*width:1]};
			count = count-1;
			end
		out2[2*width] = out2[2*width-1];
		end
		
	out[2*width-1:0]=out2[2*width:1];

end
endmodule
