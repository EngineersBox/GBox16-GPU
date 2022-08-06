-- generated by Digital. Don't modify this file!
-- Any changes will be lost if this file is regenerated.

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity DIG_Sub is
  generic ( Bits: integer ); 
  port (
    s: out std_logic_vector((Bits-1) downto 0);
    c_o: out std_logic;
    a: in std_logic_vector((Bits-1) downto 0);
    b: in std_logic_vector((Bits-1) downto 0);
    c_i: in std_logic );
end DIG_Sub;

architecture Behavioral of DIG_Sub is
   signal temp : std_logic_vector(Bits downto 0);
begin
   temp <= ('0' & a) - b - c_i;

   s    <= temp((Bits-1) downto 0);
   c_o  <= temp(Bits);
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity COMP_GATE_UNSIGNED is
  generic ( Bits : integer );
  port (
    gr: out std_logic;
    eq: out std_logic;
    le: out std_logic;
    a: in std_logic_vector ((Bits-1) downto 0);
    b: in std_logic_vector ((Bits-1) downto 0) );
end COMP_GATE_UNSIGNED;

architecture Behavioral of COMP_GATE_UNSIGNED is
begin
  process(a, b)
  begin
    if (a > b ) then
      le <= '0';
      eq <= '0';
      gr <= '1';
    elsif (a < b) then
      le <= '1';
      eq <= '0';
      gr <= '0';
    else
      le <= '0';
      eq <= '1';
      gr <= '0';
    end if;
  end process;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    B: in std_logic_vector(7 downto 0);
    A: in std_logic_vector(7 downto 0);
    Q: out std_logic_vector(7 downto 0);
    D: out std_logic -- 1: A is greater
                     -- 2: B is greater
    );
end main;

architecture Behavioral of main is
  signal Q_temp: std_logic_vector(7 downto 0);
  signal s0: std_logic;
  signal s1: std_logic;
begin
  gate0: entity work.DIG_Sub
    generic map (
      Bits => 8)
    port map (
      a => A,
      b => B,
      c_i => '0',
      s => Q_temp);
  gate1: entity work.COMP_GATE_UNSIGNED
    generic map (
      Bits => 8)
    port map (
      a => Q_temp,
      b => "00000000",
      gr => s0,
      eq => s1);
  D <= (s0 OR s1);
  Q <= Q_temp;
end Behavioral;