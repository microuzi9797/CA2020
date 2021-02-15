module alu #(
	parameter DATA_WIDTH = 32,
	parameter INST_WIDTH = 4
)(
	input                   i_clk,
	input                   i_rst_n,
	input  [DATA_WIDTH-1:0] i_data_a,
	input  [DATA_WIDTH-1:0] i_data_b,
	input  [INST_WIDTH-1:0] i_inst,
	input                   i_valid,
	output [DATA_WIDTH-1:0] o_data,
	output                  o_overflow,
	output                  o_valid
);

	// homework
	// wire and register
	reg [DATA_WIDTH - 1:0] o_data_r, o_data_w;
	reg o_overflow_r, o_overflow_w;
	reg o_valid_r, o_valid_w;
	reg [2 * DATA_WIDTH - 1:0] o_mul_temp;
	integer i;
	// assignment
	assign o_data = o_data_r;
	assign o_overflow = o_overflow_r;
	assign o_valid = o_valid_r;
	// combinational circuit
	always @(*) begin
		if (i_valid) begin
			case (i_inst)
				// signed add
				4'd0: begin
					o_data_w = i_data_a + i_data_b;
					if (i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1] && ~o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1] && o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else begin
						o_overflow_w = 0;
					end
					o_valid_w = 1;
				end
				// signed sub
				4'd1: begin
					o_data_w = i_data_a - i_data_b;
					if (~i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1] && o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else if (i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1] && ~o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else begin
						o_overflow_w = 0;
					end
					o_valid_w = 1;
				end
				// signed mul
				4'd2: begin
					o_data_w = i_data_a * i_data_b;
					if ((i_data_a[DATA_WIDTH - 1] == i_data_b[DATA_WIDTH - 1]) && o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else if ((i_data_a[DATA_WIDTH - 1] != i_data_b[DATA_WIDTH - 1]) && ~o_data_w[DATA_WIDTH - 1]) begin
						o_overflow_w = 1;
					end
					else begin
						o_overflow_w = 0;
					end
					o_valid_w = 1;
				end
				// signed max
				4'd3: begin
					if (~i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1]) begin
						o_data_w = i_data_a;
					end
					else if (i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
						o_data_w = i_data_b;
					end
					else if (i_data_a > i_data_b) begin
						o_data_w = i_data_a;
					end
					else begin
						o_data_w = i_data_b;
					end
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// signed min
				4'd4: begin
					if (~i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1]) begin
						o_data_w = i_data_b;
					end
					else if (i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
						o_data_w = i_data_a;
					end
					else if (i_data_a < i_data_b) begin
						o_data_w = i_data_a;
					end
					else begin
						o_data_w = i_data_b;
					end
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// unsugned add
				4'd5: begin
					{o_overflow_w, o_data_w} = i_data_a + i_data_b;
					o_valid_w = 1;
				end
				// unsigned sub
				4'd6: begin
					o_data_w = i_data_a - i_data_b;
					if (i_data_a < i_data_b) begin
						o_overflow_w = 1;
					end
					else begin
						o_overflow_w = 0;
					end
					o_valid_w = 1;
				end
				// unsigned mul
				4'd7: begin
					o_mul_temp = i_data_a * i_data_b;
					o_overflow_w = 0;
					for (i = DATA_WIDTH; i < 2 * DATA_WIDTH; i = i + 1) begin
						if (o_mul_temp[i]) begin
							o_overflow_w = 1;
						end
					end
					o_data_w = o_mul_temp[DATA_WIDTH - 1:0];
					o_valid_w = 1;
				end
				// unsigned max
				4'd8: begin
					if (i_data_a > i_data_b) begin
						o_data_w = i_data_a;
					end
					else begin
						o_data_w = i_data_b;
					end
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// unsigned min
				4'd9: begin
					if (i_data_a < i_data_b) begin
						o_data_w = i_data_a;
					end
					else begin
						o_data_w = i_data_b;
					end
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// and
				4'd10: begin
					o_data_w = i_data_a & i_data_b;
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// or
				4'd11: begin
					o_data_w = i_data_a | i_data_b;
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// xor
				4'd12: begin
					o_data_w = (i_data_a & ~i_data_b) | (~i_data_a & i_data_b);
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// bitflip
				4'd13: begin
					o_data_w = ~i_data_a;
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// bitreverse
				4'd14: begin
					for (i = 0; i < DATA_WIDTH; i = i + 1) begin
						o_data_w[i] = i_data_a[DATA_WIDTH - 1 - i];
					end
					o_overflow_w = 0;
					o_valid_w = 1;
				end
				// default
				default: begin
					o_overflow_w = 0;
					o_data_w = 0;
					o_valid_w = 1;
				end
			endcase
		end
		else begin
			o_overflow_w = 0;
			o_data_w = 0;
			o_valid_w = 0;
		end
	end
	// sequential circuit
	always @(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			o_data_r <= 0;
			o_overflow_r <= 0;
			o_valid_r <= 0;
		end
		else begin
			o_data_r <= o_data_w;
			o_overflow_r <= o_overflow_w;
			o_valid_r <= o_valid_w;
		end
	end

endmodule