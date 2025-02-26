library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VendingMachine_tb is
end VendingMachine_tb;

architecture Behavioral of VendingMachine_tb is
    signal coin     : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal button   : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal dispense : STD_LOGIC_VECTOR(3 downto 0);
    signal change   : STD_LOGIC_VECTOR(1 downto 0);

    component VendingMachine
        Port (
            coin     : in  STD_LOGIC_VECTOR(1 downto 0);
            button   : in  STD_LOGIC_VECTOR(2 downto 0);
            dispense : out STD_LOGIC_VECTOR(3 downto 0);
            change   : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;
begin
    uut: VendingMachine
        Port map (
            coin => coin,
            button => button,
            dispense => dispense,
            change => change
        );

    -- Test sequence
    process
    begin
        -- Insert 25 kuruş, select Product A
        coin <= "01"; 
        wait for 10 ns;
        button <= "001"; 
        wait for 10 ns;

        coin <= "00"; button <= "000"; wait for 10 ns;
        
        -- Insert 50 kuruş, select Product B
        coin <= "10"; 
        wait for 10 ns;
        button <= "010"; 
        wait for 10 ns;

        coin <= "00"; button <= "000"; wait for 10 ns;

        -- Insert 1 lira, select Product C
        coin <= "11";
        wait for 10 ns;
        button <= "011"; 
        wait for 10 ns;
        
        coin <= "00"; button <= "000"; wait for 10 ns;
        
        -- Insert 1 lira, select Product A
        coin <= "11";
        wait for 10 ns;
        button <= "001";
        wait for 50 ns;

        coin <= "00"; button <= "000"; wait for 10 ns;
        
        -- Insert 1 lira, select Product B
        coin <= "11";
        wait for 10 ns;
        button <= "010";
        wait for 50 ns;


        wait;
    end process;
end Behavioral;