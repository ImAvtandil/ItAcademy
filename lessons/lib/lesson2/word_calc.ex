defmodule WordCalc do
    
    def calc(text) do
        String.split(text)
        |> Enum.reduce(%{}, fn(word, acc)-> 
            Map.put(acc, word, 1)
        end)
        |> Map.keys
        |> length
    end
end