library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VendingMachine is
    Port (
        coin     : in  STD_LOGIC_VECTOR(1 downto 0); -- 2-bit coin input
        button   : in  STD_LOGIC_VECTOR(2 downto 0); -- 3-bit button input
        dispense : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit product dispense output
        change   : out STD_LOGIC_VECTOR(1 downto 0)  -- 2-bit change output
    );
end VendingMachine;

architecture Behavioral of VendingMachine is
    signal total : integer := 0; -- Tracks the total money inserted
begin
    process(coin, button)
        variable temp_total : integer := 0; -- Temp variable to hold updated total value
        variable cost : integer := 0; -- Temp variable to hold updated total value
    begin
        -- Defaults
        dispense <= "0000";
        change <= "00";

        -- Update temp_total based on coin input
        case coin is
            when "01" => temp_total :=  25; -- 25 kuruş
            when "10" => temp_total :=50; -- 50 kuruş
            when "11" => temp_total :=100; -- 1 lira
            when others => temp_total := 0; -- No coin
        end case;
        
        
         case button is
            when "000" => cost := 0; -- 0 kuruş
            when "001" => cost :=50; -- 50 kuruş (Product A)
            when "010" => cost :=75; -- 75 kuruş (Product B)
            when "011" => cost :=100; -- 1 lira  (Product C)
            when "100" => cost :=100; -- 1 lira  (Product D)
            when others => temp_total := 0; -- No coin
        end case;


        -- Dispense logic
        if button = "001" then -- Product A (50 kuruş)
            if temp_total >= 50 then
                dispense <= "0001";
                temp_total := temp_total - 50;
            end if;
        elsif button = "010" then -- Product B (75 kuruş)
            if temp_total >= 75 then
                dispense <= "0010";
                temp_total := temp_total - 75;
            end if;
        elsif button = "011" then -- Product C (1 lira)
            if temp_total >= 100 then
                dispense <= "0011";
                temp_total := temp_total - 100;
            end if;
        elsif button = "100" then -- Product D (1 lira)
            if temp_total >= 100 then
                dispense <= "1000";
                temp_total := temp_total - 100;
            end if;
        end if;
        
        -- Change logic
     
        if button /= "000" then
            if temp_total >= 50 and total > cost then
                change <= "10"; -- 50 kuruş change
            elsif temp_total >= 25 and total > cost then
                change <= "01"; -- 25 kuruş change
            else
                change <= "00"; -- No change
            end if;
        end if;
        
        if button = "000" then
         change <= "00";
         
        end if;
    

        -- Update the global total signal
        total <= temp_total;
    end process;
end Behavioral;
