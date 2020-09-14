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

entity Johnson is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pause : in STD_LOGIC;
           q: out STD_LOGIC_VECTOR(7 downto 0));
end Johnson;

architecture Behavioral of Johnson is


signal count_old, count_new: STD_LOGIC_VECTOR(7 downto 0):= "10011011";

begin

--count_old <= count_new;

process(clk,rst)
    begin
        if(rising_edge(clk)) then
            if (rst = '1') then
                count_new <= count_new;
            else
                if (pause = '1') then
                    count_old <= count_old;
                    count_new <= count_new;
                else
                    count_new <= count_new(6 downto 0) & not(count_new(7));
                end if;
            end if;
        end if;
end process;
--count_new <= count_old(6 downto 0) & not(count_old(7));
q <= count_new;

end Behavioral;