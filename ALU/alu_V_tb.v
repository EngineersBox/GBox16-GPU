//  A testbench for alu_V_tb
`timescale 1us/1ns

module alu_V_tb;
    reg [15:0] A;
    reg [15:0] B;
    reg [1:0] ALUOP;
    wire [15:0] RESULT;
    wire [3:0] FLAG;

  alu alu0 (
    .A(A),
    .B(B),
    .ALUOP(ALUOP),
    .RESULT(RESULT),
    .FLAG(FLAG)
  );

