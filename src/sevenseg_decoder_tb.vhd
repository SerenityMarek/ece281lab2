----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2026 03:18:05 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
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

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder
    port( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0)
           );
    end component;
    
    ---inputs
    signal w_btn    : std_logic_vector (3 downto 0):= "0000";
    
    ---outputs
    signal w_segs   : std_logic_vector (6 downto 0) := "1111111";

begin
    uut: sevenseg_decoder port map (
        i_Hex => w_btn,
        o_seg_n => w_segs
        
    );
    
    sim_proc: process
	begin
	
	wait for 10 ns;
	
	---check 0
	w_btn <= "0000"; wait for 10 ns;
	   assert w_segs = "1000000" report "error on 0" severity failure;
	---check 1
	w_btn <= "0001"; wait for 10 ns;
	   assert w_segs = "1111001" report "error on 1" severity failure;
	---check 2
	w_btn <= "0010"; wait for 10 ns;
	   assert w_segs = "0100100" report "error on 2" severity failure;
	---check 3
	w_btn <= "0011"; wait for 10 ns;
	   assert w_segs = "0110000" report "error on 3" severity failure;
	---check 4
	w_btn <= "0100"; wait for 10 ns;
	   assert w_segs = "0011001" report "error on 4" severity failure;
	---check 5
	w_btn <= "0101"; wait for 10 ns;
	   assert w_segs = "0010010" report "error on 5" severity failure;
	---check 6
	w_btn <= "0110"; wait for 10 ns;
	   assert w_segs = "0000010" report "error on 6" severity failure;
	---check 7
	w_btn <= "0111"; wait for 10 ns;
	   assert w_segs = "1111000" report "error on 7" severity failure;
	---check 8
	w_btn <= "1000"; wait for 10 ns;
	   assert w_segs = "0000000" report "error on 8" severity failure;
	---check 9
	w_btn <= "1001"; wait for 10 ns;
	   assert w_segs = "0011000" report "error on 9" severity failure;
	---check A
	w_btn <= "1010"; wait for 10 ns;
	   assert w_segs = "0001000" report "error on A" severity failure;
	---check B
	w_btn <= "1011"; wait for 10 ns;
	   assert w_segs = "0000011" report "error on B" severity failure;
	---check C
	w_btn <= "1100"; wait for 10 ns;
	   assert w_segs = "0100111" report "error on C" severity failure;
	---check D
	w_btn <= "1101"; wait for 10 ns;
	   assert w_segs = "0100001" report "error on D" severity failure;
	---check E
	w_btn <= "1110"; wait for 10 ns;
	   assert w_segs = "0110000" report "error on E" severity failure;
	---check F
	w_btn <= "1111"; wait for 10 ns;
	   assert w_segs = "0001110" report "error on F" severity failure;
	
	   wait;
	end process;


end Behavioral;
