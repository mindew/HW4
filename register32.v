// generates a register with width of 32
// D-FlipFlop with write enable with clock cycle


module register32
#(parameter width = 32)
(

// started with given code	
output reg[width-1:0]  q,				
input [width-1:0]      d,
input       	wrenable,
input       		 clk
);

	genvar i;
	generate
	
	for (i = 0; i<width; i = i + 1)
	begin:genblock
		always @(posedge clk) begin
        	if(wrenable) begin
            	q[i] <= d[i];
        	end
    	end
    end 
   endgenerate
endmodule