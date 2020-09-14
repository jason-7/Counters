----------------------------------------------------------------------------------
-- Company: ECE 524/Mirzaei
-- Engineer: Jason Nakhla
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

component lab1 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end component;

constant cp: time:= 10ns;
signal clk, rst, pause: STD_LOGIC;
signal sel: STD_LOGIC_VECTOR (2 downto 0);
signal LED: STD_LOGIC_VECTOR (7 downto 0);

begin

UUT: lab1 port map(clk => clk, rst => rst, pause => pause, sel => sel, LED => LED);
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

-- select line
process
begin
sel <= "000";
wait for 50*cp;
sel <= "001";
wait for 50*cp;
sel <= "010";
wait for 50*cp;
sel <= "011";
wait for 50*cp;
sel <= "100";
wait for 50*cp;
sel <= "101";
wait for 50*cp;
sel <= "111";
wait;
end process;

end Behavioral;