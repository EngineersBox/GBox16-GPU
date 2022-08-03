--  A testbench for alu_Z_tb
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity alu_Z_tb is
end alu_Z_tb;

architecture behav of alu_Z_tb is
  component main
    port (
      A: in std_logic_vector(15 downto 0); -- First input to ALU
      B: in std_logic_vector(15 downto 0); -- Second input to ALU
      ALUOP: in std_logic_vector(1 downto 0); -- Operation selection input
      RESULT: out std_logic_vector(15 downto 0); -- The result of this ALU operation
      FLAG: out std_logic_vector(3 downto 0) -- The flags associated with the result of this ALU operation
                                             -- 
                                             -- 0. Z (zero)
                                             -- 1. N (negative)
                                             -- 2. C (carry)
                                             -- 3. V (overflow)
      );
  end component;

  signal A : std_logic_vector(15 downto 0);
  signal B : std_logic_vector(15 downto 0);
  signal ALUOP : std_logic_vector(1 downto 0);
  signal RESULT : std_logic_vector(15 downto 0);
  signal FLAG : std_logic_vector(3 downto 0);
  function to_string ( a: std_logic_vector) return string is
      variable b : string (1 to a'length) := (others => NUL);
      variable stri : integer := 1; 
  begin
      for i in a'range loop
          b(stri) := std_logic'image(a((i)))(2);
      stri := stri+1;
      end loop;
      return b;
  end function;
begin
  main_0 : main port map (
    A => A,
    B => B,
    ALUOP => ALUOP,
    RESULT => RESULT,
    FLAG => FLAG );
  process
    type pattern_type is record
      ALUOP : std_logic_vector(1 downto 0);
      A : std_logic_vector(15 downto 0);
      B : std_logic_vector(15 downto 0);
