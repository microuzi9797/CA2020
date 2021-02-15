module fpu #(
	parameter DATA_WIDTH = 32,
	parameter INST_WIDTH = 1
)(
	input                   i_clk,
	input                   i_rst_n,
	input  [DATA_WIDTH-1:0] i_data_a,
	input  [DATA_WIDTH-1:0] i_data_b,
	input  [INST_WIDTH-1:0] i_inst,
	input                   i_valid,
	output [DATA_WIDTH-1:0] o_data,
	output                  o_valid
);

	// homework
	// wire and register
	reg [DATA_WIDTH - 1:0] o_data_r, o_data_w;
	reg o_overflow_w;
	reg o_valid_r, o_valid_w;
	reg [7:0] exponent_a_w, exponent_b_w;
	reg [7:0] o_exponent_w;
	reg [23:0] fraction_a_w, fraction_b_w;
	reg [23:0] o_fraction_w;
	reg [46:0] o_mul_temp;
	reg o_sign_w;
	wire int;
	reg R, S;
	integer i;
	// assignment
	assign o_data = o_data_r;
	assign o_valid = o_valid_r;
	assign int = 1;
	// combinational circuit
	always @(*) begin
		if (i_valid) begin
			exponent_a_w = i_data_a[30:23];
			exponent_b_w = i_data_b[30:23];
			fraction_a_w = {int, i_data_a[22:0]};
			fraction_b_w = {int, i_data_b[22:0]};
			case (i_inst)
				// add
				1'd0: begin
					// shift number with smaller exponent right
					if (exponent_a_w > exponent_b_w) begin
						S = 0;
						for (i = 0; i < exponent_a_w - exponent_b_w - 1; i = i + 1) begin
							if (fraction_b_w[i] == 1) begin
								S = 1;
							end
						end
						R = fraction_b_w[i];
						fraction_b_w = fraction_b_w >> (exponent_a_w - exponent_b_w);
						exponent_b_w = exponent_a_w;
						o_exponent_w = exponent_a_w;
					end
					else if (exponent_a_w < exponent_b_w) begin
						S = 0;
						for (i = 0; i < exponent_b_w - exponent_a_w - 1; i = i + 1) begin
							if (fraction_a_w[i] == 1) begin
								S = 1;
							end
						end
						R = fraction_a_w[i];
						fraction_a_w = fraction_a_w >> (exponent_b_w - exponent_a_w);
						exponent_a_w = exponent_b_w;
						o_exponent_w = exponent_b_w;
					end
					else begin
						R = 0;
						S = 0;
						o_exponent_w = exponent_b_w;
					end
					// add or sub
					if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
						{o_overflow_w, o_fraction_w} = fraction_a_w + fraction_b_w;
						o_sign_w = 0;
					end
					else if (i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1]) begin
						{o_overflow_w, o_fraction_w} = fraction_a_w + fraction_b_w;
						o_sign_w = 1;
					end
					else if (~i_data_a[DATA_WIDTH - 1] && i_data_b[DATA_WIDTH - 1]) begin
						if (fraction_a_w > fraction_b_w) begin
							{o_overflow_w, o_fraction_w} = fraction_a_w - fraction_b_w;
							o_sign_w = 0;
						end
						else begin
							{o_overflow_w, o_fraction_w} = fraction_b_w - fraction_a_w;
							o_sign_w = 1;
						end
					end
					else begin
						if (fraction_a_w < fraction_b_w) begin
							{o_overflow_w, o_fraction_w} = fraction_b_w - fraction_a_w;
							o_sign_w = 0;
						end
						else begin
							{o_overflow_w, o_fraction_w} = fraction_a_w - fraction_b_w;
							o_sign_w = 1;
						end
					end
					// normalize
					if (o_overflow_w) begin
						o_exponent_w = o_exponent_w + 8'b1;
						if (R || S) begin
							S = 1;
						end
						R = o_fraction_w[0];
						o_fraction_w = o_fraction_w >> 1;
					end
					// rounding to the nearest even
					if (R == 0 && S == 0) begin
						{o_overflow_w, o_fraction_w} = o_fraction_w;
					end
					else if (R == 0 && S == 1) begin
						{o_overflow_w, o_fraction_w} = o_fraction_w;
					end
					else if (R == 1 && S == 1) begin
						if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
							{o_overflow_w, o_fraction_w} = o_fraction_w + 24'b1;
						end
						else begin
							{o_overflow_w, o_fraction_w} = o_fraction_w - 24'b1;
						end
					end
					else if (R == 1 && S == 0) begin
						if (o_fraction_w[0]) begin
							if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
								{o_overflow_w, o_fraction_w} = o_fraction_w + 24'b1;
							end
							else begin
								{o_overflow_w, o_fraction_w} = o_fraction_w - 24'b1;
							end
						end
						else begin
							{o_overflow_w, o_fraction_w} = o_fraction_w;
						end
					end
					// re-normalize
					if (o_overflow_w) begin
						o_exponent_w = o_exponent_w + 8'b1;
						o_fraction_w = o_fraction_w >> 1;
					end
					// combine
					o_data_w = {o_sign_w, o_exponent_w, o_fraction_w[22:0]};
					o_valid_w = 1;
				end
				// mul
				1'd1: begin
					// add exponents
					o_exponent_w = exponent_a_w + exponent_b_w - 8'd127;
					// mul
					{o_overflow_w, o_mul_temp} = fraction_a_w * fraction_b_w;
					S = 0;
					for (i = 0; i < 22; i = i + 1) begin
						if (o_mul_temp[i] == 1) begin
							S = 1;
						end
					end
					R = o_mul_temp[22];
					o_fraction_w = o_mul_temp[46:23];
					// sign
					if (i_data_a[DATA_WIDTH - 1] == i_data_b[DATA_WIDTH - 1]) begin
						o_sign_w = 0;
					end
					else begin
						o_sign_w = 1;
					end
					// normalize
					if (o_overflow_w) begin
						o_exponent_w = o_exponent_w + 8'b1;
						if (R || S) begin
							S = 1;
						end
						R = o_fraction_w[0];
						o_fraction_w = o_fraction_w >> 1;
					end
					// rounding to the nearest even
					if (R == 0 && S == 0) begin
						{o_overflow_w, o_fraction_w} = o_fraction_w;
					end
					else if (R == 0 && S == 1) begin
						{o_overflow_w, o_fraction_w} = o_fraction_w;
					end
					else if (R == 1 && S == 1) begin
						if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
							{o_overflow_w, o_fraction_w} = o_fraction_w + 24'b1;
						end
						else begin
							{o_overflow_w, o_fraction_w} = o_fraction_w - 24'b1;
						end
					end
					else if (R == 1 && S == 0) begin
						if (o_fraction_w[0]) begin
							if (~i_data_a[DATA_WIDTH - 1] && ~i_data_b[DATA_WIDTH - 1]) begin
								{o_overflow_w, o_fraction_w} = o_fraction_w + 24'b1;
							end
							else begin
								{o_overflow_w, o_fraction_w} = o_fraction_w - 24'b1;
							end
						end
						else begin
							{o_overflow_w, o_fraction_w} = o_fraction_w;
						end
					end
					// re-normalize
					if (o_overflow_w) begin
						o_exponent_w = o_exponent_w + 8'b1;
						o_fraction_w = o_fraction_w >> 1;
					end
					// combine
					o_data_w = {o_sign_w, o_exponent_w, o_fraction_w[22:0]};
					o_valid_w = 1;
				end
				// default
				default: begin
					o_data_w = 0;
					o_valid_w = 1;
				end
			endcase
		end
		else begin
			o_data_w = 0;
			o_valid_w = 0;
		end
	end
	// sequential circuit
	always @(posedge i_clk or negedge i_rst_n) begin
		if (~i_rst_n) begin
			o_data_r <= 0;
			o_valid_r <= 0;
		end
		else begin
			o_data_r <= o_data_w;
			o_valid_r <= o_valid_w;
		end
	end

endmodule