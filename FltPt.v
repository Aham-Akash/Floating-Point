//A 32 bit single precession IEEE 754 Standard addition module
//These 32 bits are devided as

//    |SIGN| EXPONENT | MANTISSA |
//    |1bit|  8bits   |  23bits  |



`default_nettype none

module FltPt(
    input wire  [31:0] i_a,
    input wire  [31:0] i_b,
    output wire [31:0] o_result 
);

wire [7:0] exponent_a = i_a[30:23];
wire [7:0] exponent_b = i_b[30:23];

wire [23:0] mantissa_a = {1'b1, i_a[22:0]}; // Implicit leading 1
wire [23:0] mantissa_b = {1'b1, i_b[22:0]}; // Implicit leading 1

wire s_a = i_a[31]; // Sign of a
wire s_b = i_b[31]; // Sign of b

// Align exponents
wire [7:0] exponent_diff;
wire [23:0] aligned_mantissa_a;
wire [23:0] aligned_mantissa_b;

assign exponent_diff = (exponent_a > exponent_b) ? (exponent_a - exponent_b) : (exponent_b - exponent_a);
assign aligned_mantissa_a = (exponent_a > exponent_b) ? mantissa_a : (mantissa_a >> exponent_diff) ;
assign aligned_mantissa_b = (exponent_b > exponent_a) ? mantissa_b : (mantissa_b >> exponent_diff) ;

// Add or subtract mantissas based on sign
wire [24:0] sum_mantissa;
assign sum_mantissa = (s_a == s_b) ? (aligned_mantissa_a + aligned_mantissa_b) : (aligned_mantissa_a - aligned_mantissa_b);

// Determine final sign
wire result_sign = (sum_mantissa[24] == 1'b1) ? s_a : s_b; // Use sign of larger number

// Handle overflow (normalize)
wire [7:0]  result_exponent;
wire [22:0] result_mantissa;

assign result_exponent = (sum_mantissa[24] == 1'b1) ? ((exponent_a > exponent_b) ? exponent_a + 1 : exponent_b + 1): ((exponent_a > exponent_b) ? exponent_a : exponent_b) ;
assign result_mantissa = sum_mantissa[24] ? sum_mantissa[23:1] : sum_mantissa[22:0]; // Normalize mantissa if overflow

// Assemble final result
assign o_result = {result_sign, result_exponent, result_mantissa};

endmodule

