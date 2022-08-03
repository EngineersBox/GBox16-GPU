/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module CompSigned #(
    parameter Bits = 1
)
(
    input [(Bits -1):0] a,
    input [(Bits -1):0] b,
    output \> ,
    output \= ,
    output \<
);
    assign \> = $signed(a) > $signed(b);
    assign \= = $signed(a) == $signed(b);
    assign \< = $signed(a) < $signed(b);
endmodule


module Mux_2x1_NBits #(
    parameter Bits = 2
)
(
    input [0:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    output reg [(Bits - 1):0] out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule

module DIG_Add
#(
    parameter Bits = 1
)
(
    input [(Bits-1):0] a,
    input [(Bits-1):0] b,
    input c_i,
    output [(Bits - 1):0] s,
    output c_o
);
   wire [Bits:0] temp;

   assign temp = a + b + c_i;
   assign s = temp [(Bits-1):0];
   assign c_o = temp[Bits];
endmodule



module ripple_carry_adder_overflow (
  input [15:0] A,
  input [15:0] B,
  input C_in,
  output [15:0] Q,
  output C_out,
  output V
);
  wire [14:0] s0;
  wire [14:0] s1;
  wire [14:0] s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire C_out_temp;
  assign s0 = A[14:0];
  assign s4 = A[15];
  assign s1 = B[14:0];
  assign s5 = B[15];
  DIG_Add #(
    .Bits(15)
  )
  DIG_Add_i0 (
    .a( s0 ),
    .b( s1 ),
    .c_i( C_in ),
    .s( s2 ),
    .c_o( s3 )
  );
  DIG_Add #(
    .Bits(1)
  )
  DIG_Add_i1 (
    .a( s4 ),
    .b( s5 ),
    .c_i( s3 ),
    .s( s6 ),
    .c_o( C_out_temp )
  );
  assign Q[14:0] = s2;
  assign Q[15] = s6;
  assign V = (C_out_temp ^ s3);
  assign C_out = C_out_temp;
endmodule

module Mux_4x1_NBits #(
    parameter Bits = 2
)
(
    input [1:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    input [(Bits - 1):0] in_2,
    input [(Bits - 1):0] in_3,
    output reg [(Bits - 1):0] out
);
    always @ (*) begin
        case (sel)
            2'h0: out = in_0;
            2'h1: out = in_1;
            2'h2: out = in_2;
            2'h3: out = in_3;
            default:
                out = 'h0;
        endcase
    end
endmodule


module Mux_2x1
(
    input [0:0] sel,
    input in_0,
    input in_1,
    output reg out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule


module alu (
  input [15:0] A, // First input to ALU
  input [15:0] B, // Second input to ALU
  input [1:0] ALUOP, // Operation selection input
  output [15:0] RESULT, // The result of this ALU operation
  output [3:0] FLAG // The flags associated with the result of this ALU operation
                    // 
                    // 0. Z (zero)
                    // 1. N (negative)
                    // 2. C (carry)
                    // 3. V (overflow)

);
  wire [15:0] RESULT_temp;
  wire [15:0] s0;
  wire s1;
  wire [15:0] s2;
  wire [15:0] s3;
  wire [15:0] s4;
  wire [15:0] s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire C_out;
  wire V;
  assign s0 = ~ B;
  CompSigned #(
    .Bits(2)
  )
  CompSigned_i0 (
    .a( 2'b1 ),
    .b( ALUOP ),
    .\= ( s1 )
  );
  assign s10 = ALUOP[1];
  Mux_2x1_NBits #(
    .Bits(16)
  )
  Mux_2x1_NBits_i1 (
    .sel( s1 ),
    .in_0( B ),
    .in_1( s0 ),
    .out( s2 )
  );
  assign s3 = (A | s2);
  assign s5 = (A & s2);
  ripple_carry_adder_overflow ripple_carry_adder_overflow_i2 (
    .A( A ),
    .B( s2 ),
    .C_in( s1 ),
    .Q( s4 ),
    .C_out( C_out ),
    .V( V )
  );
  Mux_4x1_NBits #(
    .Bits(16)
  )
  Mux_4x1_NBits_i3 (
    .sel( ALUOP ),
    .in_0( s4 ),
    .in_1( s4 ),
    .in_2( s5 ),
    .in_3( s3 ),
    .out( RESULT_temp )
  );
  Mux_2x1 Mux_2x1_i4 (
    .sel( s10 ),
    .in_0( C_out ),
    .in_1( 1'b0 ),
    .out( s8 )
  );
  Mux_2x1 Mux_2x1_i5 (
    .sel( s10 ),
    .in_0( V ),
    .in_1( 1'b0 ),
    .out( s9 )
  );
  CompSigned #(
    .Bits(16)
  )
  CompSigned_i6 (
    .a( RESULT_temp ),
    .b( 16'b0 ),
    .\= ( s6 ),
    .\< ( s7 )
  );
  assign FLAG[0] = s6;
  assign FLAG[1] = s7;
  assign FLAG[2] = s8;
  assign FLAG[3] = s9;
  assign RESULT = RESULT_temp;
endmodule
