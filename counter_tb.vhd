----------------------------------------------------------------------------------
-- Company: ECE 524/Mirzaei
-- Engineer: Jason Nakhla
-- 
-- Create Date: 09/13/2020 03:22:11 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

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

constant cp: time:= 10ns;
signal clk, rst, pause,div: STD_LOGIC;
signal q_binary, q_BCD, q_Ring, q_Johnson, q_Gray, q_Fib: STD_LOGIC_VECTOR(7 downto 0);

begin

binary_counter: binary port map(clk => clk, rst => rst, pause => pause, q => q_binary);

frequency_divider: freq_div port map(clk => clk, rst => rst, pause => pause,div => div);

BCD_counter: BCD port map(clk => clk, rst => rst, pause => pause, q => q_BCD);

Ring_counter: Ring port map(clk => clk, rst => rst, pause => pause, q => q_Ring);

Johnson_counter: Johnson port map(clk => clk, rst => rst, pause => pause, q => q_Johnson);

Gray_counter: Gray port map(clk => clk, rst => rst, pause => pause, q => q_Gray);

Fibonacci_counter: Fibonacci port map(clk => clk, rst => rst, pause => pause, q => q_Fib);

--clock
process
begin
clk <= '0';
wait for cp/2;
clk <= '1';
wait for cp/2;
end process;

--rst
process
begin
rst <= '1';
wait for cp;
rst <= '0';
wait;
end process;

--pause
process
begin
pause <= '0';
wait;
end process;

end Behavioral;