----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2020 19:05:13
-- Design Name: 
-- Module Name: PWM16bits - Behavioral
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

entity PWM16bits is
    Port ( clk : in STD_LOGIC;
           pwm_in : in STD_LOGIC_VECTOR (15 downto 0);
           pwm_out : out STD_LOGIC := '1');
end PWM16bits;

architecture Behavioral of PWM16bits is
    signal pwm_counter : integer range 0 to 65535 := 0;
    signal pwm_prescaler : integer range 0 to 15 := 0;
    signal pwm_compare : integer range 0 to 65535 := 0;
begin
    pwm_compare <= to_integer (unsigned(pwm_in));
    
    process(clk, pwm_compare, pwm_prescaler, pwm_counter)
    begin
    	if rising_edge(clk) then
			--implementation du prescaler
			if pwm_prescaler = 15 
			then 
				pwm_prescaler <= 0; 
				if pwm_counter = 65535 then pwm_counter <= 0; else pwm_counter <= pwm_counter + 1; end if;
				if pwm_counter = 0 then pwm_out <= '1'; end if;
				if pwm_counter = pwm_compare then pwm_out <= '0'; end if;
			else 
				pwm_prescaler <= pwm_prescaler + 1; 
			end if;
    	end if;
	end process;
end Behavioral;
