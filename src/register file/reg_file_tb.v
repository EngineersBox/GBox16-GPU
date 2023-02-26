//  A testbench for reg_file_tb
`timescale 1us/1ns

module reg_file_tb;
    reg [2:0] RS1;
    reg [2:0] RS2;
    reg [2:0] WS;
    reg WE;
    reg [15:0] IN;
    reg clk;
    wire [15:0] OUT1;
    wire [15:0] OUT2;

  reg_file reg_file0 (
    .RS1(RS1),
    .RS2(RS2),
    .WS(WS),
    .WE(WE),
    .IN(IN),
    .clk(clk),
    .OUT1(OUT1),
    .OUT2(OUT2)
  );

    reg [58:0] patterns[0:47];
    integer i;

    initial begin
      patterns[0] = 59'b0_000_000_000_1_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[1] = 59'b1_000_000_000_1_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[2] = 59'b0_000_000_000_1_0001001000110100_0000000000000000_0000000000000000;
      patterns[3] = 59'b0_001_001_001_1_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[4] = 59'b1_001_001_001_1_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[5] = 59'b0_001_001_001_1_0001001000110100_0001001000110100_0001001000110100;
      patterns[6] = 59'b0_010_001_010_1_1011111011101111_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[7] = 59'b1_010_001_010_1_1011111011101111_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[8] = 59'b0_010_001_010_1_1011111011101111_1011111011101111_0001001000110100;
      patterns[9] = 59'b0_011_010_011_1_1101111010101101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[10] = 59'b1_011_010_011_1_1101111010101101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[11] = 59'b0_011_010_011_1_1101111010101101_1101111010101101_1011111011101111;
      patterns[12] = 59'b0_100_011_100_1_1111111111111111_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[13] = 59'b1_100_011_100_1_1111111111111111_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[14] = 59'b0_100_011_100_1_1111111111111111_1111111111111111_1101111010101101;
      patterns[15] = 59'b0_100_011_100_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[16] = 59'b1_100_011_100_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[17] = 59'b0_100_011_100_0_1010101111001101_1111111111111111_1101111010101101;
      patterns[18] = 59'b0_100_011_011_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[19] = 59'b1_100_011_011_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[20] = 59'b0_100_011_011_0_1010101111001101_1111111111111111_1101111010101101;
      patterns[21] = 59'b0_010_001_010_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[22] = 59'b1_010_001_010_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[23] = 59'b0_010_001_010_0_1010101111001101_1011111011101111_0001001000110100;
      patterns[24] = 59'b0_010_001_001_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[25] = 59'b1_010_001_001_0_1010101111001101_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[26] = 59'b0_010_001_001_0_1010101111001101_1011111011101111_0001001000110100;
      patterns[27] = 59'b0_010_001_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[28] = 59'b1_010_001_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[29] = 59'b0_010_001_011_1_1011101011011110_1011111011101111_0001001000110100;
      patterns[30] = 59'b0_001_011_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[31] = 59'b1_001_011_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[32] = 59'b0_001_011_011_1_1011101011011110_0001001000110100_1011101011011110;
      patterns[33] = 59'b0_001_001_011_0_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[34] = 59'b1_001_001_011_0_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[35] = 59'b0_001_001_011_0_0001001000110100_0001001000110100_0001001000110100;
      patterns[36] = 59'b0_011_100_001_1_0000000000000000_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[37] = 59'b1_011_100_001_1_0000000000000000_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[38] = 59'b0_011_100_001_1_0000000000000000_1011101011011110_1111111111111111;
      patterns[39] = 59'b0_001_001_011_0_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[40] = 59'b1_001_001_011_0_0001001000110100_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[41] = 59'b0_001_001_011_0_0001001000110100_0000000000000000_0000000000000000;
      patterns[42] = 59'b0_011_100_000_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[43] = 59'b1_011_100_000_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[44] = 59'b0_011_100_000_1_1011101011011110_1011101011011110_1111111111111111;
      patterns[45] = 59'b0_000_000_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[46] = 59'b1_000_000_011_1_1011101011011110_xxxxxxxxxxxxxxxx_xxxxxxxxxxxxxxxx;
      patterns[47] = 59'b0_000_000_011_1_1011101011011110_0000000000000000_0000000000000000;

      for (i = 0; i < 48; i = i + 1)
      begin
        clk = patterns[i][58];
        RS1 = patterns[i][57:55];
        RS2 = patterns[i][54:52];
        WS = patterns[i][51:49];
        WE = patterns[i][48];
        IN = patterns[i][47:32];
        #10;
        if (patterns[i][31:16] !== 16'hx)
        begin
          if (OUT1 !== patterns[i][31:16])
          begin
            $display("%d:OUT1: (assertion error). Expected %h, found %h", i, patterns[i][31:16], OUT1);
            $finish;
          end
        end
        if (patterns[i][15:0] !== 16'hx)
        begin
          if (OUT2 !== patterns[i][15:0])
          begin
            $display("%d:OUT2: (assertion error). Expected %h, found %h", i, patterns[i][15:0], OUT2);
            $finish;
          end
        end
      end

      $display("All tests passed.");
    end
    endmodule
