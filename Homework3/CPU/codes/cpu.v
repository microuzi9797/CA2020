module cpu #( // Do not modify interface
	parameter ADDR_W = 64,
	parameter INST_W = 32,
	parameter DATA_W = 64
)(
	input                   i_clk,
	input                   i_rst_n,
	input                   i_i_valid_inst, // from instruction memory
	input  [ INST_W-1 : 0 ] i_i_inst,       // from instruction memory
	input                   i_d_valid_data, // from data memory
	input  [ DATA_W-1 : 0 ] i_d_data,       // from data memory
	output                  o_i_valid_addr, // to instruction memory
	output [ ADDR_W-1 : 0 ] o_i_addr,       // to instruction memory
	output [ DATA_W-1 : 0 ] o_d_data,       // to data memory
	output [ ADDR_W-1 : 0 ] o_d_addr,       // to data memory
	output                  o_d_MemRead,    // to data memory
	output                  o_d_MemWrite,   // to data memory
	output                  o_finish
);

	// homework
	// wire and register
	reg o_i_valid_addr_r, o_i_valid_addr_w;
	reg [ADDR_W - 1:0] o_i_addr_r, o_i_addr_w;
	reg [DATA_W - 1:0] o_d_data_r, o_d_data_w;
	reg [ADDR_W - 1:0] o_d_addr_r, o_d_addr_w;
	reg o_d_MemRead_r, o_d_MemRead_w;
	reg o_d_MemWrite_r, o_d_MemWrite_w;
	reg o_finish_r, o_finish_w;
	reg [3:0] cs, ns;
	reg [12:0] pc;
	reg [DATA_W - 1:0] x_r[0:31];
	reg [DATA_W - 1:0] x_w[0:31];
	integer i;
	reg [4:0] rd_index;
	reg [12:0] pc_offset;
	// assignment
	assign o_i_valid_addr = o_i_valid_addr_r;
	assign o_i_addr = o_i_addr_r;
	assign o_d_data = o_d_data_r;
	assign o_d_addr = o_d_addr_r;
	assign o_d_MemRead = o_d_MemRead_r;
	assign o_d_MemWrite = o_d_MemWrite_r;
	assign o_finish = o_finish_r;
	// stage
	always @(*) begin
		case (cs)
			0: ns = 1;
			1: ns = 2;
			2: ns = 3;
			3: ns = 4;
			4: ns = 5;
			5: ns = 6;
			6: ns = 7;
			7: ns = 8;
			8: ns = 9;
			9: ns = 10;
			10: ns = 11;
			11: ns = 12;
			12: ns = 13;
			13: ns = 14;
			14: ns = 15;
			15: ns = 0;
		endcase
	end
	// combinational circuit
	always @(*) begin
		// start
		if (cs == 0) begin
			o_i_valid_addr_w = 1;
			o_i_addr_w = pc;
			o_d_MemRead_w = 0;
			o_d_MemWrite_w = 0;
			o_finish_w = 0;
		end
		// deal with instruction
		else if (i_i_valid_inst) begin
			// eof
			if (i_i_inst == 32'b11111111111111111111111111111111) begin
				o_finish_w = 1;
			end
			// store
			else if (i_i_inst[6:0] == 7'b0100011 && i_i_inst[14:12] == 3'b011) begin
				o_d_MemWrite_w = 1;
				o_d_addr_w = x_w[i_i_inst[19:15]] + {i_i_inst[31:25], i_i_inst[11:7]};
				o_d_data_w = x_w[i_i_inst[24:20]];
			end
			// addi
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] + i_i_inst[31:20];
			end
			// load
			else if (i_i_inst[6:0] == 7'b0000011 && i_i_inst[14:12] == 3'b011) begin
				rd_index = i_i_inst[11:7];
				o_d_MemRead_w = 1;
				o_d_addr_w = x_w[i_i_inst[19:15]] + i_i_inst[31:20];
			end
			// add
			else if (i_i_inst[6:0] == 7'b0110011 && i_i_inst[14:12] == 3'b000 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] + x_w[i_i_inst[24:20]];
			end
			// sub
			else if (i_i_inst[6:0] == 7'b0110011 && i_i_inst[14:12] == 3'b000 && i_i_inst[31:25] == 7'b0100000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] - x_w[i_i_inst[24:20]];
			end
			// and
			else if (i_i_inst[6:0] == 7'b0110011 && i_i_inst[14:12] == 3'b111 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] & x_w[i_i_inst[24:20]];
			end
			// or
			else if (i_i_inst[6:0] == 7'b0110011 && i_i_inst[14:12] == 3'b110 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] | x_w[i_i_inst[24:20]];
			end
			// xor
			else if (i_i_inst[6:0] == 7'b0110011 && i_i_inst[14:12] == 3'b100 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = (x_w[i_i_inst[19:15]] & ~x_w[i_i_inst[24:20]]) | (~x_w[i_i_inst[19:15]] & x_w[i_i_inst[24:20]]);
			end
			// andi
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b111) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] & i_i_inst[31:20];
			end
			// ori
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b110) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] | i_i_inst[31:20];
			end
			// xori
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b100) begin
				x_w[i_i_inst[11:7]] = (x_w[i_i_inst[19:15]] & ~i_i_inst[31:20]) | (~x_w[i_i_inst[19:15]] & i_i_inst[31:20]);
			end
			// slli
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b001 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] << i_i_inst[24:20];
			end
			// srli
			else if (i_i_inst[6:0] == 7'b0010011 && i_i_inst[14:12] == 3'b101 && i_i_inst[31:25] == 7'b0000000) begin
				x_w[i_i_inst[11:7]] = x_w[i_i_inst[19:15]] >> i_i_inst[24:20];
			end
			// bne
			else if (i_i_inst[6:0] == 7'b1100011 && i_i_inst[14:12] == 3'b001) begin
				if (x_w[i_i_inst[19:15]] != x_w[i_i_inst[24:20]]) begin
					pc_offset = {i_i_inst[31], i_i_inst[7], i_i_inst[30:25], i_i_inst[11:8], 1'b0};
				end
			end
			// beq
			else if (i_i_inst[6:0] == 7'b1100011 && i_i_inst[14:12] == 3'b000) begin
				if (x_w[i_i_inst[19:15]] == x_w[i_i_inst[24:20]]) begin
					pc_offset = {i_i_inst[31], i_i_inst[7], i_i_inst[30:25], i_i_inst[11:8], 1'b0};
				end
			end
		end
		// deal with pc
		else if (cs == 15) begin
			o_i_valid_addr_w = 0;
			pc = pc + $signed(pc_offset);
			if (pc_offset != 12'd4) begin
				pc_offset = 12'd4;
			end
			o_d_MemRead_w = 0;
			o_d_MemWrite_w = 0;
		end
		else begin
			o_i_valid_addr_w = 0;
			o_d_MemRead_w = 0;
			o_d_MemWrite_w = 0;
		end
		// receive loaded data
		if (i_d_valid_data) begin
			x_w[rd_index] = i_d_data;
		end
	end
	// sequential circuit
	always @(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			o_i_valid_addr_r <= 0;
			o_i_addr_r <= 0;
			o_d_data_r <= 0;
			o_d_addr_r <= 0;
			o_d_MemRead_r <= 0;
			o_d_MemWrite_r <= 0;
			o_finish_r <= 0;
			cs <= 0;
			pc <= 0;
			for (i = 0; i < 32; i = i + 1) begin
				x_r[i] <= 0;
				x_w[i] <= 0;
			end
			pc_offset <= 12'd4;
		end
		else begin
			o_i_valid_addr_r <= o_i_valid_addr_w;
			o_i_addr_r <= o_i_addr_w;
			o_d_data_r <= o_d_data_w;
			o_d_addr_r <= o_d_addr_w;
			o_d_MemRead_r <= o_d_MemRead_w;
			o_d_MemWrite_r <= o_d_MemWrite_w;
			o_finish_r <= o_finish_w;
			cs <= ns;
			for (i = 0; i < 32; i = i + 1) begin
				x_r[i] <= x_w[i];
			end
		end
	end

endmodule
