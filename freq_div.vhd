----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

entity freq_div is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is

signal clkhalf: STD_LOGIC;

begin

process(clk,rst)
    begin
        if(rising_edge(clk)) then
            if (rst = '0') then
                clkhalf <= '0';
            else
                if (pause = '1') then
                    clkhalf <= clkhalf;
                else
                    clkhalf <= not(clkhalf);
                end if;
            end if;
        end if;
end process;

end Behavioral;