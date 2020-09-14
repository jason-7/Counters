----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/12/2020 10:52:23 PM
-- Design Name: 
-- Module Name: lab1_tb - Behavioral
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

entity lab1_tb is
--  Port ( );
end lab1_tb;

architecture Behavioral of lab1_tb is

-- binary counter
component binary is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC);
end component;

-- frequency divider
component freq_div is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC);
end component;

-- BCD counter
component BCD is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC);
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
           pause : in STD_LOGIC);
end component;

-- Fibonacci divider
component Fibonacci is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC);
end component;

constant cp: time:= 10ns;
signal clk, rst, pause: STD_LOGIC;
signal q: STD_LOGIC_VECTOR(7 downto 0);

begin

binary_counter: binary port map(clk => clk, rst => rst, pause => pause);

frequency_divider: freq_div port map(clk => clk, rst => rst, pause => pause);

BCD_counter: BCD port map(clk => clk, rst => rst, pause => pause);

Ring_counter: Ring port map(clk => clk, rst => rst, pause => pause, q => q);

Johnson_counter: Johnson port map(clk => clk, rst => rst, pause => pause, q => q);

Gray_counter: Gray port map(clk => clk, rst => rst, pause => pause);

Fibonacci_counter: Fibonacci port map(clk => clk, rst => rst, pause => pause);

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

end Behavioral;
