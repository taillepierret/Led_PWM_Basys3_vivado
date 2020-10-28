----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.10.2020 20:10:48
-- Design Name: 
-- Module Name: PWM16bits_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM16bits_tb is
--  Port ( );
end PWM16bits_tb;

architecture Behavioral of PWM16bits_tb is
	component PWM16bits
    Port ( clk : in STD_LOGIC;
           pwm_in : in STD_LOGIC_VECTOR (15 downto 0);
           pwm_out : out STD_LOGIC);
    end component;
    signal clk : std_logic;
    signal pwm_in : std_logic_vector(15 downto 0);
    signal pwm_out : std_logic;
begin
	UUT: PWM16bits port map (clk => clk, pwm_in => pwm_in, pwm_out => pwm_out);
	
	
	-- Generation du signal d'horloge a 125MHz
	clk_gen: process
	begin
		clk <= '1'; wait for 4ns;
		clk <= '0'; wait for 4ns;
	end process;
	
	pwm_in_gen: process
	begin
		pwm_in <= conv_std_logic_vector(0, 16); wait for 25200 us;
		pwm_in <= conv_std_logic_vector(8192, 16); wait for 25200 us;
		pwm_in <= conv_std_logic_vector(32768, 16); wait for 25200 us;
		pwm_in <= conv_std_logic_vector(65535, 16); wait for 25200 us;
	end process;
end Behavioral;
