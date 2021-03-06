----------------------------------------------------------------------------------
-- Company: ECE 524/Mirzaei
-- Engineer: Jason Nakhla 
-- 
-- Create Date: 09/12/2020 07:13:48 PM
-- Design Name: 
-- Module Name: Johnson - Behavioral
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

entity Gray is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end Gray;

architecture Behavioral of Gray is

signal gray_count,next_binary: unsigned(7 downto 0):= (others => '0');
signal cur_binary: unsigned(7 downto 0):= (others => '0');--"10011011";

begin

process(clk,rst)
begin
   if (rising_edge(clk)) then
      if (rst = '1') then
         cur_binary <= (others => '0');
         gray_count <= (others => '0');
      else
        if (pause = '1') then
--            cur_binary <= cur_binary;
            next_binary <= next_binary;
            gray_count <= gray_count;
        else
            next_binary <= next_binary + 1;
--            cur_binary <= next_binary;
            gray_count <= (('0' & next_binary(7 downto 1)) XOR next_binary);
        end if;
      end if;
   end if;
end process;

q <= STD_LOGIC_VECTOR(gray_count);

end Behavioral;