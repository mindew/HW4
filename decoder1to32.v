module decoder1to32
(
output[31:0] out,
input		 enable,
input[4:0]	 address
);

	assign out = enable<<address;
endmodule

// This decoder shifts the enable input left to 4 bits. 