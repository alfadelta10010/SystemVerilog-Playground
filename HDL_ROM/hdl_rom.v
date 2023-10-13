-- ROM module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR(1 downto 0);
           data_out : out STD_LOGIC_VECTOR(7 downto 0));
end ROM;

architecture Behavioral of ROM is
    type ROM_ARRAY is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0);
    constant ROM_CONTENT : ROM_ARRAY := (
        "01010011",  -- Address 00
        "11110000",  -- Address 01
        "00000000",  -- Address 10
        "11000111"   -- Address 11
    );
begin
    data_out <= ROM_CONTENT(to_integer(unsigned(address)));
end Behavioral;

-- Test bench for the ROM module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_tb is
end ROM_tb;

architecture Behavioral of ROM_tb is
    signal address : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal data_out : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Instantiate the ROM module
    ROM_inst : entity work.ROM
        port map (
            address => address,
            data_out => data_out
        );

    -- Stimulus process
    process
    begin
        address <= "00";
        wait for 10 ns;
        address <= "01";
        wait for 10 ns;
        address <= "10";
        wait for 10 ns;
        address <= "11";
        wait for 10 ns;
        wait;
    end process;

    -- Display the output
    process
    begin
        wait for 5 ns;  -- Wait for initial settling
        report "Address = " & to_string(address) & ", Data Out = " & to_string(data_out);
        wait;
    end process;

end Behavioral;
