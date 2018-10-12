//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register32zero.v"
`include "mux32to1by32.v"
`include "register32.v"
`include "decoder1to32.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]		WriteData,	// Contents to write to register
input[4:0]		ReadRegister1,	// Address of first register to read
input[4:0]		ReadRegister2,	// Address of second register to read
input[4:0]		WriteRegister,	// Address of register to write
input			RegWrite,	// Enable writing of register when High
input			Clk		// Clock (Positive Edge Triggered)
);

	wire[31:0] decode;
	wire[31:0] regis[31:0];

	decoder1to32 decoder(decode, RegWrite, WriteRegister);

	register32zero regiszero(regis[0], WriteData, decode[0], Clk);	// first bit should be 0

	genvar i;
	generate
	for (i = 1; i<31; i = i + 1)
		begin:genblock
			register32 register(regis[i], WriteData, decode[i], Clk);
		end
	endgenerate

	mux32to1by32 mux0(ReadData1, ReadRegister1, regis[0], regis[1], regis[2], regis[3], regis[4], regis[5], regis[6], regis[7], regis[8], regis[9], regis[10], regis[11], regis[12], regis[13], regis[14], regis[15], regis[16], regis[17], regis[18], regis[19], regis[20], regis[21], regis[22], regis[23], regis[24], regis[25], regis[26], regis[27], regis[28], regis[29], regis[30], regis[31]);
	mux32to1by32 mux1(ReadData2, ReadRegister2, regis[0], regis[1], regis[2], regis[3], regis[4], regis[5], regis[6], regis[7], regis[8], regis[9], regis[10], regis[11], regis[12], regis[13], regis[14], regis[15], regis[16], regis[17], regis[18], regis[19], regis[20], regis[21], regis[22], regis[23], regis[24], regis[25], regis[26], regis[27], regis[28], regis[29], regis[30], regis[31]);

endmodule