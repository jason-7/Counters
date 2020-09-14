----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2020 05:40:46 PM
-- Design Name: 
-- Module Name: lab1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab1 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end lab1;

architecture Behavioral of lab1 is

-- binary counter
component binary is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

-- frequency divider
component freq_div is
    Port ( clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           pause : in STD_LOGIC;
           div: out STD_LOGIC);
end component;

-- BCD counter
component BCD is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

-- ring counter
component Ring is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

-- Johnson counter
component Johnson is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

-- Gray divider
component Gray is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

-- Fibonacci divider
component Fibonacci is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal clk_int, rst_int, pause_int, div: STD_LOGIC;
signal q_binary, q_BCD, q_Ring, q_Johnson, q_Gray, q_Fib: STD_LOGIC_VECTOR(7 downto 0);

begin

pause_int <= pause;
rst_int <= rst;

frequency_divider: freq_div port map(clk => clk, rst => rst_int, pause => pause_int, div => clk_int);

binary_counter: binary port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_binary);

BCD_counter: BCD port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_BCD);

Ring_counter: Ring port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_Ring);

Johnson_counter: Johnson port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_Johnson);

Gray_counter: Gray port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_Gray);

Fibonacci_counter: Fibonacci port map(clk => clk_int, rst => rst_int, pause => pause_int, q => q_Fib);

with sel select
    LED <= q_binary when "000",
         q_BCD when "001",
         q_Ring when "010",
         q_Johnson when "011",
         q_Gray when "100",
         q_Fib when "101",
         (others => '0') when others;

end Behavioral;
