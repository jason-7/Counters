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

entity Ring is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end Ring;

architecture Behavioral of Ring is

signal count: STD_LOGIC_VECTOR(7 downto 0):= "10011011";

begin

process(clk,rst)
    begin
        if(rising_edge(clk)) then
            if (rst = '1') then
                count <= count;
            else
                if (pause = '1') then
                    count <= count;
                else
                    for i in 0 to 6 loop
                        count(i+1) <= count(i);
                    end loop;
                        count(0) <= count(7);
                end if;
            end if;
        end if;
end process;
q <= count;

end Behavioral;